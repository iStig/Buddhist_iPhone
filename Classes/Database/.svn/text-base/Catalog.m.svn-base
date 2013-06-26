//
//  Catalog.m
//  cbeta
//
//  Created by jishen on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//本类用于获得关于目录的情况
//

#import "Catalog.h"
#import "CatalogElement.h"
#import "Define.h"



@implementation Catalog

@synthesize m_catalog;
@synthesize m_filePath;
@synthesize m_lectionCataElement;
@synthesize m_DownFristCatalog;
@synthesize m_DownSecondCatalog;

static Catalog *sharedInstance = nil;

+ (Catalog *)sharedCatalog {
    @synchronized(self) {
        if (sharedInstance == nil) {
            [[self alloc] init]; // assignment not done here
        }
    }
    return sharedInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release {
}

- (id)autorelease {
    return self;
}


- (void) dealloc {
	[m_lectionCataElement release];
	[m_catalog release];
	[m_filePath release];
	[m_DownFristCatalog release];
	[m_DownSecondCatalog release];
	[super dealloc];
}

//由catalog.plist初始化类
- (id)init {
	if (self = [super init]) {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSError *error;
		NSArray *arrayDocPaths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *strDocPath = [arrayDocPaths objectAtIndex:0]  ;
		
		self.m_filePath = [strDocPath stringByAppendingPathComponent:CATALOG_FILE];
		
		if ([fileManager fileExistsAtPath:self.m_filePath] == NO) {
			NSString *pathToDefaultPlist = [[NSBundle mainBundle] pathForResource:@"Catalog" ofType:@"plist"];
			if ([fileManager copyItemAtPath:pathToDefaultPlist toPath:self.m_filePath error:&error] == NO) {
				NSAssert1(0, @"Failed to copy data with error message '%@'.", [error localizedDescription]);
			}
		}
		self.m_catalog = [NSMutableArray arrayWithContentsOfFile:self.m_filePath];
	}
	
	return self;
}

- (NSArray *)topCatalog {
    return self.m_catalog;
}

-(void) save{
	
	[self.m_catalog writeToFile:self.m_filePath atomically:NO];

}


//获得某一章目录
- (NSArray *)subChapter:(NSString *)chapter
{
	NSDictionary *dict  ;
	for( dict in self.m_catalog)
	{
		CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForChapter:dict];
		if ([cataElement.m_chapOrVolu isEqualToString:chapter])
		{
			NSArray  *chapterArray= [[[NSArray alloc] initWithArray: cataElement.m_catalog] autorelease];
			[cataElement release];
			return chapterArray;
		}
	}
	return nil;
}

//获得某一卷
- (NSArray *)subVolumn:(NSString *)chapter withVolumn:(NSString *)volumn

{
	NSArray *subCatalog = [self subChapter:chapter];
	NSDictionary *dict;
	
	for( dict in subCatalog)
	{
		CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForVolumn:dict];
	    if ([cataElement.m_chapOrVolu isEqualToString: volumn]) 
		{    
			NSArray  * volumnArray = [[[NSArray alloc]init ]autorelease];
			volumnArray=cataElement.m_catalog;
			[cataElement release];
			return volumnArray;
		}
		
	}
	return nil;
}

//通过经文号获得相应的经文
-(LectionCatalogElement *)getLection:(NSString *)chapter withVolumn :(NSString *)volumn withLectionNumber:(NSString *)lection_number
{
	NSArray *lectionCatalog = [self subVolumn:chapter withVolumn:volumn];
	NSDictionary *dict;
	
	for( dict in lectionCatalog)
	{
		LectionCatalogElement *lectionCataElement1 = [[LectionCatalogElement alloc] initWithDictionary:dict];
		if ([lectionCataElement1.m_lectionNumber isEqualToString:lection_number]) 
		{
			 self.m_lectionCataElement= lectionCataElement1;
			 return self.m_lectionCataElement;
		}
	}
	return nil;
}

