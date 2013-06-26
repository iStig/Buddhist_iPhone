//
//  CatalogElement.h
//  cbeta
//
//  Created by jishen on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	CHAPTER_NOT_DOWNLOADED,
	CHAPTER_PARTLY_DOWNLOADED,
	CHAPTER_COMPLETELY_DOWNLOADED
} NSChapterDownloadStatus;

 
@interface CatalogElement : NSObject {
	
	NSString *m_chapOrVolu;  //chapter或者volumn字段
	NSChapterDownloadStatus m_downloadStatus;
	NSArray *m_catalog;
}

@property (nonatomic, retain) NSString *m_chapOrVolu;
@property (nonatomic, retain) NSArray *m_catalog;
@property NSChapterDownloadStatus m_downloadStatus;



- (id) initWithDictionaryForChapter:(NSDictionary *)dict;
- (id) initWithDictionaryForVolumn:(NSDictionary *)dict;

@end
