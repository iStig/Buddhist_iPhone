//
//  SettingData.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-17.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SettingData : NSObject {
	
	NSMutableDictionary *m_dictSettingData;
	NSString            *m_pathMainFile;
	NSMutableArray *m_collecionPageMarks;
	NSMutableArray *m_bookMarks;
	NSMutableArray *m_currentPages;
	
	NSUInteger fontSizeIndex;
	NSString *fontType;
	NSUInteger fontColorIndex;
	NSUInteger backgroundImgIndex;
	CGFloat backgroundAlpha;
	BOOL manualPagingOn;
	BOOL autoScrollOn;
	NSUInteger autoScrollSpeed;
	BOOL pagingSoundOn;
	BOOL pagingAnimationOn;
	
}

@property(nonatomic, retain) NSMutableDictionary *m_dictSettingData;
@property (nonatomic, retain) NSString *m_pathMainFile;
@property(nonatomic, retain) NSMutableArray *m_collecionPageMarks;
@property(nonatomic, retain) NSMutableArray *m_bookMarks;
@property(nonatomic, retain) NSMutableArray *m_currentPages;


@property(nonatomic) NSUInteger fontSizeIndex;
@property(nonatomic, retain) NSString *fontType;
@property(nonatomic) NSUInteger fontColorIndex;
@property(nonatomic) NSUInteger backgroundImgIndex;
@property(nonatomic) CGFloat backgroundAlpha;
@property(nonatomic) BOOL manualPagingOn;
@property(nonatomic) BOOL autoScrollOn;
@property(nonatomic) NSUInteger autoScrollSpeed;
@property(nonatomic) BOOL pagingSoundOn;
@property(nonatomic) BOOL pagingAnimationOn;

+(SettingData *)sharedSettingData;


-(void )initWithSettingDataFromFile;
-(void) save; 


-(void) updateManualPagingOn: (BOOL) pagingOn1;
-(void) updateAutoScrollOn: (BOOL) scrollOn1;
-(void) updateAutoScrollSpeed: (NSUInteger) scrollSpeed1;
-(void) updatePagingSound: (BOOL) pagingSound;
-(void) updatePagingAnimation: (BOOL) pagingAnimation;

-(void) updateFontSize: (NSUInteger) fontSize1;
-(void) updateFontColorId: (NSUInteger) fontColorId1;
-(void) updateFontType: (NSString *) fontType1;
-(void) updateBackgroundFile: (NSUInteger) backgroundFile1;
-(void) updateBackgroundAlpha: (CGFloat)backgroundAlpha1;

- (UIImage *)getCurrentBackGroundImg;
- (UIFont *)getCurrentFont;
- (UIColor *)getCurrentFontColor;

- (UIImage *) backImageFromFile: (NSUInteger) fileId;
- (UIFont *) fontWithType: (NSString *)fontType size: (NSUInteger) size;

- (UIColor *) colorFromId: (NSUInteger) colorId;


-(NSArray *) getCollectionPageMarks;
//-(void) addCollectionPageMarks: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
//							  : (NSString *) subVolNo withlectionName:(NSString *)lecname withUrl:(NSString *)url;
//-(void) deleteCollectionPageMarks: (NSUInteger) index;

//添加，删除下载后的书标签
-(void) addBookMarks: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
					: (NSString *) subVolNo withlectionName:(NSString *)lecname;
-(void) deleteBookMarks: (NSUInteger) index;

-(void) updateCurrentPage: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
						 : (NSString *) subVolNo withCurrentPage:(NSInteger )pageNo;
-(NSInteger) getCurrentPage: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
						   : (NSString *) subVolNo ;
@end
