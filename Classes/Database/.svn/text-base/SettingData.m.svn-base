//
//  SettingData.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-17.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "SettingData.h"


@implementation SettingData

@synthesize m_dictSettingData;
@synthesize m_pathMainFile;
@synthesize m_collecionPageMarks;
@synthesize m_bookMarks;
@synthesize m_currentPages;

@synthesize fontSizeIndex;
@synthesize fontType;
@synthesize fontColorIndex;
@synthesize backgroundImgIndex;
@synthesize backgroundAlpha;
@synthesize manualPagingOn;
@synthesize autoScrollOn;
@synthesize autoScrollSpeed;
@synthesize pagingSoundOn;
@synthesize pagingAnimationOn;

// we use the singleton approach, one collection for the entire application
static SettingData *sharedSettingDataInstance = nil;

+ (SettingData*)sharedSettingData {
    @synchronized(self) {
        if (sharedSettingDataInstance == nil) {
           [[self alloc] init]; // assignment not done here
        }
    }
    return sharedSettingDataInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedSettingDataInstance == nil) {
            sharedSettingDataInstance = [super allocWithZone:zone];
            return sharedSettingDataInstance;  // assignment and return on first allocation
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
    //do nothing
}

- (id)autorelease {
    return self;
}

// setup the data collection
- init {
	if (self = [super init]) {
		[self initWithSettingDataFromFile];
	}
	return self;
}

// init with com.SmilingMobile.Currency.plist data
-(void )initWithSettingDataFromFile
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.m_pathMainFile = [documentsDirectory stringByAppendingPathComponent:@"SettingData.plist"];
    if ([fileManager fileExistsAtPath:m_pathMainFile] == NO) {
        NSString *pathToDefaultPlist = [[NSBundle mainBundle] pathForResource:@"SettingData" ofType:@"plist"];
        if ([fileManager copyItemAtPath:pathToDefaultPlist toPath:m_pathMainFile error:&error] == NO) {
            NSAssert1(0, @"Failed to copy data with error message '%@'.", [error localizedDescription]);
        }
    }
    // Unarchive the data, store it in the local property, and pass it to the main view controller
    self.m_dictSettingData = [[NSMutableDictionary alloc] initWithContentsOfFile:m_pathMainFile];
	self.m_collecionPageMarks = [m_dictSettingData valueForKey:@"CollectionPageMarks"];
    self.m_bookMarks = [m_dictSettingData valueForKey:@"BookMarks"];
	self.m_currentPages= [m_dictSettingData valueForKey:@"LectionCurrentPages"];
	
	self.fontSizeIndex = [[m_dictSettingData valueForKey:@"FontSizeIndex"] intValue];
	self.fontType = [m_dictSettingData valueForKey:@"FontType"];
	self.fontColorIndex = [[m_dictSettingData valueForKey:@"FontColorIndex"] intValue];
	self.backgroundImgIndex = [[m_dictSettingData valueForKey:@"BackgroundImgIndex"] intValue];
	self.backgroundAlpha = [[m_dictSettingData valueForKey:@"BackgroundAlpha"] floatValue];
	self.manualPagingOn = [[m_dictSettingData valueForKey:@"ManualPagingOn"]boolValue];
	self.autoScrollOn = [[m_dictSettingData valueForKey:@"AutoScrollOn"]boolValue];
	self.autoScrollSpeed = [[m_dictSettingData valueForKey:@"AutoScrollSpeed"]intValue];
	self.pagingSoundOn = [[m_dictSettingData valueForKey:@"PagingSoundOn"]boolValue];
	self.pagingAnimationOn = [[m_dictSettingData valueForKey:@"PagingAnimationOn"]boolValue];	
}

-(void) save{
	
	[m_dictSettingData writeToFile:m_pathMainFile atomically:NO];
}

-(void) updateManualPagingOn: (BOOL) pagingOn1 {
	self.manualPagingOn = pagingOn1;
	[m_dictSettingData setValue:[NSNumber numberWithBool: pagingOn1] forKey:@"ManualPagingOn"];
	[self save];
}

