//
//  LectionCatalogElement.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-2.
//  Copyright 2010 SmilingMobile. All rights reserved.

//经文内容目录类

#import <Foundation/Foundation.h>
#import "CatalogElement.h"


@interface LectionCatalogElement : NSObject {
	
	NSString *m_lectionCata;          //经文分类
	NSString  *m_lectionNumber;
	NSString *m_lectionName;          //经文名
	NSString *m_lectionUpdateDate;    //经文更新日期
	NSNumber *m_lectionAmount;        //经文分卷总量
	NSString *m_lectionAuthor;        //经文译注
	
	NSChapterDownloadStatus m_lectionDownloadStatus;
	
}

@property (nonatomic, retain) NSString *m_lectionCata;
@property (nonatomic,retain)  NSString  *m_lectionNumber;
@property (nonatomic, retain) NSString *m_lectionName;
@property (nonatomic, retain) NSString *m_lectionUpdateDate;
@property (nonatomic, retain) NSNumber *m_lectionAmount;
@property (nonatomic, retain) NSString *m_lectionAuthor;

@property NSChapterDownloadStatus m_lectionDownloadStatus;

- (id) initWithDictionary:(NSDictionary *)dict;



@end
