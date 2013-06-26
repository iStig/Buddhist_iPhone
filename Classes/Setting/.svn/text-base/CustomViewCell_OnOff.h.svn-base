//
//  CustomViewCell_OnOff.h
//  mobilebook
//
//  Created by Liu Xionghui on 10-1-12.
//  Copyright 2010 SmilingMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting_Define.h"

@interface CustomViewCell_OnOff : UITableViewCell {
	IBOutlet UIButton	* onButton;
	IBOutlet UIButton	* offButton;
	IBOutlet UILabel	* onorOffLabel;
	UIImage				* onButtonImg_on;
	UIImage				* onButtonImg_off;
	UIImage				* offButtonImg_on;
	UIImage				* offButtonImg_off;
	BOOL				  currentstatus;
}
@property (nonatomic,retain) UIButton  * onButton;
@property (nonatomic,retain) UIButton  * offButton;
@property (nonatomic,retain) UILabel  * onorOffLabel;

-(IBAction)buttonPressed:(id)sender;
- (void)setStatus: (BOOL)status;
- (void)getStatus: (BOOL*)status;
- (void)initimg;
@end
