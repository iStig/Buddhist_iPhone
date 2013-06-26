//
//  SubVolumnCatalogViewController.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-7.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LectionCatalogElement.h"

@interface SubVolumnCatalogViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
	
     UITableView           *m_tableView;
	 NSArray               *m_subVolumn;             //保存分卷情况的数组，包括分卷名字，编号，下载情况
	 LectionCatalogElement *m_lectionCatalogElement; //保存上级菜单传递过来的参数,包含经文号
	 NSString              *m_volunNo;               //保存上级菜单传过来的卷号，如 T01,T02
	
}
@property (nonatomic, retain) IBOutlet  UITableView           *m_tableView;
@property (nonatomic, retain)           LectionCatalogElement *m_lectionCatalogElement;
@property (nonatomic, retain)           NSArray               *m_subVolumn;
@property (nonatomic, retain)           NSString              *m_volunNo;


@end