-(void) updateAutoScrollOn: (BOOL) scrollOn1{
	self.autoScrollOn = scrollOn1;
	[m_dictSettingData setValue:[NSNumber numberWithBool: scrollOn1] forKey:@"AutoScrollOn"];
	[self save];
}

-(void) updateAutoScrollSpeed: (NSUInteger) scrollSpeed1{
	self.autoScrollSpeed = scrollSpeed1;
	[m_dictSettingData setValue:[NSNumber numberWithInt: scrollSpeed1] forKey:@"AutoScrollSpeed"];
	[self save];
}
-(void) updatePagingSound: (BOOL) pagingSound{
	self.pagingSoundOn = pagingSound;
	[m_dictSettingData setValue:[NSNumber numberWithBool: pagingSound] forKey:@"PagingSoundOn"];
	[self save];
}

-(void) updatePagingAnimation: (BOOL) pagingAnimation{
	self.pagingAnimationOn = pagingAnimation;
	[m_dictSettingData setValue:[NSNumber numberWithBool: pagingAnimation] forKey:@"PagingAnimationOn"];
	[self save];
}

-(void) updateFontSize: (NSUInteger) fontSize1{
	self.fontSizeIndex = fontSize1;
	[m_dictSettingData setValue:[NSNumber numberWithInt: fontSize1] forKey:@"FontSizeIndex"];
	[self save];	
	
}
-(void) updateFontType: (NSString *) fontType1{
	self.fontType = fontType1;
	[m_dictSettingData setValue:fontType1 forKey:@"FontType"];
	[self save];
}

-(void) updateFontColorId: (NSUInteger) fontColorId1{
	self.fontColorIndex = fontColorId1;
	[m_dictSettingData setValue:[NSNumber numberWithInt: fontColorId1] forKey:@"FontColorIndex"];
	[self save];
}

-(void) updateBackgroundFile: (NSUInteger) backgroundFile1{
	self.backgroundImgIndex = backgroundFile1;
	[m_dictSettingData setValue:[NSNumber numberWithInt: backgroundFile1] forKey:@"BackgroundImgIndex"];
	[self save];
}

-(void) updateBackgroundAlpha: (CGFloat)backgroundAlpha1
{
	self.backgroundAlpha = backgroundAlpha1;
	[m_dictSettingData setValue:[NSNumber numberWithFloat: backgroundAlpha1] forKey:@"BackgroundAlpha"];
	[self save];
}

- (UIImage *) backImageFromFile: (NSUInteger) fileId{
	UIImage *backgroundImg;
	switch (fileId) {
		case 1:
			backgroundImg = [UIImage imageNamed: @"01-1.png"];
			break;
		case 2:
			backgroundImg = [UIImage imageNamed: @"02-1.png"];
			break;		
		case 3:
			backgroundImg = [UIImage imageNamed: @"03-1.png"];
			break;		
		case 4:
			backgroundImg = [UIImage imageNamed: @"04-1.png"];
			break;		
		case 5:
			backgroundImg = [UIImage imageNamed: @"05-1.png"];
			break;		
		case 6:
			backgroundImg = [UIImage imageNamed: @"06-1.png"];
			break;		
		case 7:
			backgroundImg = [UIImage imageNamed: @"07-1.png"];
			break;
		case 8:
			backgroundImg = [UIImage imageNamed: @"08-1.png"];
			break;
		default:
			break;
	}
	return backgroundImg;
	
}

- (UIFont *) fontWithType: (NSString *)fontType size: (NSUInteger) size{
	NSUInteger defaultsize[3] = {14,21,28};
	
	UIFont *myFont = [UIFont systemFontOfSize: defaultsize[size]];
	return myFont;	
}

