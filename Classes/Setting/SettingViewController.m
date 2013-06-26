//
//  SettingViewController.m
//  mobilebook
//
//  Created by Victor on 1/4/10.
//  Copyright 2010 SmilingMobile Inc. All rights reserved.
//

#import "SettingViewController.h"
#import "CustomViewCell_OnOff.h"
#import "CustomViewCell_FontSize.h"
#import "CustomViewCell_Background.h"
#import "CustomViewCell_AutoScrollSpeed.h"
#import "SetBackground.h"
#import "Setting_Define.h"
#import "SettingData.h"

NSUInteger FontSize;
NSUInteger AutoScrollSpeed;
BOOL ManualPaging;
BOOL SoundOn;
BOOL AutoScrollOn;
BOOL AnimationOn;

@implementation SettingViewController
@synthesize ptableView;

- (void)viewWillDisappear:(BOOL)animated
{
	[self updatesettingtofiles];
	[super viewWillDisappear:animated];
}

- (void) updatesettingtofiles
{
	SettingData * paramssetting = [SettingData sharedSettingData];
	[paramssetting updateFontSize:FontSize];
//	[paramssetting updateFontType:FontType];
	[paramssetting updateAutoScrollSpeed:AutoScrollSpeed];
	[paramssetting updateManualPagingOn:ManualPaging];
	[paramssetting updatePagingSound:SoundOn];
	[paramssetting updateAutoScrollOn:AutoScrollOn];
	[paramssetting updatePagingAnimation:AnimationOn];
}

-(void)viewWillAppear:(BOOL)animated{

	SettingData * paramssetting = [SettingData sharedSettingData];
	
	ManualPaging = paramssetting.manualPagingOn;
	SoundOn = paramssetting.pagingSoundOn;
	AutoScrollOn = paramssetting.autoScrollOn;
	AnimationOn = paramssetting.pagingAnimationOn;
	AutoScrollSpeed = paramssetting.autoScrollSpeed;
	FontSize = paramssetting.fontSizeIndex;


}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad {
//	SettingData * paramssetting = [SettingData sharedSettingData];
//	
//	ManualPaging = paramssetting.manualPagingOn;
//	SoundOn = paramssetting.pagingSoundOn;
//	AutoScrollOn = paramssetting.autoScrollOn;
//	AnimationOn = paramssetting.pagingAnimationOn;
//	AutoScrollSpeed = paramssetting.autoScrollSpeed;
//	FontSize = paramssetting.fontSizeIndex;
    
//	FontType = paramssetting.FontType;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(animationOnCall)	name: Notification_AnimationOn object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(soundOnCall)	name: Notification_SoundOn object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(autoScrollOnCall)	name: Notification_AutoScrollOn object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(manualPagingOnCall)	name: Notification_ManualPaging object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setFontSize)	name: Notification_FontSize object:nil];

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setAutoScrollSpeed)	name: Notification_AutoScrollSpeed object:nil];
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setFontType)	name: Notification_FontType object:nil];
	[super viewDidLoad];
}

//Victor changed the callback functions

