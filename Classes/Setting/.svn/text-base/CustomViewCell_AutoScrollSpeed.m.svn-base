//
//  CustomViewCell_AutoScollSpeed.m
//  cbeta
//
//  Created by chao he on 10-6-30.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "CustomViewCell_AutoScrollSpeed.h"
#import "Setting_Define.h"

@implementation CustomViewCell_AutoScrollSpeed

@synthesize bigButton;
@synthesize midButton;
@synthesize smlButton;

-(void)initimg
{
	bigButtonImg_on  = [UIImage imageNamed:@"Fast_1.png"];
	bigButtonImg_off = [UIImage imageNamed:@"Fast_2.png"];
	midButtonImg_on  = [UIImage imageNamed:@"Middle_1.png"];
	midButtonImg_off = [UIImage imageNamed:@"Middle_2.png"];
	smlButtonImg_on  = [UIImage imageNamed:@"Slow_1.png"];
	smlButtonImg_off = [UIImage imageNamed:@"Slow_2.png"];
	currentstatus = 2;
}

-(void)getStatus: (NSUInteger *)status
{
	*status = currentstatus;
}

-(void)setStatus:(NSUInteger)status
{
	currentstatus = status;
	switch (currentstatus)
	{
		case 6:
			[bigButton setImage:bigButtonImg_off forState: UIControlStateNormal];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateHighlighted];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateDisabled];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateSelected];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateApplication];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateReserved];
			
			[midButton setImage:midButtonImg_off forState: UIControlStateNormal];
			[midButton setImage:midButtonImg_off forState: UIControlStateHighlighted];
			[midButton setImage:midButtonImg_off forState: UIControlStateDisabled];
			[midButton setImage:midButtonImg_off forState: UIControlStateSelected];
			[midButton setImage:midButtonImg_off forState: UIControlStateApplication];
			[midButton setImage:midButtonImg_off forState: UIControlStateReserved];
			
			[smlButton setImage:smlButtonImg_on forState: UIControlStateNormal];
			[smlButton setImage:smlButtonImg_on forState: UIControlStateHighlighted];
			[smlButton setImage:smlButtonImg_on forState: UIControlStateDisabled];
			[smlButton setImage:smlButtonImg_on forState: UIControlStateSelected];
			[smlButton setImage:smlButtonImg_on forState: UIControlStateApplication];
			[smlButton setImage:smlButtonImg_on forState: UIControlStateReserved];
			break;
		case 4:
			[bigButton setImage:bigButtonImg_off forState: UIControlStateNormal];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateHighlighted];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateDisabled];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateSelected];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateApplication];
			[bigButton setImage:bigButtonImg_off forState: UIControlStateReserved];
			
			[midButton setImage:midButtonImg_on forState: UIControlStateNormal];
			[midButton setImage:midButtonImg_on forState: UIControlStateHighlighted];
			[midButton setImage:midButtonImg_on forState: UIControlStateDisabled];
			[midButton setImage:midButtonImg_on forState: UIControlStateSelected];
			[midButton setImage:midButtonImg_on forState: UIControlStateApplication];
			[midButton setImage:midButtonImg_on forState: UIControlStateReserved];
			
			[smlButton setImage:smlButtonImg_off forState: UIControlStateNormal];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateHighlighted];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateDisabled];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateSelected];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateApplication];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateReserved];
			break;
		case 2:
			[bigButton setImage:bigButtonImg_on forState: UIControlStateNormal];
			[bigButton setImage:bigButtonImg_on forState: UIControlStateHighlighted];
			[bigButton setImage:bigButtonImg_on forState: UIControlStateDisabled];
			[bigButton setImage:bigButtonImg_on forState: UIControlStateSelected];
			[bigButton setImage:bigButtonImg_on forState: UIControlStateApplication];
			[bigButton setImage:bigButtonImg_on forState: UIControlStateReserved];
			
			[midButton setImage:midButtonImg_off forState: UIControlStateNormal];
			[midButton setImage:midButtonImg_off forState: UIControlStateHighlighted];
			[midButton setImage:midButtonImg_off forState: UIControlStateDisabled];
			[midButton setImage:midButtonImg_off forState: UIControlStateSelected];
			[midButton setImage:midButtonImg_off forState: UIControlStateApplication];
			[midButton setImage:midButtonImg_off forState: UIControlStateReserved];
			
			[smlButton setImage:smlButtonImg_off forState: UIControlStateNormal];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateHighlighted];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateDisabled];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateSelected];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateApplication];
			[smlButton setImage:smlButtonImg_off forState: UIControlStateReserved];
			break;
		default:
			break;
	}
}

-(IBAction)buttonPressed:(id)sender
{
	UIButton * pressedbutton = (UIButton *) sender;
	currentstatus = pressedbutton.tag;
	[self setStatus:currentstatus];
	[[NSNotificationCenter defaultCenter] postNotificationName:Notification_AutoScrollSpeed object:nil];
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
	[bigButton release];
	[midButton release];
	[smlButton release];
	//[bigButtonImg_on release];
//	[bigButtonImg_off release];
//	[midButtonImg_on release];
//	[midButtonImg_off release];
//	[smlButtonImg_on release];
//	[smlButtonImg_off release];
    [super dealloc];
}



@end
