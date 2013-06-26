//
//  CatalogElement.m
//  cbeta
//
//  Created by jishen on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CatalogElement.h"


@implementation CatalogElement

@synthesize m_chapOrVolu;
@synthesize m_downloadStatus;
@synthesize m_catalog;

- (id) initWithDictionaryForChapter:(NSDictionary *)dict {
	
	if (self = [super init]) {
		NSString * chapTemp = [[NSString alloc ]initWithString:[dict valueForKey:@"chapter"]];
		NSArray *cata =[[NSArray alloc]initWithArray:[dict valueForKey:@"catalog"]];
		
		self.m_chapOrVolu = chapTemp;
		self.m_catalog =cata;
		NSNumber *status;
		status = [dict valueForKey:@"download_status"];
		if (1 == [status intValue]) {
			self.m_downloadStatus = CHAPTER_PARTLY_DOWNLOADED;
		} else if (2 == [status intValue]) {
			self.m_downloadStatus = CHAPTER_COMPLETELY_DOWNLOADED;
		} else {
			self.m_downloadStatus = CHAPTER_NOT_DOWNLOADED;
		}
		[chapTemp release];
		[cata release];
	}
	return self;
}

- (id) initWithDictionaryForVolumn:(NSDictionary *)dict {
	
	if (self = [super init]) {
		NSNumber *status;
		self.m_chapOrVolu = [dict valueForKey:@"volumn"];
		self.m_catalog = [dict valueForKey:@"second_catalog"];
		status = [dict valueForKey:@"download_status"];
		if (1 == [status intValue]) {
			self.m_downloadStatus = CHAPTER_PARTLY_DOWNLOADED;
		} else if (2 == [status intValue]) {
			self.m_downloadStatus = CHAPTER_COMPLETELY_DOWNLOADED;
		} else {
			self.m_downloadStatus = CHAPTER_NOT_DOWNLOADED;
		}
	}
	
	return self;
}

- (void)dealloc {
	[m_chapOrVolu release];
	[m_catalog release];
	[super dealloc];
}

@end
