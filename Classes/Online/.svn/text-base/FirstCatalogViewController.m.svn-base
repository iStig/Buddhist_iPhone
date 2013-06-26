    //
//  FirstCatalogViewController.m
//  cbeta
//
//  Created by jishen on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FirstCatalogViewController.h"

#import "Catalog.h"
#import "CatalogElement.h"
#import "DownloadTableCell.h"
#import "SecondCatalogViewController.h"


@implementation FirstCatalogViewController

@synthesize m_tableView;
@synthesize m_firstCatalogArray;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem = backItem;
	[backItem release];
	
	Catalog *catalog;
	
	// get the catalog
	catalog = [Catalog sharedCatalog];
	NSArray *firCataArray = [[NSArray alloc]initWithArray:[catalog topCatalog]];
	self.m_firstCatalogArray = firCataArray;
    [firCataArray release];
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[m_tableView release];
	[m_firstCatalogArray release];
    [super dealloc];
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_firstCatalogArray count];
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
	NSDictionary *dict = [m_firstCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForChapter:dict];
	cell.m_info.text = cataElement.m_chapOrVolu;
	cell.m_info.adjustsFontSizeToFitWidth = YES;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cataElement release];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *  dict = [self.m_firstCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForChapter:dict];
	SecondCatalogViewController *controller = [[SecondCatalogViewController alloc] 
												initWithNibName:@"SecondCatalogView" bundle:nil];
	controller.m_catalogElement = cataElement;
	[self.navigationController pushViewController:controller animated:YES];

	[cataElement release];
	[controller release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

@end