- (void) animationOnCall{
	CustomViewCell_OnOff *cell = (CustomViewCell_OnOff *)[ptableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
	[cell getStatus:&AnimationOn];
}
- (void) soundOnCall{
	CustomViewCell_OnOff *cell = (CustomViewCell_OnOff *)[ptableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
	[cell getStatus:&SoundOn];
}
- (void) autoScrollOnCall{
	CustomViewCell_OnOff *cell = (CustomViewCell_OnOff *)[ptableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:1]];
	[cell getStatus:&AutoScrollOn];
}
- (void) manualPagingOnCall{
	CustomViewCell_OnOff *cell = (CustomViewCell_OnOff *)[ptableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
	[cell getStatus:&ManualPaging];
}

- (void) setFontSize
{
	CustomViewCell_FontSize *cell = (CustomViewCell_FontSize *)[ptableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
	[cell getStatus:&FontSize];
}

- (void) setAutoScrollSpeed
{
	CustomViewCell_AutoScrollSpeed *cell = (CustomViewCell_AutoScrollSpeed *)[ptableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
	[cell getStatus:&AutoScrollSpeed];

}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[ptableView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
	switch(section) 
	{
		case 0:
			//return 2;
			return 3;
			break;
		case 1:
			return 4;//5;
			break;
		default:
			return 0;
			break;
	}
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	
	if(section == 0)
	{
		if(0==row)
		{
			static NSString *sectionsTableIdentifier = @"CustomViewCell_Background_ID";
			CustomViewCell_Background *cell = (CustomViewCell_Background *)[aTableView dequeueReusableCellWithIdentifier: sectionsTableIdentifier];
			if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomViewCell_Background" 
															 owner:self options:nil];
#ifdef __IPHONE_2_1
				cell = (CustomViewCell_Background *)[nib objectAtIndex:0];
#else
				cell = (CustomViewCell_Background *)[nib objectAtIndex:1];
#endif
			}
			//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
			return cell;
		}
		else if(1==row)
		{
			static NSString *sectionsTableIdentifier = @"CustomViewCell_FontSize_ID";
			
			CustomViewCell_FontSize *cell = (CustomViewCell_FontSize *)[aTableView dequeueReusableCellWithIdentifier: sectionsTableIdentifier];
			if (cell == nil) {
				NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomViewCell_FontSize" 
															 owner:self options:nil];
#ifdef __IPHONE_2_1
				cell = (CustomViewCell_FontSize *)[nib objectAtIndex:0];
#else
				cell = (CustomViewCell_FontSize *)[nib objectAtIndex:1];
#endif
			}
			[cell initimg];
			[cell setStatus:FontSize];
			return cell;
		}
		else if(2==row)
		{
			static NSString *sectionsTableIdentifier = @"CustomViewCell_AutoScrollSpeed_ID";
			
			CustomViewCell_AutoScrollSpeed *cell = (CustomViewCell_AutoScrollSpeed *)[aTableView dequeueReusableCellWithIdentifier: sectionsTableIdentifier];
			if (cell == nil) {
				NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomViewCell_AutoScrollSpeed" 
															 owner:self options:nil];
#ifdef __IPHONE_2_1
				cell = (CustomViewCell_AutoScrollSpeed *)[nib objectAtIndex:0];
#else
				cell = (CustomViewCell_AutoScrollSpeed *)[nib objectAtIndex:1];
#endif
			}
			[cell initimg];
			[cell setStatus:AutoScrollSpeed];
			return cell;
		}
	}
	else if(section == 1)
	{
		static NSString *sectionsTableIdentifier = @"CustomViewCell_OnOff_ID";
		
		CustomViewCell_OnOff *cell = (CustomViewCell_OnOff *)[aTableView dequeueReusableCellWithIdentifier: sectionsTableIdentifier];
		if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomViewCell_OnOff" 
														 owner:self options:nil];
#ifdef __IPHONE_2_1
			cell = (CustomViewCell_OnOff *)[nib objectAtIndex:0];
#else
			cell = (CustomViewCell_OnOff *)[nib objectAtIndex:1];
#endif
		}
		
		switch (row) {
			case 1:
				cell.onorOffLabel.text = NSLocalizedString(@"页面动画", @"");
				[cell initimg];
				[cell setStatus:AnimationOn];
				cell.onorOffLabel.tag = TAG_AnimationOn;
				NSLog(@"\nTAG_AnimationOn OnorOffSwitch.tag = %d\n",cell.onorOffLabel.tag) ; 
				break;
			case 2:
				cell.onorOffLabel.text = NSLocalizedString(@"翻页声音", @"");
				[cell initimg];
				[cell setStatus:SoundOn];
				cell.onorOffLabel.tag = TAG_SoundOn;
				NSLog(@"\n TAG_SoundOn OnorOffSwitch.tag = %d\n",cell.onorOffLabel.tag) ; 
				break;
			case 3:
				cell.onorOffLabel.text =  NSLocalizedString(@"自动换行", @"");
				[cell initimg];
				[cell setStatus:AutoScrollOn];
				cell.onorOffLabel.tag = TAG_AutoScrollOn;
				NSLog(@"\nTAG_AutoScrollOn OnorOffSwitch.tag = %d\n",cell.onorOffLabel.tag) ; 
				break;
			case 0:
				cell.onorOffLabel.text = NSLocalizedString(@"滑动翻书", @"");
				[cell initimg];
				[cell setStatus:ManualPaging];
				cell.onorOffLabel.tag = TAG_ManualPaging;
				NSLog(@"\nTAG_ManualPaging OnorOffSwitch.tag = %d\n",cell.onorOffLabel.tag) ; 
				break;
			default:
				break;
		}
		return cell;
	}
	return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	switch (section) {
		case 0:
			return NSLocalizedString(@"基本设置", @"");
			break;
		case 1:
			return NSLocalizedString(@"高级设置", @"");
			break;
		default:
			return @"看见这个说明程序bug";
			break;
	}	
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];

	if(0==section&&0==row)
	{
		SetBackground *backgroundController = [[SetBackground alloc]initWithNibName:@"SetBackground" bundle:nil];
		[self.navigationController pushViewController:backgroundController animated:YES];
		[backgroundController release];
	}
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	if(0==section&&1==row)
	{
		//return 60;
		return 44;
	}
	else
	{
		return 44;
	}
}
*/
- (void)tableView:(UITableView *)tableView 
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	
	if(0==section&&0==row)
	{
		SetBackground *backgroundController = [[SetBackground alloc]initWithNibName:@"SetBackground" bundle:nil];
		[self.navigationController pushViewController:backgroundController animated:YES];
		[backgroundController release];
	}
}

@end
