//
//  ReadView.h
//  mobilebook
//
//  Created by Victor on 1/5/10.
//  Copyright 2010 SmilingMobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReadView : UIView {
	UITextView *m_textView;
	UIImageView *backGroundImgView;

	
	CGPoint startTouchPosition ; 
	CGPoint endTouchPosition; 	
	//Setting parameters
	
	//保存背景图片,(字体大小,颜色),背景透明度.
	UIImage *backGroundImg;
	UIFont *readFont;
	UIColor *fontColor;
	CGFloat backGroundAlpha;	
}

@property(nonatomic, retain) UITextView *m_textView;
@property(nonatomic, retain) UIImageView *backGroundImgView;

@property (nonatomic) CGPoint startTouchPosition;
@property (nonatomic) CGPoint endTouchPosition ;

@property(nonatomic, retain) UIImage *backGroundImg;
@property(nonatomic, retain) UIFont *readFont;
@property(nonatomic, retain) UIColor *fontColor;
@property(nonatomic) CGFloat backGroundAlpha;

//Notifications

#define Notification_SingleTap_Left  @"NotificationSingleTap_Left"
#define Notification_SingleTap_Center  @"NotificationSingleTap_Center"
#define Notification_SingleTap_Right  @"NotificationSingleTap_Right"
#define Notification_SwipeToLeft @"NotificationSwipeToLeft"
#define Notification_SwipeToRight  @"NotificationSwipeToRight"
#define Notification_DoulbeTap  @"NotificationDoubleTap"

- (void) setPaging: (BOOL) pagingOn;
- (void) getSettingData;


@end
