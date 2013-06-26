//
//  SetBackground.h
//  mobilebook
//
//  Created by Liu Xionghui on 10-1-14.
//  Copyright 2010 SmilingMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SetBackground : UIViewController {
	IBOutlet UIImageView *backGroundImg;
	IBOutlet UISlider    *alphaSlider;
	IBOutlet UILabel     *backGroundImgTitle;
	IBOutlet UILabel     *brightnessTitle;
	IBOutlet UILabel     *fontColorTitle;
	NSUInteger			  DefaultSeting[8];
	NSUInteger			  backGroundImgIndex;
	NSUInteger			  fontColorIndex;
	UIColor				 *ColorValues[12];
	NSString			 *BackGroundImgName[8];
	CGFloat backgroundAlpha;
}
@property (nonatomic, retain) UIImageView *backGroundImg;
@property (nonatomic, retain) UISlider    *alphaSlider;
@property (nonatomic, retain)  UILabel    *backGroundImgTitle;
@property (nonatomic, retain)  UILabel    *brightnessTitle;
@property (nonatomic, retain)  UILabel    *fontColorTitle;
@property (nonatomic) CGFloat backgroundAlpha;

-(IBAction)backgroundImgButtonPressed:(id)sender;
-(IBAction)fontColorButtonPressed:(id)sender;
-(IBAction)alphaValueChanged:(id)sender;

- (void)viewWillDisappear:(BOOL)animated;
@end
