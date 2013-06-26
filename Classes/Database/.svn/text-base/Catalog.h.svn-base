//
//  Catalog.h
//  cbeta
//
//  Created by jishen on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LectionCatalogElement.h"

@interface Catalog : NSObject {
@private
	NSMutableArray *m_catalog;
	NSString *m_filePath;  //初始化文件的路径
	LectionCatalogElement *m_lectionCataElement; //保存经文的类
	
	NSMutableArray *m_DownFristCatalog;
	NSMutableArray *m_DownSecondCatalog;
}



@property(nonatomic, retain) NSMutableArray *m_catalog;
@property(nonatomic, retain) NSString *m_filePath;
@property(nonatomic, retain) LectionCatalogElement *m_lectionCataElement;
@property(nonatomic, retain) NSMutableArray *m_DownFristCatalog;
@property(nonatomic, retain) NSMutableArray *m_DownSecondCatalog;

+ (Catalog *)sharedCatalog;
- (NSArray *)topCatalog;
-(void) save; 

//获得某一章目录
- (NSArray *)subChapter:(NSString *)chapter;

//获得某一卷目录
- (NSArray *)subVolumn:(NSString *)chapter withVolumn:(NSString *)volumn;

//获取分卷的名字
-(NSArray *)getSubVolumn:(LectionCatalogElement *) lectionCataElement;

//得到为下载的一级目录
-(NSMutableArray *)getDownFirstCatalog ;

//得到为下载的二级目录
-(NSMutableArray *)getDownSecondCatalog :(NSString *)chapter;

//得到为下载的经文目录
//-(NSMutableArray *)getDownLectionCatalog :(NSString *)volumn;
//获得下载的状态

-(void)getDownLoadStatus:(NSString*)volumnNo;
-(void)setDownLoadStatus:(NSString *)volumnNo isDownLoad:(BOOL)downStatus;


@end
