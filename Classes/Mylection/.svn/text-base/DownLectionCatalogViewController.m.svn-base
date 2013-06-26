    //
//  DownLectionCatalogViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-18.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "DownLectionCatalogViewController.h"
#import "Catalog.h"
#import "DownSubVolumnCatalogViewController.h"
#import "DownloadTableCell.h"
//#import "Define.h"

@implementation DownLectionCatalogViewController

@synthesize m_downLectionCatalogArray;
@synthesize m_volumnCatalogElement;
@synthesize m_tableView;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//self.contentSizeForViewInPopover = POPOVERSIZE;
	NSArray * array =[m_volumnCatalogElement.m_chapOrVolu componentsSeparatedByString:@"("];
	NSLog(@"%d",[array count]);
	if ([array count]==0) {
		self.title = m_volumnCatalogElement.m_chapOrVolu;
	}else {
		self.title = [array objectAtIndex:0];
	}
	
	UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem = backItem;
	[backItem release];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated;{
	
	Catalog *catalog;
	// get the catalog
	catalog = [Catalog sharedCatalog];
	NSString *volumnName = [[NSString alloc] initWithString: self.m_volumnCatalogElement.m_chapOrVolu];
	NSMutableArray *lectionCatalogArray = [[NSMutableArray alloc]initWithArray: self.m_volumnCatalogElement.m_catalog];
	self.m_downLectionCatalogArray = lectionCatalogArray;
	
	[volumnName release];
	[lectionCatalogArray release];
    
	[m_tableView reloadData];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
    [super viewDidUnload];
}

- (void)dealloc {
	
	[m_downLectionCatalogArray release];
	[m_volumnCatalogElement release];
	[m_tableView release];
	[super dealloc];
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_downLectionCatalogArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"topCatalogCell";
    
	DownloadTableCell *cell = (DownloadTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
    	NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DownloadTableCell" owner:self 
														   options:nil];
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (DownloadTableCell *) currentObject;
				break;
			}
		}
		
	}
    // Configure the cell...
    NSDictionary *dict = [m_downLectionCatalogArray objectAtIndex:indexPath.row];
	LectionCatalogElement *lectionCataElement = [[LectionCatalogElement alloc] initWithDictionary:dict];
	cell.m_info.text =  lectionCataElement.m_lectionName;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[lectionCataElement release];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *dict = [m_downLectionCatalogArray objectAtIndex:indexPath.row];
	LectionCatalogElement *lectionCataElement = [[LectionCatalogElement alloc]initWithDictionary:dict];
	DownSubVolumnCatalogViewController *controller = [[DownSubVolumnCatalogViewController alloc] 
												  initWithNibName:@"DownSubVolumnCatalogView" bundle:nil];
	controller.m_volumnNo =[self calculateTotalVolumnNo:self.m_volumnCatalogElement];
	controller.m_lectionCatalogElement = lectionCataElement;
	[self.navigationController pushViewController:controller animated:YES];
	[lectionCataElement release];
	[controller release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
 
-(NSString *) calculateTotalVolumnNo :(CatalogElement *)voluCateElement
{
    NSMutableString *volumnNo = [[[NSMutableString alloc]initWithString:voluCateElement.m_chapOrVolu]autorelease];
	[volumnNo deleteCharactersInRange:NSMakeRange(3, [voluCateElement.m_chapOrVolu length]-3)];
	return volumnNo;
}


@end
