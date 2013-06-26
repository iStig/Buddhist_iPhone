    //
//  DownSubVolumnCatalogViewController.m
//  cbeta
//
//  Created by SmilingMobile on 10-6-18.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "DownSubVolumnCatalogViewController.h"
#import "Catalog.h"
#import "SubVolumnElement.h"
#import "DownloadTableCell.h"
#import "DownPageViewController.h"

@implementation DownSubVolumnCatalogViewController

@synthesize m_tableView;
@synthesize m_lectionCatalogElement;
@synthesize m_downSubVolumn;
@synthesize m_volumnNo;

- (void)dealloc {
	
	[m_lectionCatalogElement release];
	[m_tableView release];
	[m_downSubVolumn release];
	[m_volumnNo release];
	
	[super dealloc];
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
	
	//self.contentSizeForViewInPopover = POPOVERSIZE;
	self.title = m_lectionCatalogElement.m_lectionName;
	UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem = backItem;
	[backItem release];
	
	Catalog *catalog;
	// get the catalog
	catalog = [Catalog sharedCatalog];
	self.m_downSubVolumn = [catalog getSubVolumn:self.m_lectionCatalogElement];
	[super viewDidLoad];
}


-(void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:YES];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
    [super viewDidUnload];

}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [m_downSubVolumn count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"topCatalogCell";
	DownloadTableCell *cell = (DownloadTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
    	
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DownloadTableCell" 
																 owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (DownloadTableCell *) currentObject;
				break;
			}
		}
		
	}
	
    // Configure the cell...
    NSDictionary *dict = [self.m_downSubVolumn objectAtIndex:indexPath.row];
	SubVolumnElement *subCataElement = [[SubVolumnElement alloc] initWithDictionary:dict];
	cell.m_info.text = subCataElement.m_subVolumnName;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[subCataElement release];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	
	NSDictionary       *dict = [self.m_downSubVolumn objectAtIndex:indexPath.row];
	SubVolumnElement   *subVoluCataElement = [[SubVolumnElement alloc] initWithDictionary:dict];
	DownPageViewController *controller = [[DownPageViewController alloc] 
										  initWithNibName:@"DownPageView" bundle:nil];
	controller.m_volumnNo = self.m_volumnNo;  //卷号传递
	
	NSString *lectionName =[[NSString alloc]initWithString:self.m_lectionCatalogElement.m_lectionName];
    controller.m_lectionName =lectionName;  //卷名赋值
	
	controller.m_subvolumnNo = subVoluCataElement.m_subVolumnNo; //分卷号赋值
	
	NSString *strlectionNo;//改变后的经书编号
	//用于保存要改变经书编号的字符串
	NSMutableString *tmplectionNo = [NSMutableString stringWithString:self.m_lectionCatalogElement.m_lectionNumber];
	if ([self.m_volumnNo isEqualToString:@"T05"]) 
	{	
		[tmplectionNo appendString:@"a"];
	} else if ([self.m_volumnNo isEqualToString:@"T06"])
	{
		[tmplectionNo appendString:@"b"];
	} else if ([self.m_volumnNo isEqualToString:@"T07"]) 
	{
		//NSMutableString *strsubVoluNo = [NSMutableString stringWithFormat:subVoluCataElement.m_subVolumnNo];
		NSMutableString *strsubVoluNo = [NSMutableString stringWithString:subVoluCataElement.m_subVolumnNo];
		NSInteger intSubNO =[strsubVoluNo intValue];
		if (intSubNO<400) {
		}
		else if (intSubNO <= 537) {
			[tmplectionNo appendString:@"c"];
		}else if (intSubNO <= 565) {
			[tmplectionNo appendString:@"d"];
		}else if (intSubNO <= 573) {
			[tmplectionNo appendString:@"e"];
		}else if (intSubNO <= 575) {
			[tmplectionNo appendString:@"f"];
		}else if (intSubNO == 576) {
			[tmplectionNo appendString:@"g"];
		}else if (intSubNO == 577) {
			[tmplectionNo appendString:@"h"];
		}else if (intSubNO == 578) {
			[tmplectionNo appendString:@"i"];
		}else if (intSubNO <= 583) {
			[tmplectionNo appendString:@"j"];
		}else if (intSubNO <= 588) {
			[tmplectionNo appendString:@"k"];
		}else if (intSubNO == 589) {
			[tmplectionNo appendString:@"l"];
		}else if (intSubNO == 590) {
			[tmplectionNo appendString:@"m"];
		}else if (intSubNO <= 592) {
			[tmplectionNo appendString:@"n"];
		}else if (intSubNO <= 600) {
			[tmplectionNo appendString:@"o"];
		}else  {
		}
	}
	else {
		
	}
	strlectionNo =[NSString stringWithFormat:@"%@", tmplectionNo];
	controller.m_lectionNo = strlectionNo;    //卷号赋值
	
	[self.navigationController pushViewController:controller animated:YES];
	[subVoluCataElement release];
	[lectionName release];
	[controller release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


 

@end
