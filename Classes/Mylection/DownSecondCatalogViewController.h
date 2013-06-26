//
//  DownSecondCatalogViewController.h
//  cbeta
//
//  Created by SmilingMobile on 10-6-18.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatalogElement.h"

@interface DownSecondCatalogViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
	
	NSMutableArray *m_downSecondCatalogArray;
	CatalogElement *m_downCatalogElement;               //前一个传来的参数
	UITableView *m_tableView;
	
}

@property (nonatomic, retain) NSMutableArray *m_downSecondCatalogArray;
@property (nonatomic, retain) CatalogElement *m_downCatalogElement;
@property (nonatomic, retain) IBOutlet UITableView *m_tableView;
@end
