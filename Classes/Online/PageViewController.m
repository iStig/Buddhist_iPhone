    //
//  PageViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-9.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "PageViewController.h"
#import "SettingData.h"

@implementation PageViewController

static NSString* X42_734 = @"http://www.cbeta.org/result/normal/X42/0734_009.htm";

@synthesize m_volumnNo;
@synthesize m_lectionNo;
@synthesize m_subvolumnNo;
@synthesize m_lectionName;
@synthesize m_webView;
@synthesize m_loadingIndicator;

-(NSString *)makeUrl
{
    NSMutableString *url  = [[[NSMutableString alloc]initWithFormat: @"http://www.cbeta.org/result/normal/"]autorelease] ;
	[url appendString:self.m_volumnNo ];
	[url appendString:[self addZeroToLectionNo:self.m_lectionNo]];
    [url appendString:[self addZeroToSubVoluNo:self.m_subvolumnNo]];
	return url;

}


-(NSString *) addZeroToLectionNo :(NSString *) oldLecNo
{
	NSMutableString *lecNo = [[[NSMutableString alloc]initWithFormat:@"%@",oldLecNo]autorelease];
	switch ([lecNo length]) {
		case  1:
			[lecNo insertString:@"/000" atIndex:0];
			[lecNo appendString:@"_"];
			break;
		case 2:
			[lecNo insertString:@"/00" atIndex:0];
			[lecNo appendString:@"_"];
			break;
		case 3:
			[lecNo insertString:@"/0" atIndex:0];
			[lecNo appendString:@"_"];
			break;
		case 4:
		{   if([lecNo intValue]<1000)
		    {
				[lecNo insertString:@"/0" atIndex:0];
			}
			else {
				[lecNo insertString:@"/" atIndex:0];
				[lecNo appendString:@"_"];
			}
			break;
		}
		case 5:
			[lecNo insertString:@"/" atIndex:0];
			break;
	
		default:
			break;
	}
	return lecNo;

}
-(NSString *) addZeroToSubVoluNo :(NSString *) oldSubVolNo
{
	NSMutableString *SubVolNo = [[[NSMutableString alloc]initWithFormat:@"%@",oldSubVolNo]autorelease];
	switch ([SubVolNo length]) {
		case 1:
			[SubVolNo insertString:@"00" atIndex:0];
			[SubVolNo appendString:@".htm"];
			break;
		case 2:
			[SubVolNo insertString:@"0" atIndex:0];
			[SubVolNo appendString:@".htm"];
			break;
		case 3:
		  //[SubVolNo insertString:@"_" atIndex:0];
			[SubVolNo appendString:@".htm"];
			break;
		
		default:
			break;
	}
	return SubVolNo;
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	m_webView.delegate = self;
	m_loadingIndicator = [[LoadingIndicatorView alloc] initWithNibName:@"LoadingIndicatorView" bundle:nil];
	CGRect frame = CGRectMake(110.0, 172.0, 80, 60);
	m_loadingIndicator.view.frame = frame;
	[self.m_webView addSubview:m_loadingIndicator.view];
	m_loadingIndicator.view.hidden = NO;
	[m_loadingIndicator startAnimating];
	
	//UIBarButtonItem* addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
//																			  target:self action:@selector(saveAction)];
//	self.navigationItem.rightBarButtonItem = addItem;
//	[addItem release];
	
	NSMutableString *sublecName =[NSMutableString stringWithString:self.m_subvolumnNo];
	[sublecName appendString:self.m_lectionName];
	self.title = sublecName;
	
	if ([self.m_volumnNo isEqualToString:@"X42"]&&[self.m_lectionNo isEqualToString:@"734"]) {
		
		[self.m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:X42_734]]];
	}else {
		
		[self.m_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self makeUrl]]]];
	}

	self.m_webView.scalesPageToFit = YES;
    [super viewDidLoad];
	
	
}

//-(void)saveAction 
//{
//	SettingData *setData;
//	setData = [SettingData sharedSettingData];
//    [setData addCollectionPageMarks: m_volumnNo withLection: m_lectionNo withSubVo
//								   : m_subvolumnNo withlectionName:m_lectionName withUrl:[self makeUrl]];
//    
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"Collection added"
//												   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//	[alert show];
//	[alert release];
//}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[m_volumnNo release];
	[m_lectionNo release];
	[m_subvolumnNo release];
	[m_lectionName release];
	[m_webView release];
	[m_loadingIndicator release];
	
    [super dealloc];
}


#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[m_loadingIndicator stopAnimating];
	[m_loadingIndicator.view removeFromSuperview];
	//m_loadingIndicator.view.hidden = YES;

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息"
													message:@"请检查网络是否连接正确"
												   delegate:nil
										  cancelButtonTitle:@"ok"
										  otherButtonTitles:nil];
	[alter show];
	[alter release];
	
}

@end
