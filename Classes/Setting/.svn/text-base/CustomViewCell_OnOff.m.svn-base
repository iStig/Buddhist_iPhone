//
//  CustomViewCell_OnOff.m
//  mobilebook
//
//  Created by Liu Xionghui on 10-1-12.
//  Copyright 2010 SmilingMobile Inc. All rights reserved.
//

#import "CustomViewCell_OnOff.h"
#import "Setting_Define.h"

@implementation CustomViewCell_OnOff

@synthesize onButton;
@synthesize offButton;
@synthesize onorOffLabel;

-(void)initimg
{
	onButtonImg_on  = [UIImage imageNamed:@"on_1.png"];
	onButtonImg_off = [UIImage imageNamed:@"on_2.png"];
	offButtonImg_on  = [UIImage imageNamed:@"off_1.png"];
	offButtonImg_off = [UIImage imageNamed:@"off_2.png"];
	currentstatus = NO;
}

-(void)getStatus: (BOOL*)status
{
	*status = currentstatus;
}

-(void)setStatus:(BOOL)status
{
	currentstatus = status;
	if(YES == status)
	{
		[onButton setImage:onButtonImg_on forState: UIControlStateNormal];
		[onButton setImage:onButtonImg_on forState: UIControlStateHighlighted];
		[onButton setImage:onButtonImg_on forState: UIControlStateDisabled];
		[onButton setImage:onButtonImg_on forState: UIControlStateSelected];
		[onButton setImage:onButtonImg_on forState: UIControlStateApplication];
		[onButton setImage:onButtonImg_on forState: UIControlStateReserved];
		
		[offButton setImage:offButtonImg_off forState: UIControlStateNormal];
		[offButton setImage:offButtonImg_off forState: UIControlStateHighlighted];
		[offButton setImage:offButtonImg_off forState: UIControlStateDisabled];
		[offButton setImage:offButtonImg_off forState: UIControlStateSelected];
		[offButton setImage:offButtonImg_off forState: UIControlStateApplication];
		[offButton setImage:offButtonImg_off forState: UIControlStateReserved];
	}
	else
	{
		[onButton setImage:onButtonImg_off forState: UIControlStateNormal];
		[onButton setImage:onButtonImg_off forState: UIControlStateHighlighted];
		[onButton setImage:onButtonImg_off forState: UIControlStateDisabled];
		[onButton setImage:onButtonImg_off forState: UIControlStateSelected];
		[onButton setImage:onButtonImg_off forState: UIControlStateApplication];
		[onButton setImage:onButtonImg_off forState: UIControlStateReserved];
		
		[offButton setImage:offButtonImg_on forState: UIControlStateNormal];
		[offButton setImage:offButtonImg_on forState: UIControlStateHighlighted];
		[offButton setImage:offButtonImg_on forState: UIControlStateDisabled];
		[offButton setImage:offButtonImg_on forState: UIControlStateSelected];
		[offButton setImage:offButtonImg_on forState: UIControlStateApplication];
		[offButton setImage:offButtonImg_on forState: UIControlStateReserved];
	}
}

-(IBAction)buttonPressed:(id)sender
{
	if(YES==currentstatus)
	{
		currentstatus = NO;
	}
	else 
	{
		currentstatus = YES;
	}
	[self setStatus:currentstatus];

	NSLog(@"\nOnorOffSwitch.tag = %d\n",onorOffLabel.tag) ; 
	switch (onorOffLabel.tag) {
		case TAG_AnimationOn:
			[[NSNotificationCenter defaultCenter] postNotificationName:Notification_AnimationOn object:nil];
			break;
		case TAG_SoundOn:
			[[NSNotificationCenter defaultCenter] postNotificationName:Notification_SoundOn object:nil];
			break;
		case TAG_AutoScrollOn:
			[[NSNotificationCenter defaultCenter] postNotificationName:Notification_AutoScrollOn object:nil];
			break;
		case TAG_ManualPaging:
			[[NSNotificationCenter defaultCenter] postNotificationName:Notification_ManualPaging object:nil];
			break;
		default:
			break;
	}
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[onButton release];
	[offButton release];
	[onorOffLabel release];
	//[onButtonImg_on release];
//	[onButtonImg_off release];
//	[offButtonImg_on release];
//	[offButtonImg_off release];
    [super dealloc];
}


@end
