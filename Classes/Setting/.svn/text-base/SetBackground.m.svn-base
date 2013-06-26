//
//  SetBackground.m
//  mobilebook
//
//  Created by Liu Xionghui on 10-1-14.
//  Copyright 2010 SmilingMobile Inc. All rights reserved.
//

#import "SetBackground.h"
#import "SettingData.h"
#import "Setting_Define.h"


@implementation SetBackground
@synthesize backGroundImg;
@synthesize alphaSlider;
@synthesize backGroundImgTitle;
@synthesize brightnessTitle;
@synthesize fontColorTitle;
@synthesize backgroundAlpha;

- (void)viewWillDisappear:(BOOL)animated
{
	SettingData * paramssetting = [SettingData sharedSettingData];
	[paramssetting updateFontColorId:fontColorIndex];
	[paramssetting updateBackgroundFile:backGroundImgIndex];
	[paramssetting updateBackgroundAlpha: backgroundAlpha];
	[super viewWillDisappear:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = NSLocalizedString(@"背景和颜色", @""); 
	
	//每一种背景对应的default的字体颜色设置。 1～12
	DefaultSeting[0] = 2;
	DefaultSeting[1] = 1;
	DefaultSeting[2] = 1;
	DefaultSeting[3] = 1;
	DefaultSeting[4] = 1;
	DefaultSeting[5] = 1;
	DefaultSeting[6] = 1;
	DefaultSeting[7] = 1;
	
	ColorValues[0]  = [[UIColor alloc] initWithRed:(31.0f/255) green:(26.0f/255) blue:(23.0f/255) alpha:1];
	ColorValues[1]  = [[UIColor alloc] initWithRed:(255.0f/255) green:(255.0f/255) blue:(255.0f/255) alpha:1];
	ColorValues[2]  = [[UIColor alloc] initWithRed:(221.0f/255) green:(19.0f/255) blue:(123.0f/255) alpha:1];
	ColorValues[3]  = [[UIColor alloc] initWithRed:(231.0f/255) green:(120.0f/255) blue:(23.0f/255) alpha:1];
	ColorValues[4]  = [[UIColor alloc] initWithRed:(255.0f/255) green:(245.0f/255) blue:(0/255) alpha:1];
	ColorValues[5]  = [[UIColor alloc] initWithRed:(0/255) green:(146.0f/255) blue:(63.0f/255) alpha:1];
	ColorValues[6]  = [[UIColor alloc] initWithRed:(0/255) green:(124.0f/255) blue:(195.0f/255) alpha:1];
	ColorValues[7]  = [[UIColor alloc] initWithRed:(186.0f/255) green:(179.0f/255) blue:(214.0f/255) alpha:1];
	ColorValues[8]  = [[UIColor alloc] initWithRed:(112.0f/255) green:(97.0f/255) blue:(78.0f/255) alpha:1];
	ColorValues[9]  = [[UIColor alloc] initWithRed:(132.0f/255) green:(194.0f/255) blue:(37.0f/255) alpha:1];
	ColorValues[10] = [[UIColor alloc] initWithRed:(255.0f/255) green:(251.0f/255) blue:(156.0f/255) alpha:1];
	ColorValues[11] = [[UIColor alloc] initWithRed:(113.0f/255) green:(111.0f/255) blue:(97.0f/255) alpha:1];
	
	BackGroundImgName[0] = @"01-1.png";
	BackGroundImgName[1] = @"02-1.png";
	BackGroundImgName[2] = @"03-1.png";
	BackGroundImgName[3] = @"04-1.png";
	BackGroundImgName[4] = @"05-1.png";
	BackGroundImgName[5] = @"06-1.png";
	BackGroundImgName[6] = @"07-1.png";
	BackGroundImgName[7] = @"08-1.png";
	
	SettingData * paramssetting = [SettingData sharedSettingData];
	backGroundImgIndex = paramssetting.backgroundImgIndex;
	fontColorIndex     = paramssetting.fontColorIndex;
	backgroundAlpha = paramssetting.backgroundAlpha;
	DefaultSeting[backGroundImgIndex] = fontColorIndex;
	
	//////////设置页面状态
	backGroundImgTitle.textColor = ColorValues[DefaultSeting[backGroundImgIndex-1]-1];
	brightnessTitle.textColor    = ColorValues[DefaultSeting[backGroundImgIndex-1]-1];
	fontColorTitle.textColor     = ColorValues[DefaultSeting[backGroundImgIndex-1]-1];
	backGroundImg.image          = [UIImage imageNamed:BackGroundImgName[backGroundImgIndex-1]];
	backGroundImg.alpha =  backgroundAlpha;
	alphaSlider.value = backgroundAlpha;
	
    [super viewDidLoad];
}

-(IBAction)backgroundImgButtonPressed:(id)sender
{
	UIButton * pressedbutton = (UIButton *) sender;
	backGroundImgIndex = pressedbutton.tag;
	
	backGroundImgTitle.textColor = ColorValues[DefaultSeting[backGroundImgIndex-1]-1];
	brightnessTitle.textColor    = ColorValues[DefaultSeting[backGroundImgIndex-1]-1];
	fontColorTitle.textColor     = ColorValues[DefaultSeting[backGroundImgIndex-1]-1];
	backGroundImg.image          = [UIImage imageNamed:BackGroundImgName[backGroundImgIndex-1]];
	//Victor fixed
	// Reset to default color
	fontColorIndex = DefaultSeting[backGroundImgIndex-1] ;
	//[[NSNotificationCenter defaultCenter] postNotificationName:Notification_BackGroundImg object:nil];
}

-(IBAction)fontColorButtonPressed:(id)sender
{
	UIButton * pressedbutton = (UIButton *) sender;
	fontColorIndex = pressedbutton.tag;
	//DefaultSeting[BackGroundImgIndex -1] = FontColorIndex;
	
	//BackGroundImgTitle.textColor = ColorValues[DefaultSeting[BackGroundImgIndex-1]-1];
	//BrightnessTitle.textColor    = ColorValues[DefaultSeting[BackGroundImgIndex-1]-1];
	//FontColorTitle.textColor     = ColorValues[DefaultSeting[BackGroundImgIndex-1]-1];
	backGroundImgTitle.textColor = ColorValues[fontColorIndex-1];
	brightnessTitle.textColor    = ColorValues[fontColorIndex-1];
	fontColorTitle.textColor     = ColorValues[fontColorIndex-1];
	backGroundImg.image          = [UIImage imageNamed:BackGroundImgName[backGroundImgIndex-1]];
	
	//[[NSNotificationCenter defaultCenter] postNotificationName:Notification_FontColor object:nil];
}

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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[backGroundImg release];
	[alphaSlider release];
	[backGroundImgTitle release];
	[brightnessTitle release];
	[fontColorTitle release];
	[ColorValues[0] release];
	[ColorValues[1] release];
	[ColorValues[2] release];
	[ColorValues[3] release];
	[ColorValues[4] release];
	[ColorValues[5] release];
	[ColorValues[6] release];
	[ColorValues[7] release];
	[ColorValues[8] release];
	[ColorValues[9] release];
	[ColorValues[10] release];
	[ColorValues[11] release];
    [super dealloc];
}

-(IBAction)alphaValueChanged:(id)sender{
	backgroundAlpha = alphaSlider.value;
	backGroundImg.alpha =  backgroundAlpha;
}

@end