//获取分卷的数组
-(NSArray *)getSubVolumn:(LectionCatalogElement *) lecCataElement
{
	
	NSMutableArray *subVolumn = [[[NSMutableArray alloc]init]autorelease];
	NSInteger i;
	NSInteger amount = [lecCataElement.m_lectionAmount intValue];
	NSString *lection_cata=[NSString stringWithString:lecCataElement.m_lectionCata];
	
	for (i = 0;i<amount; i++) 
	{
		NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
		NSString *subVoluName;
		NSString *subVoluNumber;
		if ([lection_cata isEqualToString:@"般若部類般若部二"] ) {
			//分卷名字
			subVoluName = [NSString stringWithFormat:@"%d %@",i+1+200,lecCataElement.m_lectionName];
			//分卷号
		    subVoluNumber = [NSString stringWithFormat:@"%d",i+1+200];
		}else if ([lection_cata isEqualToString:@"般若部類般若部三"]) {
			//分卷名字
			subVoluName = [NSString stringWithFormat:@"%d %@",i+1+400,lecCataElement.m_lectionName];
			//分卷号
			subVoluNumber = [NSString stringWithFormat:@"%d",i+1+400];
		}else {
			//分卷名字
			subVoluName = [NSString stringWithFormat:@"%d %@",i+1,lecCataElement.m_lectionName];
			//分卷号
			subVoluNumber = [NSString stringWithFormat:@"%d",i+1];
		}
        [dic setValue:subVoluName   forKey:VOLU_NAME_KEY];
		[dic setValue:subVoluNumber forKey:VOLU_NUMBER  ];
		[subVolumn addObject:dic];
		[dic release];
		
	}
	return subVolumn;
	
}

//得到被下载的目录
-(NSMutableArray *) getDownFirstCatalog 
{
	NSMutableArray * downFirstCatalog =[NSMutableArray arrayWithCapacity:0];
	NSDictionary * firstDic;
	for (firstDic in self.m_catalog)
	{
		if([[firstDic valueForKey:@"download_status"]intValue]!=0)
		{
			[downFirstCatalog addObject:firstDic];
		}
	}
	self.m_DownFristCatalog = downFirstCatalog;
    return downFirstCatalog;
}

//得到为下载的二级目录
-(NSMutableArray *)getDownSecondCatalog :(NSString *)chapter 
{
	NSDictionary *dict  ;
	for( dict in self.m_DownFristCatalog)
	{
		CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForChapter:dict];
		if ([cataElement.m_chapOrVolu isEqualToString:chapter])
		{
			NSMutableArray * downSecondCatalog =[NSMutableArray arrayWithCapacity:0];
			NSDictionary * secondDic;
			for (secondDic in cataElement.m_catalog)
			{
				if([[secondDic valueForKey:@"download_status"]intValue]!=0)
				{
					[downSecondCatalog addObject:secondDic];
					
				}else if ([[secondDic valueForKey:@"volumn"]isEqualToString
						   :@"T08 般若部四 (221 ~ 261 经)" ]) {
					
					NSMutableDictionary *customDic=[[NSMutableDictionary alloc]init];
					NSMutableArray *customArray = [[NSMutableArray alloc]init];
					//取出要添加的经文元素
					NSArray *addArray =[secondDic valueForKey:@"second_catalog"];
					[customArray addObject:[addArray objectAtIndex:14]];   //添加经文元素
					[customArray addObject:[addArray objectAtIndex:31]];
					
					[customDic setValue:[secondDic valueForKey:@"volumn"] forKey:@"volumn"];
					[customDic setValue:[secondDic valueForKey:@"download_status"] forKey:@"download_status"];
					[customDic setValue:customArray forKey:@"second_catalog"];
					
					[downSecondCatalog addObject:customDic];
					[customArray release];
					[customDic release];
					
				}else if ([[secondDic valueForKey:@"volumn"]isEqualToString
						   :@"T09 法華部全、華嚴部上 (262 ~ 278 经)" ]) {
					
					NSMutableDictionary *customDic=[[NSMutableDictionary alloc]init];
					NSMutableArray *customArray = [[NSMutableArray alloc]init];
					//取出要添加的经文元素
					NSArray *addArray =[secondDic valueForKey:@"second_catalog"];
					[customArray addObject:[addArray objectAtIndex:0]];   //添加经文元素
					
					[customDic setValue:[secondDic valueForKey:@"volumn"] forKey:@"volumn"];
					[customDic setValue:[secondDic valueForKey:@"download_status"] forKey:@"download_status"];
					[customDic setValue:customArray forKey:@"second_catalog"];
					
					[downSecondCatalog addObject:customDic];
					[customArray release];
					[customDic release];
				}
			}
			[cataElement release];
			self.m_DownSecondCatalog = downSecondCatalog;
			return downSecondCatalog;
			}
		
	}
	
	return nil;
}

-(void)getDownLoadStatus:(NSString*)volumnNo
{
	


}

