//
//  PageViewController.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-9.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingIndicatorView.h"

@interface PageViewController : UIViewController <UIWebViewDelegate>{
	
	NSString        *m_volumnNo;     //卷号
	NSString        *m_lectionNo;    //经文号
	NSString        *m_subvolumnNo;  //分卷号
	NSString        *m_lectionName;   //经文名
	
	UIWebView       *m_webView;
	LoadingIndicatorView *m_loadingIndicator;

}

@property (nonatomic, retain) NSString *m_volumnNo;
@property (nonatomic, retain) NSString *m_lectionNo;
@property (nonatomic, retain) NSString *m_subvolumnNo;
@property (nonatomic, retain) NSString *m_lectionName;

@property (nonatomic, retain) IBOutlet UIWebView   *m_webView;
@property (nonatomic, retain) LoadingIndicatorView *m_loadingIndicator;

-(NSString *) makeUrl;
-(NSString *) addZeroToLectionNo :(NSString *)oldLecNo;
-(NSString *) addZeroToSubVoluNo :(NSString *)oldSubVolNo;

@end
