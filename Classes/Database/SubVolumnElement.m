//
//  SubVolumnElement.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-7.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "SubVolumnElement.h"
#import "Define.h"

@implementation SubVolumnElement


@synthesize m_subVolumnName;
@synthesize m_subVolumnNo;

- (id) initWithDictionary:(NSDictionary *)dict {
	
	if (self = [super init]) {
		self.m_subVolumnName = [dict valueForKey:VOLU_NAME_KEY];
		self.m_subVolumnNo = [dict valueForKey:VOLU_NUMBER];
		
	}
	return self;
}

- (void)dealloc {
	[m_subVolumnName release];
	[m_subVolumnNo   release];
	[super dealloc];
	
}


@end