-(void)setDownLoadStatus:(NSString *)volumnNo isDownLoad:(BOOL)downStatus
{
	NSMutableString* intVoluNo =[NSMutableString stringWithString:volumnNo];
	
	unichar voluChar = [intVoluNo characterAtIndex:0];
	[intVoluNo deleteCharactersInRange:NSMakeRange(0, 1)];
	NSInteger tempintVoluno =[intVoluNo intValue];
	
	NSMutableDictionary* firstCataDic;      //一级目录字典
	NSMutableArray *firstCataArray;        //一级目录数组,里面包含各卷
	NSMutableDictionary* secondCataDic;      //二级目录字典
	NSNumber *partDownLoad;
	if (downStatus == YES) {
		partDownLoad =[NSNumber numberWithInt:1];
	} else {
		partDownLoad =[NSNumber numberWithInt:0];
	}

	switch (voluChar) {
		case 'T':
			if (tempintVoluno>0 && tempintVoluno<33)
			{
			  firstCataDic= [self.m_catalog objectAtIndex:0];
			  firstCataArray=[firstCataDic valueForKey:@"catalog"];
			  secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-1];
			  [secondCataDic setValue:partDownLoad forKey:@"download_status"];
			  
		    }else if (tempintVoluno>=33 && tempintVoluno<49){
				firstCataDic= [self.m_catalog objectAtIndex:1];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-33];
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
				
			}else if ((tempintVoluno>=49 && tempintVoluno<56)||tempintVoluno==85){
				firstCataDic= [self.m_catalog objectAtIndex:2];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				if ((tempintVoluno>=49 && tempintVoluno<56)) {
					secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-49];
				}else {
					secondCataDic=[firstCataArray objectAtIndex:7];
				}
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
			}
			break;
		case 'X':
			if (tempintVoluno>0 && tempintVoluno<3)
			{
				firstCataDic= [self.m_catalog objectAtIndex:3];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-1];
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
				
	    	}else if (tempintVoluno>=3 && tempintVoluno<38){
				firstCataDic= [self.m_catalog objectAtIndex:4];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				if (tempintVoluno <=5) {
					secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-3];
				}else {   //缺少x06章
					secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-4];
				}
				
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
		
			}else if (tempintVoluno>=38 && tempintVoluno<45){
				firstCataDic= [self.m_catalog objectAtIndex:5];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-38];
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
				
			}else if (tempintVoluno>=45 && tempintVoluno<54){
				firstCataDic= [self.m_catalog objectAtIndex:6];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				if (tempintVoluno <53) {
					secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-45];
				}else {   //缺少x53章
					secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-46];
				}
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
				
			}else if (tempintVoluno>=54 && tempintVoluno<74){
				
				firstCataDic= [self.m_catalog objectAtIndex:7];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-54];
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
				
				
			}else if (tempintVoluno>=74 && tempintVoluno<89){
				
				firstCataDic= [self.m_catalog objectAtIndex:8];
				firstCataArray=[firstCataDic valueForKey:@"catalog"];
				secondCataDic=[firstCataArray objectAtIndex:tempintVoluno-74];
				[secondCataDic setValue:partDownLoad forKey:@"download_status"];
			
			}
			break;
	
		default:
		        break;
	}
	if (downStatus == YES) 
	{
	    //判断是否全部下载完毕.
	    NSInteger i=0;
	   for (NSMutableDictionary *dic in firstCataArray ) {
		   NSNumber* downStatus = [dic valueForKey:@"download_status"]; 
		   if ([downStatus intValue]!=1) {
			   NSInteger dd= [downStatus intValue];
			   NSLog(@"%d",dd);
			  break;
		   }
	     	i++;
	  }
	   if (i==[firstCataArray count]) {
		   NSNumber *totalDownLoad =[NSNumber numberWithInt:2];
		   [firstCataDic setValue:totalDownLoad forKey:@"download_status"];
	  } else  {
		   [firstCataDic setValue:partDownLoad forKey:@"download_status"];
	   }
		
	} else {
		
		NSInteger i=0;
		for (NSMutableDictionary *dic in firstCataArray ) {
			NSNumber* downStatus = [dic valueForKey:@"download_status"]; 
			if ([downStatus intValue]!=0) {
				break;
			}
	     	i++;
		}
		
		//第一个目录始终存在
		if (voluChar=='T'&&(tempintVoluno>0 && tempintVoluno<33)) {
			NSNumber *totalDownLoad =[NSNumber numberWithInt:1];
			[firstCataDic setValue:totalDownLoad forKey:@"download_status"];
		} 
		else if (i==[firstCataArray count]) {
			NSNumber *totalDownLoad =[NSNumber numberWithInt:0];
			[firstCataDic setValue:totalDownLoad forKey:@"download_status"];
		} else  {
			//[firstCataDic setValue:partDownLoad forKey:@"download_status"];
		}
	}
	  [self save];
}



@end
