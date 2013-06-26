//
//  SearchViewController.h
//  cbeta
//
//  Created by chao he on 10-7-12.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>{
	
	BOOL isNetSearch;
	UITableView *m_tableView;
	UISegmentedControl *m_segmentCtrl;
	UISearchBar *m_searchBar;
	
	NSMutableArray *m_resultLectionArray;       //接受检索结果
	NSMutableArray *m_resultVolumnNo;           //接受检索卷结果
	NSArray *m_lectionArray;                    //经文数组
	
	NSMutableArray *m_downResultLectionArray;       //接受检索结果
	NSMutableArray *m_downResultVolumnNo;           //接受检索卷结果
	NSArray *m_downLectionArray;                       //本地默认经文
}

@property (nonatomic) BOOL isNetSearch;
@property (nonatomic ,retain) IBOutlet UITableView *m_tableView;
@property (nonatomic ,retain) IBOutlet UISegmentedControl *m_segmentCtrl;
@property (nonatomic ,retain) IBOutlet UISearchBar *m_searchBar;
@property (nonatomic ,retain) IBOutlet NSMutableArray *m_resultLectionArray;
@property (nonatomic ,retain) IBOutlet NSMutableArray *m_resultVolumnNo; 
@property (nonatomic ,retain) IBOutlet NSArray *m_lectionArray;
@property (nonatomic ,retain) IBOutlet NSMutableArray *m_downResultLectionArray;
@property (nonatomic ,retain) IBOutlet NSMutableArray *m_downResultVolumnNo; 
@property (nonatomic ,retain) IBOutlet NSArray *m_downLectionArray;

- (IBAction) switchList: (id) sender;
-(void)handleSearchForItem:(NSString *)searchItem;
-(void)handleSearchForDownLoadItem:(NSString *)searchItem;

@end
