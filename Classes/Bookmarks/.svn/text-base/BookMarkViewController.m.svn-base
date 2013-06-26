    //
//  BookMarkViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-22.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "BookMarkViewController.h"
#import "SettingData.h"
#import "DownPageViewController.h"


@implementation BookMarkViewController

@synthesize m_tableView;
@synthesize m_bookMarkArray;


-(IBAction)toggleEdit:(id)sender {
    [self.m_tableView setEditing:!self.m_tableView.editing animated:YES];
    
    if (self.m_tableView.editing)
        [self.navigationItem.rightBarButtonItem setTitle:@"完成"];
    else
        [self.navigationItem.rightBarButtonItem setTitle:@"删除"];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//SettingData *settingData = [SettingData sharedSettingData];
	//self.m_bookMarkArray = [NSMutableArray arrayWithArray:settingData.m_bookMarks];
	//NSLog(@"%d",[self.m_bookMarkArray  count]);
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"删除"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(toggleEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    [editButton release];
	[super viewDidLoad];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)viewWillAppear:(BOOL)animated {
	SettingData *settingData = [SettingData sharedSettingData];
	self.m_bookMarkArray = [NSMutableArray arrayWithArray:settingData.m_bookMarks];
    [m_tableView reloadData];
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
	[m_bookMarkArray release];
    [super dealloc];
}

#pragma mark UITableViewDelegate
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    return [m_bookMarkArray  count];
}

/*
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 CGFloat height = 60.0;
 return height;
 }
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"BookMarkIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];		//cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // Set up the cell...
	cell.textLabel.font = [UIFont systemFontOfSize: 16];
	
	NSDictionary *dictPagemark = [m_bookMarkArray objectAtIndex: indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat: @"%@ %@ %@ 第%@卷"
						   ,[dictPagemark valueForKey:@"volumnNo"]
						   ,[dictPagemark valueForKey:@"lectionNo"]
						   ,[dictPagemark valueForKey:@"lectionName"]
						   ,[dictPagemark valueForKey:@"subvolumnNo"]];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSDictionary *dictPagemark = [m_bookMarkArray objectAtIndex: indexPath.row];
	DownPageViewController *controller = [[DownPageViewController alloc] 
									  initWithNibName:@"DownPageView" bundle:nil];
	controller.m_volumnNo = [dictPagemark valueForKey:@"volumnNo"];
	controller.m_lectionNo = [dictPagemark valueForKey:@"lectionNo"];
	controller.m_subvolumnNo = [dictPagemark valueForKey:@"subvolumnNo"];
	controller.m_lectionName = [dictPagemark valueForKey:@"lectionName"];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
	
}


#pragma mark Table View Data Source Methods
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
	SettingData *settingData = [SettingData sharedSettingData];
	[settingData deleteBookMarks: indexPath.row];
	m_bookMarkArray = settingData.m_bookMarks;
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                     withRowAnimation:UITableViewRowAnimationFade];
}

@end
