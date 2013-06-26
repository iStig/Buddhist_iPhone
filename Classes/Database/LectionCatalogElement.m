//
//  LectionCatalogElement.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-2.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "LectionCatalogElement.h"
@implementation LectionCatalogElement

@synthesize m_lectionCata;
@synthesize m_lectionNumber;
@synthesize m_lectionName;
@synthesize m_lectionUpdateDate;
@synthesize m_lectionAmount;
@synthesize m_lectionAuthor;
@synthesize m_lectionDownloadStatus;

- (id) initWithDictionary:(NSDictionary *)dict {
	
	if (self = [super init]) {
		
		NSNumber *status;
		self.m_lectionCata = [dict valueForKey:@"lection_cata"];
		
		//判断经文的类型,并处理,有经文号为字符串的.
		NSString * templecNumber;
		id lecNumber =[dict valueForKey:@"lection_number"];
		if ([lecNumber isKindOfClass:[NSNumber class]]) {
			templecNumber =[NSString stringWithFormat:@"%d",[lecNumber intValue]];
		}else {
			templecNumber = [NSString stringWithString:lecNumber];
		}
		self.m_lectionNumber = templecNumber;
		
		self.m_lectionName = [dict valueForKey:@"lection_name"];
		self.m_lectionUpdateDate = [dict valueForKey:@"lection_updatedate"];
		self.m_lectionAmount = [dict valueForKey:@"lection_amount"];
		self.m_lectionAuthor = [dict valueForKey:@"lection_author"];
		status = [dict valueForKey:@"download_status"];
		if (1 == [status intValue]) 
		{
			self.m_lectionDownloadStatus = CHAPTER_PARTLY_DOWNLOADED;
		} 
		else if (2 == [status intValue]) 
		{
			self.m_lectionDownloadStatus = CHAPTER_COMPLETELY_DOWNLOADED;
		} 
		else 
		{
			self.m_lectionDownloadStatus = CHAPTER_NOT_DOWNLOADED;
		}
	}
	
	return self;
}

- (void)dealloc {
	
	[m_lectionCata release];
	[m_lectionName release];
	[m_lectionNumber release];
	[m_lectionUpdateDate release];
	[m_lectionAmount release];
	[m_lectionAuthor release];
	[super dealloc];
	
}



@end
