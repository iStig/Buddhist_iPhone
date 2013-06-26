//
//  DownloadTableCell.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-2.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "DownloadTableCell.h"
#import "DownloadViewController.h"

@implementation DownloadTableCell

//@synthesize m_downloadButton;
@synthesize m_info;
/*
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier

{
	return nil;

}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
		UILabel *m_info = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 219, 25)];
		m_info.backgroundColor =[UIColor clearColor];
		[self.view addSubview:m_info];
		[m_info release];
		
		UIButton * m_downloadButton = [UIButton alloc]initWithFrame:CGRectMake(247, 11, 53, 29);
    }
    return self;
	
	[m_downloadButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

*/
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:animated];
	
}
/*
- (IBAction)buttonPressed:(id)sender
{
	//MVImageViewController* imageViewController = [[MVImageViewController alloc] init];
	//imageViewController.modalDelegate = self;
	DownloadViewController* downloadViewController = [[DownloadViewController alloc]initWithNibName
													  :@"DownloadViewController" bundle:nil];
	UINavigationController* navigation = [[UINavigationController alloc]initWithRootViewController:downloadViewController];
	
	UIButton *senderButton = (UIButton *)sender;
    UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
	
	UIViewController *popViewController = [[UIViewController alloc]init];
	[popViewController presentModalViewController:navigation animated:YES];
	[downloadViewController release];
	[navigation release];
	[popViewController release];
	 
	NSLog(@"fdfd");
}
 */
/*
-(IBAction)pushSingleDownLoadView
{
	
	SettingData *settingData = [SettingData sharedSettingData];
	
	singleDownLoad *detailViewController = [[singleDownLoad alloc] initWithNibName:@"singleDownLoad" bundle:nil] ;
	self.m_singleDown = detailViewController;
	[detailViewController release];
	
	CATransition *animation = [CATransition animation];
    animation.duration = 0.3f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.fillMode = kCAFillModeForwards;
	animation.type = kCATransitionMoveIn;
	animation.subtype = kCATransitionFromTop;
	[self.view.layer addAnimation:animation forKey:@"animation"];
	[self.view addSubview:self.m_singleDown.view];
	
	[NSTimer scheduledTimerWithTimeInterval:0.28f
									 target:self selector:@selector(hideNavBar)
								   userInfo:nil repeats:NO];	
}
 
 */


- (void)dealloc {
	[m_info release];
	//[m_downloadButton release];
    [super dealloc];
}

@end
