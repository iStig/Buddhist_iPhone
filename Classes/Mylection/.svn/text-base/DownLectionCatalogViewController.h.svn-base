//
//  DownLectionCatalogViewController.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-18.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"LectionCatalogElement.h"

@interface DownLectionCatalogViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
	
	NSMutableArray *m_downLectionCatalogArray;           //接受被下载过的经文
	CatalogElement *m_volumnCatalogElement;    //接受前一个视图传递过来的参数。
	UITableView *m_tableView;
	
}

@property (nonatomic, retain) NSMutableArray *m_downLectionCatalogArray;
@property (nonatomic, retain) CatalogElement *m_volumnCatalogElement;
@property (nonatomic, retain) IBOutlet UITableView *m_tableView;

-(NSString *) calculateTotalVolumnNo :(CatalogElement *)voluCateElement;  //计算出第二层的卷号 ，如 T01 ,T02
@end
