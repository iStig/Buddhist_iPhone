//
//  PageViewController.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-17.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadView.h"
#import "LoadingIndicatorView.h"
@class SoundEffect;

@interface DownPageViewController : UIViewController  <UIScrollViewDelegate,NSXMLParserDelegate,UIAlertViewDelegate,UIGestureRecognizerDelegate>{
	

	BOOL           m_isInsert;       //确定是否添加
	NSMutableString *m_currentContent;//解析中用到的取出当前内容.
	
	NSString        *m_volumnNo;     //卷号
	NSString        *m_lectionNo;    //经文号
	NSString        *m_subvolumnNo;  //分卷号
	NSString        *m_lectionName;  //经文名
	
	NSInteger chapterNumber;
	ReadView *m_readView;
	NSTimer *updateTimer;
	NSUInteger currentPage;
	NSUInteger totalPageNumber;
	CGFloat fontHeight;
	NSUInteger linesPerPage;
	BOOL autoScrolling;
    NSUInteger fontValue;

	//if NO, do not do page and paing control, should be manual scroll. if YES, do paging and paging control
	BOOL pagingOn; 
	BOOL pagingAnimationOn;
	BOOL pagingSoundOn;
	BOOL autoScrollingOn;
	NSUInteger autoScrollingSpeed;
	SoundEffect *pageSound;	
	

	LoadingIndicatorView *m_loadingIndicator;
    NSXMLParser *m_xmlParser;
	
}


@property (nonatomic,assign) BOOL           m_isInsert;
@property (nonatomic,retain) NSMutableString *m_currentContent;

@property (nonatomic, retain) NSString *m_volumnNo;
@property (nonatomic, retain) NSString *m_lectionNo;
@property (nonatomic, retain) NSString *m_subvolumnNo;
@property (nonatomic, retain) NSString *m_lectionName;

@property (nonatomic) NSInteger chapterNumber;
@property (nonatomic, retain) ReadView *m_readView;
@property (nonatomic, retain) NSTimer *updateTimer;
@property (nonatomic) NSUInteger currentPage;
@property (nonatomic) NSUInteger totalPageNumber;
@property (nonatomic) CGFloat fontHeight;
@property (nonatomic) NSUInteger linesPerPage;
@property (nonatomic) BOOL autoScrolling;

@property (nonatomic) BOOL pagingOn; 
@property (nonatomic) BOOL pagingAnimationOn;
@property (nonatomic) BOOL pagingSoundOn;
@property (nonatomic) BOOL autoScrollingOn;
@property (nonatomic) NSUInteger autoScrollingSpeed;
@property (nonatomic, retain) SoundEffect *pageSound;

@property (nonatomic, retain) NSXMLParser *m_xmlParser;
@property (nonatomic, retain) LoadingIndicatorView *m_loadingIndicator;
@property (nonatomic)  NSUInteger fontValue;


- (void) prevPage;
- (void) nextPage;
- (void) autoScroll;

- (void) startRepeatingTimer:(NSUInteger)timeIntervalSec;
- (void) stopRepeatingTimer;

- (void) gotoPage: (NSUInteger) pageNumber;
- (void) gotoPageNoSound: (NSUInteger) pageNumber;
- (void) addObservers;

- (void) removeObservers;

- (void) configBySettingData;
- (void) computePageAndLines;

-(NSString *) makeXml;
-(NSString *) addZeroToLectionNo :(NSString *)oldLecNo;
-(NSString *) addZeroToSubVoluNo :(NSString *) oldSubVolNo;

@end
