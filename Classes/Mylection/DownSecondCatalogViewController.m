    //
//  DownSecondCatalogViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-18.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "DownSecondCatalogViewController.h"
#import "Catalog.h"
#import "DownLectionCatalogViewController.h"
#import "DownloadTableCell.h"
//#import "Define.h"

@implementation DownSecondCatalogViewController

@synthesize m_downSecondCatalogArray;
@synthesize m_downCatalogElement;
@synthesize m_tableView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
    }
    return self;
}

- (void)viewDidLoad {
	
//	self.contentSizeForViewInPopover = POPOVERSIZE;
	NSArray * array =[m_downCatalogElement.m_chapOrVolu componentsSeparatedByString:@"("];
	NSLog(@"%d",[array count]);
	if ([array count]==0) {
		self.title = m_downCatalogElement.m_chapOrVolu;
	}else {
		self.title = [array objectAtIndex:0];
	}
	
	UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem = backItem;
	[backItem release];
	
	UIBarButtonItem * deleteItem = [[UIBarButtonItem alloc ] initWithTitle:@"删除" style:UIBarButtonItemStyleBordered
																	target:self action:@selector(toggleEdit:)];
	self.navigationItem.rightBarButtonItem = deleteItem;
	[deleteItem release];
	[super viewDidLoad];

	
}

-(IBAction)toggleEdit:(id)sender
{
	[self.m_tableView setEditing:!self.m_tableView.editing animated:YES];
	if (self.m_tableView.editing) {
		[self.navigationItem.rightBarButtonItem setTitle:@"完成"];
	}
	else {
		[self.navigationItem.rightBarButtonItem setTitle:@"删除"];
	}
}


- (void)viewWillAppear:(BOOL)animated;{
	
	Catalog *catalog;
	catalog = [Catalog sharedCatalog];
	//获取某一章
	NSString *chap = [[NSString alloc] initWithString: self.m_downCatalogElement.m_chapOrVolu];
	NSLog(@"%@",chap);
	NSMutableArray *secondCataArray =[[NSMutableArray alloc]initWithArray:[catalog getDownSecondCatalog:chap]];
    self.m_downSecondCatalogArray = secondCataArray;
	[chap release];
	[secondCataArray release];
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
	
	[m_tableView release];
	[m_downSecondCatalogArray release];
	[m_downCatalogElement release];
	[super dealloc];
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_downSecondCatalogArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"DownCatalogCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	// Configure the cell...	
	NSDictionary *dict = [m_downSecondCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *cataElement = [[CatalogElement alloc] initWithDictionaryForVolumn:dict];
	cell.textLabel.frame = CGRectMake(20, 15, 228, 25);
	cell.textLabel.text = cataElement.m_chapOrVolu;
	cell.textLabel.font = [UIFont systemFontOfSize:16];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[cataElement release];
    return cell;
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *dict = [m_downSecondCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *secondCataElement = [[CatalogElement alloc] initWithDictionaryForVolumn:dict];
	
	DownLectionCatalogViewController *controller = [[DownLectionCatalogViewController alloc] 
												initWithNibName:@"DownLectionCatalogView" bundle:nil];
	controller.m_volumnCatalogElement = secondCataElement;
	[self.navigationController pushViewController:controller animated:YES];
	[secondCataElement release];
	[controller release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark tableView data source Methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
                                           forRowAtIndexPath:(NSIndexPath *)indexPath
{
	//计算出卷号
	NSDictionary *dict = [m_downSecondCatalogArray objectAtIndex:indexPath.row];
	CatalogElement *secondCataElement = [[CatalogElement alloc]initWithDictionaryForVolumn:dict];
	NSMutableString *volumnNo = [[NSMutableString alloc]initWithString:secondCataElement.m_chapOrVolu];
	[volumnNo deleteCharactersInRange:NSMakeRange(3, [secondCataElement.m_chapOrVolu length]-3)];
	
	Catalog *catalog = [Catalog sharedCatalog];
	[catalog setDownLoadStatus:volumnNo isDownLoad:NO];
	
	//delete dictory 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docummentPath = ([paths count]>0) ? [paths objectAtIndex:0] : nil;
	NSString *tempDictory = [docummentPath stringByAppendingString:@"/"];
	NSString *dictoryPath = [tempDictory stringByAppendingString:volumnNo];
	if ([[NSFileManager defaultManager] fileExistsAtPath:dictoryPath]) {
		NSError *error = nil;
		bool oldDocument = [[NSFileManager defaultManager] removeItemAtPath:dictoryPath error:&error];
		NSAssert3(oldDocument, @"Unhandled error adding persistent store in %s at line %d: %@"
				  , __FUNCTION__, __LINE__, [error localizedDescription]);
	}
	
	[m_downSecondCatalogArray removeObjectAtIndex:[indexPath row]];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
					 withRowAnimation:UITableViewRowAnimationFade];
	
	[volumnNo release];
	[secondCataElement release];
	
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}



@end
