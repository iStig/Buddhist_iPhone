//
//  cbetaAppDelegate.m
//  cbeta
//
//  Created by jishen on 5/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "cbetaAppDelegate.h"


@implementation cbetaAppDelegate

@synthesize window;
@synthesize m_tabBarController;
@synthesize networkingCount;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Add the tab bar controller's current view as a subview of the window
    
  // CGFloat h=   [[UIScreen mainScreen] bounds].size.height;
    
  //  m_tabBarController.tabBar.frame=CGRectMake(0,h-49 , 320, 49);
    
    
  
   [window addSubview:m_tabBarController.view];
    
   
    //[self.window bringSubviewToFront:m_tabBarController.view];
    [window makeKeyAndVisible];
    application.applicationSupportsShakeToEdit = YES;//添加此处
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isNight"];//默认白天模式
    if (FREE) {
    
    //增加标识，用于判断是否是第一次启动应用...
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"launchAlertViewShowAgain"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"alertViewShowAgain"];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchAlertViewShowAgain"]) {
        
        
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"大藏经完全版提供更好阅读体验，点击下载"
                                                       delegate:self
                                              cancelButtonTitle:@"去下载"
                                              otherButtonTitles:@"下次不再提醒",@"取消",nil];
        [alter show];
        [alter release];
    }
        
    }
    
	return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:APPURL]];
        NSLog(@"%d",buttonIndex);
    }else if(buttonIndex==1){
        [[NSUserDefaults standardUserDefaults] setBool:REPEATSHOWALERTVIEW forKey:@"launchAlertViewShowAgain"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"%d",buttonIndex);
    }else if(buttonIndex==2){
        NSLog(@"%d",buttonIndex);
    }
}





- (NSString *)pathForTemporaryFileWithPrefix:(NSString *)prefix
{
    NSString *  result;
	NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *doucumentDirectory=[path objectAtIndex:0];
    result=[doucumentDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@.zip", prefix]];
    assert(result != nil);
    return result;
}
- (NSURL *)smartURLForString:(NSString *)str
{
    NSURL *     result;
    NSString *  trimmedStr;
    NSRange     schemeMarkerRange;
    NSString *  scheme;
    
    assert(str != nil);
	
    result = nil;
    
    trimmedStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( (trimmedStr != nil) && (trimmedStr.length != 0) ) {
        schemeMarkerRange = [trimmedStr rangeOfString:@"://"];
        
        if (schemeMarkerRange.location == NSNotFound) {
            result = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", trimmedStr]];
        } else {
            scheme = [trimmedStr substringWithRange:NSMakeRange(0, schemeMarkerRange.location)];
            assert(scheme != nil);
            
            if ( ([scheme compare:@"http"  options:NSCaseInsensitiveSearch] == NSOrderedSame)
				|| ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) ) {
                result = [NSURL URLWithString:trimmedStr];
            } else {
                // It looks like this is some unsupported URL scheme.
            }
        }
    }
    
    return result;
}


+ (cbetaAppDelegate *)sharedAppDelegate
{
    return (cbetaAppDelegate *) [UIApplication sharedApplication].delegate;
}


- (void)didStartNetworking
{
    self.networkingCount += 1;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didStopNetworking
{
   //assert(self.networkingCount > 0);
    self.networkingCount -= 1;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = (self.networkingCount != 0);
}


- (void)dealloc {
    [m_tabBarController release];
    [window release];
    [super dealloc];
}

@end

