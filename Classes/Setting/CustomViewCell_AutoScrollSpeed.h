//
//  CustomViewCell_AutoScollSpeed.h
//  cbeta
//
//  Created by chao he on 10-6-30.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomViewCell_AutoScrollSpeed : UITableViewCell {
	IBOutlet UIButton	* bigButton;
	IBOutlet UIButton	* midButton;
	IBOutlet UIButton	* smlButton;
	UIImage				* bigButtonImg_on;
	UIImage				* bigButtonImg_off;
	UIImage				* midButtonImg_on;
	UIImage				* midButtonImg_off;
	UIImage				* smlButtonImg_on;
	UIImage				* smlButtonImg_off;
	unsigned char		  currentstatus;
}
@property (nonatomic,retain) UIButton  * bigButton;
@property (nonatomic,retain) UIButton  * midButton;
@property (nonatomic,retain) UIButton  * smlButton;

-(IBAction)buttonPressed:(id)sender;
- (void)setStatus: (NSUInteger)status;
- (void)getStatus: (NSUInteger *)status;
- (void)initimg;

@end