- (UIColor *) colorFromId: (NSUInteger) colorId{
	UIColor *fontColor;
	
	switch (colorId) {
		case 1:
			fontColor = [[UIColor alloc] initWithRed:(31.0f/255) green:(26.0f/255) blue:(23.0f/255) alpha:1];
			break;
		case 2:
			fontColor = [[UIColor alloc] initWithRed:(255.0f/255) green:(255.0f/255) blue:(255.0f/255) alpha:1];
			break;		
		case 3:
			fontColor = [[UIColor alloc] initWithRed:(221.0f/255) green:(19.0f/255) blue:(123.0f/255) alpha:1];
			break;		
		case 4:
			fontColor = [[UIColor alloc] initWithRed:(231.0f/255) green:(120.0f/255) blue:(23.0f/255) alpha:1];
			break;		
		case 5:
			fontColor = [[UIColor alloc] initWithRed:(255.0f/255) green:(245.0f/255) blue:(0/255) alpha:1];
			break;		
		case 6:
			fontColor = [[UIColor alloc] initWithRed:(0/255) green:(146.0f/255) blue:(63.0f/255) alpha:1];
			break;		
		case 7:
			fontColor = [[UIColor alloc] initWithRed:(0/255) green:(124.0f/255) blue:(195.0f/255) alpha:1];
			break;
		case 8:
			fontColor = [[UIColor alloc] initWithRed:(186.0f/255) green:(179.0f/255) blue:(214.0f/255) alpha:1];
			break;
		case 9:
			fontColor = [[UIColor alloc] initWithRed:(112.0f/255) green:(97.0f/255) blue:(78.0f/255) alpha:1];
			break;
		case 10:
			fontColor = [[UIColor alloc] initWithRed:(132.0f/255) green:(194.0f/255) blue:(37.0f/255) alpha:1];
			break;
		case 11:
			fontColor = [[UIColor alloc] initWithRed:(255.0f/255) green:(251.0f/255) blue:(156.0f/255) alpha:1];
			break;
		case 12:
			fontColor = [[UIColor alloc] initWithRed:(113.0f/255) green:(111.0f/255) blue:(97.0f/255) alpha:1];
			break;
			
		default:
			break;
	}
	return fontColor;
	
}


- (UIImage *)getCurrentBackGroundImg{
	return [self backImageFromFile: backgroundImgIndex];
}
- (UIFont *)getCurrentFont{
	return [self fontWithType:  fontType size:fontSizeIndex];
}
- (UIColor *)getCurrentFontColor{
	return [self colorFromId: fontColorIndex];
}

-(NSArray *) getCollectionPageMarks{ 
	return m_collecionPageMarks;
		
}
//-(void) addCollectionPageMarks: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
//							  : (NSString *) subVolNo withlectionName:(NSString *)lecname withUrl:(NSString *)url
//{
//	//check if the page exists
//	for( int i = 0; i<[m_collecionPageMarks count]; i++) 
//	{
//		NSDictionary *pageMark1 = [ m_collecionPageMarks objectAtIndex:i];
//		if (([volumnNo isEqualToString:[pageMark1 valueForKey:@"volumnNo"]]) 
//			&& ([LectionNo isEqualToString:[pageMark1 valueForKey:@"lectionNo"]])
//			&&( [subVolNo isEqualToString:[pageMark1 valueForKey:@"subvolumnNo"]])
//			&&( [lecname isEqualToString:[pageMark1 valueForKey:@"lectionName"]])
//			&& ([url isEqualToString:[pageMark1 valueForKey:@"url"]]))
//		{
//			return;		
//		}
//		
//	}
//	NSMutableDictionary *dictPagemark= [[NSMutableDictionary alloc] init];
//	[dictPagemark setValue: [NSString stringWithString:volumnNo]forKey:@"volumnNo"];
//	[dictPagemark setValue: [NSString stringWithString:LectionNo]forKey:@"lectionNo"];
//	[dictPagemark setValue: [NSString stringWithString:subVolNo]forKey:@"subvolumnNo"];
//	[dictPagemark setValue: [NSString stringWithString:lecname]forKey:@"lectionName"];
//	[dictPagemark setValue: [NSString stringWithString:url]forKey:@"url"];
//	[m_collecionPageMarks addObject:dictPagemark];
//	[m_dictSettingData setValue:m_collecionPageMarks forKey:@"CollectionPageMarks"];
//	
//	[dictPagemark release];
//	[self save];
//	
//}
//
//-(void) deleteCollectionPageMarks: (NSUInteger) index{
//	[m_collecionPageMarks removeObjectAtIndex: index];
//	[m_dictSettingData setValue:m_collecionPageMarks forKey:@"CollectionPageMarks"];
//	[self save];
//	
//}

