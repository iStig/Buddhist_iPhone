//
//  LectionCatalogview.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-7.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "LectionCatalogViewController.h"
#import "Catalog.h"
#import "DownloadTableCell.h"
#import "SubVolumnCatalogViewController.h"

@implementation LectionCatalogViewController

@synthesize m_lectionCatalogArray;
@synthesize m_chapterCatalogElement;
@synthesize m_volumnCatalogElement;
@synthesize m_tableView;

-(NSString *) calculateTotalVolumnNo :(CatalogElement *)voluCateElement
{
    NSMutableString *volumnNo = [[[NSMutableString alloc]initWithString:voluCateElement.m_chapOrVolu]autorelease];
	[volumnNo deleteCharactersInRange:NSMakeRange(3, [voluCateElement.m_chapOrVolu length]-3)];
	return volumnNo;
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
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
	
	
	Catalog *catalog;
	
	// get the catalog
	catalog = [Catalog sharedCatalog];

	NSString *chapName  = [[NSString alloc] initWithString: self.m_chapterCatalogElement.m_chapOrVolu];
	NSString *volumnName = [[NSString alloc] initWithString: self.m_volumnCatalogElement.m_chapOrVolu];
	
	
    NSArray *lectionCatalogArray = [[NSArray alloc]initWithArray: [catalog subVolumn:chapName withVolumn:volumnName]];
	self.m_lectionCatalogArray = lectionCatalogArray;
	
	[chapName release];
	[volumnName release];
	[lectionCatalogArray release];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
    [super viewDidUnload];
}


- (void)dealloc {
	
	[m_lectionCatalogArray release];
	[m_chapterCatalogElement release];
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
    return [m_lectionCatalogArray count];
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
    
	// Configure the cell...
    NSDictionary *dict = [m_lectionCatalogArray objectAtIndex:indexPath.row];
	
	LectionCatalogElement *lectionCataElement = [[LectionCatalogElement alloc] initWithDictionary:dict];
	cell.m_info.text = lectionCataElement.m_lectionName;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[lectionCataElement release];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *dict = [m_lectionCatalogArray objectAtIndex:indexPath.row];
	LectionCatalogElement *lectionCataElement = [[LectionCatalogElement alloc] initWithDictionary:dict];
	
	SubVolumnCatalogViewController *controller = [[SubVolumnCatalogViewController alloc] 
												initWithNibName:@"SubVolumnCatalogView" bundle:nil];

	controller.m_volunNo = [self calculateTotalVolumnNo:self.m_volumnCatalogElement];
	controller.m_lectionCatalogElement = lectionCataElement;
	[self.navigationController pushViewController:controller animated:YES];
	[lectionCataElement release];
	[controller release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

