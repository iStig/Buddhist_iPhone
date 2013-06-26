//
//  LectionCatalogview.h
//  cbeta
//

/*
    经文内容获取，得到经文名，经号，更新日期等。
 */
//  Created by SmilingMobile on 10-6-7.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"LectionCatalogElement.h"

@interface LectionCatalogViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{

	NSArray *m_lectionCatalogArray;
	CatalogElement *m_chapterCatalogElement;
	CatalogElement *m_volumnCatalogElement;    //接受前一个视图传递过来的参数。
	UITableView *m_tableView;
	
}

@property (nonatomic, retain) NSArray *m_lectionCatalogArray;
@property (nonatomic, retain) CatalogElement *m_chapterCatalogElement;
@property (nonatomic, retain) CatalogElement *m_volumnCatalogElement;
@property (nonatomic, retain) IBOutlet UITableView *m_tableView;

-(NSString *) calculateTotalVolumnNo :(CatalogElement *)voluCateElement;  //计算出第二层的卷号 ，如 T01 ,T02

@end
