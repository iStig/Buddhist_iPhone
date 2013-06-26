    //
//  DownFirstCatalogViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-18.
//  Copyright 2010 SmilingMobile. All rights reserved.
//



#import "DownFirstCatalogViewController.h"
#import "Catalog.h"
#import "CatalogElement.h"
#import "DownSecondCatalogViewController.h"
#import "DownloadTableCell.h"
//#import "Define.h"

@implementation DownFirstCatalogViewController

@synthesize m_downTableView;
@synthesize m_downFirstCatalogArray;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//self.contentSizeForViewInPopover = POPOVERSIZE;
	UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem = backItem;
	[backItem release];
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated;{

	Catalog *catalog;
	catalog = [Catalog sharedCatalog];
	NSMutableArray *firCataArray = [catalog getDownFirstCatalog];
	self.m_downFirstCatalogArray= firCataArray;
	[m_downTableView reloadData];

}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[m_downTableView release];
	[m_downFirstCatalogArray release];
    [super dealloc];
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_downFirstCatalogArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"topCatalogCell";
	DownloadTableCell *cell = (DownloadTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
    	
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DownloadTableCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (DownloadTableCell *) currentObject;
				break;
			}
		}
	}
	
	NSDictionary *dict = [m_downFirstCatalogArray objectAtIndex:indexPath.row];
	
	CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForChapter:dict];
	cell.textLabel.text = cataElement.m_chapOrVolu;
	cell.m_info.text = cataElement.m_chapOrVolu;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[cataElement release];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *  dict = [self.m_downFirstCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForChapter:dict];
	DownSecondCatalogViewController *controller = [[DownSecondCatalogViewController alloc] 
											   initWithNibName:@"DownSecondCatalogView" bundle:nil];
	controller.m_downCatalogElement = cataElement;
	[self.navigationController pushViewController:controller animated:YES];
	[cataElement release];
	[controller release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end

