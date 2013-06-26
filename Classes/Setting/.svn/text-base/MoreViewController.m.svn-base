//
//  MoreViewController.m
//  cbeta
//
//  Created by chao he on 10-7-26.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "MoreViewController.h"
#import "HelpViewController.h"
#import "SettingViewController.h"
@implementation MoreViewController

@synthesize m_controllerArray;
#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
	self.title = @"更多";
	NSMutableArray *array = [[NSMutableArray alloc]init];
	SettingViewController *settingViewController = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
	settingViewController.title = @"设置";
	[array addObject:settingViewController];
	[settingViewController release];
	
	HelpViewController *helpViewController = [[HelpViewController alloc]initWithNibName:@"HelpViewController" bundle:nil];
	helpViewController.title = @"帮助";
	[array addObject:helpViewController];
	[helpViewController release];
	self.m_controllerArray = array;
	[array release];
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark -
#pragma mark Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_controllerArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	NSUInteger row = [indexPath row];
	UIViewController *controller = [m_controllerArray objectAtIndex:row];
	cell.textLabel.text = controller.title;
	cell.textLabel.font = [UIFont systemFontOfSize:17];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
	NSUInteger row = [indexPath row];
	UIViewController *controller = [self.m_controllerArray objectAtIndex:row];
	[self.navigationController pushViewController:controller animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[m_controllerArray release];
    [super dealloc];
}


@end