-(void) addBookMarks: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
					: (NSString *) subVolNo withlectionName:(NSString *)lecname
{
	//check if the page exists
	for( int i = 0; i<[m_bookMarks count]; i++) 
	{
		NSDictionary *pageMark1 = [m_bookMarks objectAtIndex:i];
		if (([volumnNo isEqualToString:[pageMark1 valueForKey:@"volumnNo"]]) 
			&& ([LectionNo isEqualToString:[pageMark1 valueForKey:@"lectionNo"]])
			&&( [subVolNo isEqualToString:[pageMark1 valueForKey:@"subvolumnNo"]])
			&&( [lecname isEqualToString:[pageMark1 valueForKey:@"lectionName"]]))
		{
			return;		
		}
		
	}
	NSMutableDictionary *dictPagemark= [[NSMutableDictionary alloc] init];
	[dictPagemark setValue: [NSString stringWithString:volumnNo]forKey:@"volumnNo"];
	[dictPagemark setValue: [NSString stringWithString:LectionNo]forKey:@"lectionNo"];
	[dictPagemark setValue: [NSString stringWithString:subVolNo]forKey:@"subvolumnNo"];
	[dictPagemark setValue: [NSString stringWithString:lecname]forKey:@"lectionName"];
	[m_bookMarks addObject:dictPagemark];
	[m_dictSettingData setValue:m_bookMarks forKey:@"BookMarks"];
	[dictPagemark release];
	[self save];
	
}

-(void) deleteBookMarks: (NSUInteger) index;{
	[m_bookMarks removeObjectAtIndex: index];
	[m_dictSettingData setValue:m_bookMarks forKey:@"BookMarks"];
	[self save];
	
}

-(void) updateCurrentPage: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
					: (NSString *) subVolNo withCurrentPage:(NSInteger )pageNo
{
	//check if the page exists
	for( int i = 0; i<[m_currentPages count]; i++) 
	{
		NSDictionary *pageMark1 = [m_currentPages objectAtIndex:i];
		if (([volumnNo isEqualToString:[pageMark1 valueForKey:@"volumnNo"]]) 
			&& ([LectionNo isEqualToString:[pageMark1 valueForKey:@"lectionNo"]])
			&&( [subVolNo isEqualToString:[pageMark1 valueForKey:@"subvolumnNo"]]))
		{
				[m_currentPages removeObject:pageMark1];
		}
		
	}
	NSMutableDictionary *dictPagemark= [[NSMutableDictionary alloc] init];
	[dictPagemark setValue: [NSString stringWithString:volumnNo]forKey:@"volumnNo"];
	[dictPagemark setValue: [NSString stringWithString:LectionNo]forKey:@"lectionNo"];
	[dictPagemark setValue: [NSString stringWithString:subVolNo]forKey:@"subvolumnNo"];
	[dictPagemark setValue: [NSNumber numberWithInteger:pageNo]forKey:@"currentPage"];
	[m_currentPages addObject:dictPagemark];
	[m_dictSettingData setValue:m_currentPages forKey:@"LectionCurrentPages"];
	[dictPagemark release];
	[self save];
	
}

-(NSInteger) getCurrentPage: (NSString *)volumnNo withLection: (NSString *) LectionNo withSubVo
						 : (NSString *) subVolNo 
{
	//check if the page exists
	for( int i = 0; i<[m_currentPages count]; i++) 
	{
		NSDictionary *pageMark1 = [m_currentPages objectAtIndex:i];
		if (([volumnNo isEqualToString:[pageMark1 valueForKey:@"volumnNo"]]) 
			&& ([LectionNo isEqualToString:[pageMark1 valueForKey:@"lectionNo"]])
			&&( [subVolNo isEqualToString:[pageMark1 valueForKey:@"subvolumnNo"]]))
		{
			return [[pageMark1 valueForKey:@"currentPage"]intValue];
			
		}
		
	}
	return 1;
}

- (void)dealloc {
	[fontType release];
	[m_dictSettingData release];
	[m_pathMainFile release];
	[m_collecionPageMarks release];
	[m_bookMarks release];
	[m_currentPages release];
    [super dealloc];
}

@end
