    //
//  SecondCatalogViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-4.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "SecondCatalogViewController.h"
#import "LectionCatalogviewController.h"
#import "Catalog.h"
#import "DownloadTableCell.h"
#import "LectionCatalogElement.h"
#import "DownloadViewController.h"

#define TITLELABEL_TAG 1001

@implementation SecondCatalogViewController


@synthesize m_secondCatalogArray;
@synthesize m_catalogElement;
@synthesize m_tableView;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
	
	NSArray * array =[m_catalogElement.m_chapOrVolu componentsSeparatedByString:@"("];
	NSLog(@"%d",[array count]);
	if ([array count]==0) {
		self.title = m_catalogElement.m_chapOrVolu;
	}else {
		self.title = [array objectAtIndex:0];
	}
	
	UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem = backItem;
	[backItem release];
	
	Catalog *catalog;
	// get the catalog
	catalog = [Catalog sharedCatalog];
	//获取某一章
	NSString *chap = [[NSString alloc] initWithString: self.m_catalogElement.m_chapOrVolu];
	NSArray *secondCataArray =[[NSArray alloc]initWithArray:[catalog subChapter:chap]];
    self.m_secondCatalogArray = secondCataArray;
	[chap release];
	[secondCataArray release];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
	
	[m_tableView release];
	[m_secondCatalogArray release];
	[m_catalogElement release];
	
    [super dealloc];
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_secondCatalogArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UILabel *namelabel;
	static NSString *CellIdentifier = @"topCatalogCell";
    
	DownloadTableCell *cell = (DownloadTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		
	    cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier
																	 :CellIdentifier]autorelease];
	}else {
		namelabel = (UILabel *)[cell.contentView viewWithTag:TITLELABEL_TAG];
		[namelabel removeFromSuperview];
	}


	NSDictionary *dict = [self.m_secondCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForVolumn:dict];
	namelabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 228, 25)];
	namelabel.tag = TITLELABEL_TAG;
	namelabel.text = cataElement.m_chapOrVolu;
		
	[cell.contentView addSubview:namelabel];
	if ([[dict objectForKey:@"download_status"]intValue]==0) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		button.frame = CGRectMake(247, 11, 53, 29);
		[button setTitle:@"下载" forState:UIControlStateNormal];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
		cell.accessoryView = button;
	} else {
		cell.accessoryView =nil;
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[cataElement release];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *dict = [m_secondCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *secondCataElement = [[CatalogElement alloc] initWithDictionaryForVolumn:dict];
	
	LectionCatalogViewController *controller = [[LectionCatalogViewController alloc] 
											   initWithNibName:@"LectionCatalogView" bundle:nil];
	controller.m_chapterCatalogElement = self.m_catalogElement;
	controller.m_volumnCatalogElement = secondCataElement;
	[self.navigationController pushViewController:controller animated:YES];
	[secondCataElement release];
	[controller release];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)buttonTapped:(id)sender
{
	
	DownloadViewController* downloadViewController = [[DownloadViewController alloc]initWithNibName
													  :@"DownloadViewController" bundle:nil];
	
	
	UIButton *senderButton =(UIButton *)sender;
	UITableViewCell  *buttonCell = (UITableViewCell *)[senderButton superview];
	NSUInteger buttonRow =[[self.m_tableView indexPathForCell:buttonCell]row];
	
	NSDictionary *dictVolu = [NSDictionary dictionaryWithDictionary:[self.m_secondCatalogArray objectAtIndex:buttonRow]];
	CatalogElement *volumElement = [[CatalogElement alloc]initWithDictionaryForVolumn:dictVolu];
	downloadViewController.m_downVolumElement = volumElement;
	UINavigationController* navigation = [[UINavigationController alloc]initWithRootViewController:downloadViewController];
	[self presentModalViewController:navigation animated:YES];
	
	[navigation release];
	[downloadViewController release];
	NSLog(@"fdfd");
}

@end











