//
//  DownloadViewController.m
//  Download
//
//  Created by landry yang on 10-3-25.
//  Copyright lzjtu 2010. All rights reserved.
//

#import "DownloadViewController.h"
#import "cbetaAppDelegate.h"
#import "Catalog.h"
#import "ZipArchive.h"

@implementation DownloadViewController

@synthesize connection; 
@synthesize filePath;    
@synthesize fileStream; 
@synthesize statusLabel;
@synthesize activityIndicator;
@synthesize statusButton;
@synthesize statusProgress;
@synthesize progressPercent;
@synthesize dataLen;	
@synthesize size;

//@synthesize m_buttonRow;
//@synthesize m_downArrays;
@synthesize m_downVolumElement;
@synthesize kDefaultGetURLText;
@synthesize m_volumnName;

//static NSString * kDefaultGetURLText = @"http://www.cbeta.org/download/xml-p5/T01.zip";

- (void)changeProgress:(float)progress
{
	//NSMutableString *url = [[NSMutableString alloc] initWithCapacity:128] ;
//	NSInteger pro = progress*100;
//	[url appendFormat:@"%d/100(％)", pro];
//	self.downProgress.text = url;
//	[url release];
	self.statusProgress.process = progressPercent;
	if(self.statusProgress.process >= 1) 
	{
		statusProgress.process = 1;
	}
	[self.statusProgress setNeedsDisplay];
}


-(void) makeUrl
{
    NSMutableString *tempUrl =[NSMutableString stringWithString:@"http://www.cbeta.org/download/xml-p5/"];

	//NSDictionary *dictVolu = [NSDictionary dictionaryWithDictionary:[self.m_downArrays objectAtIndex:self.m_buttonRow]];
	//CatalogElement *volumElement = [[CatalogElement alloc]initWithDictionaryForVolumn:dictVolu];						   

	//self.m_volumnName =volumElement.m_chapOrVolu;
	self.m_volumnName =self.m_downVolumElement.m_chapOrVolu;
	[tempUrl appendString:[self calculateTotalVolumnNo:self.m_downVolumElement]];
	[tempUrl appendString:@".zip"];
	NSString *url1 =[NSString stringWithString:tempUrl];
	self.kDefaultGetURLText = url1;

}


-(NSString *) calculateTotalVolumnNo :(CatalogElement *)voluCateElement
{
    NSMutableString *volumnNo = [[[NSMutableString alloc]initWithString:voluCateElement.m_chapOrVolu]autorelease];
	[volumnNo deleteCharactersInRange:NSMakeRange(3, [voluCateElement.m_chapOrVolu length]-3)];
	return volumnNo;
}


#pragma mark * Status management

// These methods are used by the core transfer code to update the UI.

- (void)_receiveDidStart
{
    // Clear the current image so that we get a nice visual cue if the receive fails.
    //self.statusLabel.text = @"Receiving";
	self.statusLabel.text = @"接受中";
	//self.imageView.image = [UIImage imageNamed:@"NoImage.png"];
	self.statusProgress.process = 0.0f;
	self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
   [[cbetaAppDelegate sharedAppDelegate] didStartNetworking];
	self.statusButton.hidden =YES;
}

- (void)_updateStatus:(NSString *)statusString
{
    assert(statusString != nil);
	self.statusProgress.process=progressPercent;
    self.statusLabel.text = statusString;
}

- (void)_receiveDidStopWithStatus:(NSString *)statusString
{
    if (statusString == nil) {
        assert(self.filePath != nil);
        //do something here
      //  statusString = @"GET succeeded";
		statusString = @"下载成功";
    }
    self.statusLabel.text = statusString;
	//self.statusProgress.progress= 1.0;
	self.statusProgress.process = 1.0f;
	[self.statusProgress setNeedsDisplay];
    //self.statusButton.setTitle= @"Get";
	//self.imageView.image = [UIImage imageWithContentsOfFile:self.filePath];
    [self.activityIndicator stopAnimating];
	 self.activityIndicator.hidden = YES;
    [[cbetaAppDelegate  sharedAppDelegate] didStopNetworking];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	NSString*tempZipName =[documentpath stringByAppendingString:@"/"];  
	NSString*tempZipName1 =[tempZipName stringByAppendingString:self.m_volumnName];  
	NSString* l_zipfile = [tempZipName1 stringByAppendingString:@".zip"];
	NSString* unzipto = [documentpath stringByAppendingString:@""] ;
	if ([[NSFileManager defaultManager]fileExistsAtPath:l_zipfile]) {
		
		//更改保存plist文件.
		Catalog *catalog =[Catalog sharedCatalog];
		NSMutableString* voluNo =[NSMutableString stringWithString:self.m_volumnName];
		[voluNo deleteCharactersInRange:NSMakeRange(3, [voluNo length]-3)];
		[catalog setDownLoadStatus:voluNo isDownLoad:YES];
		
		//解压文件
		ZipArchive* zip = [[ZipArchive alloc] init];
		if( [zip UnzipOpenFile:l_zipfile] )
		{
			BOOL ret = [zip UnzipFileTo:unzipto overWrite:YES];
			if( NO==ret )
			{
			}
			
			[zip UnzipCloseFile];
			[catalog setDownLoadStatus:voluNo isDownLoad:YES];
		}else {
			[catalog setDownLoadStatus:voluNo isDownLoad:NO];
		}
		[zip release];
		
		//删除源文件
	    NSError *error = nil;
		bool oldStoreRemoveSuccess = [[NSFileManager defaultManager] removeItemAtPath:l_zipfile error:&error];
		NSAssert3(oldStoreRemoveSuccess, @"Unhandled error adding persistent store in %s at line %d: %@"
				  , __FUNCTION__, __LINE__, [error localizedDescription]);
	}else {
		NSLog(@"不存在文件");
	}
	
}

#pragma mark * Core transfer code

// This is the code that actually does the networking.

- (BOOL)isReceiving
{
    return (self.connection != nil);
}

- (void)_startReceive
// Starts a connection to download the current URL.
{
    BOOL                success;
    NSURL *             url;
    NSURLRequest *      request;
    
    assert(self.connection == nil);         // don't tap receive twice in a row!
    assert(self.fileStream == nil);         // ditto
    assert(self.filePath == nil);           // ditto
	
    // First get and check the URL.
    url = [[cbetaAppDelegate sharedAppDelegate] smartURLForString:kDefaultGetURLText];
  
    success = (url != nil);
	
    // If the URL is bogus, let the user know.  Otherwise kick off the connection.
    
    if ( ! success) {
        self.statusLabel.text = @"Invalid URL";
    } else {
		
        // Open a stream for the file we're going to receive into.
		
   //   self.filePath = [[cbetaAppDelegate sharedAppDelegate] pathForTemporaryFileWithPrefix:@"Get"];
		  self.filePath = [[cbetaAppDelegate sharedAppDelegate] pathForTemporaryFileWithPrefix:self.m_volumnName];
        assert(self.filePath != nil);
        
        self.fileStream = [NSOutputStream outputStreamToFileAtPath:self.filePath append:NO];
        assert(self.fileStream != nil);
        
        [self.fileStream open];
		
        // Open a connection for the URL.
		
        request = [NSURLRequest requestWithURL:url];
        assert(request != nil);
        
        self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
        assert(self.connection != nil);
		
        // Tell the UI we're receiving.
        
        [self _receiveDidStart];
    }
}

- (void)_stopReceiveWithStatus:(NSString *)statusString
// Shuts down the connection and displays the result (statusString == nil) 
// or the error status (otherwise).
{
    if (self.connection != nil) {
        [self.connection cancel];
        self.connection = nil;
    }
    if (self.fileStream != nil) {
        [self.fileStream close];
        self.fileStream = nil;
    }
    [self _receiveDidStopWithStatus:statusString];
    self.filePath = nil;
	
}

- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response
// A delegate method called by the NSURLConnection when the request/response 
// exchange is complete.  We look at the response to check that the HTTP 
// status code is 2xx and that the Content-Type is acceptable.  If these checks 
// fail, we give up on the transfer.
{
    #pragma unused(theConnection)
	
    NSHTTPURLResponse * httpResponse;
    NSString *          contentTypeHeader;
	
    assert(theConnection == self.connection);
    
    httpResponse = (NSHTTPURLResponse *) response;
    assert( [httpResponse isKindOfClass:[NSHTTPURLResponse class]] );
    
    if ((httpResponse.statusCode / 100) != 2) {
        [self _stopReceiveWithStatus:[NSString stringWithFormat:@"HTTP error %zd", (ssize_t) httpResponse.statusCode]];
    } 
	else {
        contentTypeHeader = [httpResponse.allHeaderFields objectForKey:@"Content-Type"];
        if (contentTypeHeader == nil) {
            [self _stopReceiveWithStatus:@"No Content-Type!"];
		} 
		else {			
            self.statusLabel.text = @"Response OK.";
        }
    }    
	
	int dataSize = [response expectedContentLength];
	self.size = dataSize;
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)data
// A delegate method called by the NSURLConnection as data arrives.  We just 
// write the data to the file.
{
	
	
	self.statusButton.titleLabel.text = @"取消";
#pragma unused(theConnection)
    NSInteger       dataLength;
    const uint8_t * dataBytes;
    NSInteger       bytesWritten;
    NSInteger       bytesWrittenSoFar;
	
    assert(theConnection == self.connection);
    
    dataLength = [data length];
    dataBytes  = [data bytes];
	
    bytesWrittenSoFar = 0;
    do {
        bytesWritten = [self.fileStream write:&dataBytes[bytesWrittenSoFar] maxLength:dataLength - bytesWrittenSoFar];
        assert(bytesWritten != 0);
        if (bytesWritten == -1) {
            [self _stopReceiveWithStatus:@"File write error"];
            break;
        } else {
			//displaying the download progress
            bytesWrittenSoFar += bytesWritten;
			float percentComplete=(bytesWrittenSoFar/(float)dataLength);
			self.progressPercent = percentComplete;
			
			NSMutableString *downingStatus =[NSMutableString stringWithFormat:@"正在下载%@",self.m_volumnName];
			NSString *downingStatus1= [NSString stringWithString:downingStatus];
			[self _updateStatus:downingStatus1];	
			//[self _updateStatus:@"Waiting for a moment"];			
			
        }
    } while (bytesWrittenSoFar != dataLength);
	
	self.dataLen = self.dataLen +dataLength;
	float percentComplete=(self.dataLen/(float)self.size);
	self.progressPercent = percentComplete;
	[self changeProgress:self.progressPercent];
	
}

- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error
// A delegate method called by the NSURLConnection if the connection fails. 
// We shut down the connection and display the failure.  Production quality code 
// would either display or log the actual error.
{
#pragma unused(theConnection)
#pragma unused(error)
    assert(theConnection == self.connection);
    
   // [self _stopReceiveWithStatus:@"Connection failed"];
	[self _stopReceiveWithStatus:@"下载失败,请检查网络连接"];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection
// A delegate method called by the NSURLConnection when the connection has been 
// done successfully.  We shut down the connection with a nil status, which 
// causes the image to be displayed.
{
#pragma unused(theConnection)
    assert(theConnection == self.connection);
    
    [self _stopReceiveWithStatus:nil];
}
#pragma mark * UI Actions

- (IBAction)getOrCancelAction:(id)sender
{
#pragma unused(sender)
    if (self.isReceiving) {
       // [self _stopReceiveWithStatus:@"Cancelled"];
		[self _stopReceiveWithStatus:@"取消下载"];
    } else {
        [self _startReceive];
    }
}




#pragma mark * View controller boilerplate



- (void)viewDidLoad
{    
    [super viewDidLoad];
	
	UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style
																		:UIBarButtonItemStyleBordered target
																		:self action:@selector(dismissSelf:)];

	self.navigationItem.leftBarButtonItem = buttonItem;
	[buttonItem release]; 
	
    assert(self.statusLabel != nil);
    assert(self.activityIndicator != nil);
    assert(self.statusButton!= nil);
    
    //self.statusButton.titleLabel = [NSSet setWithObjects:@"Get", @"Cancel", nil];
	
    // Set up the URL field to be the last value we saved (or the default value 
    // if we have none)  
    
    self.activityIndicator.hidden = YES;
  //  self.statusLabel.text = @"Waiting for starting";
	 self.statusLabel.text = @"您确定要下载么?";
	
	
	NTProgressView * temp1 = [[NTProgressView alloc] initWithFrame:CGRectMake(31, 241, 240, 9)];
	self.statusProgress = temp1;
	[temp1 release];
	[self.view addSubview:self.statusProgress];
	
	self.statusProgress.process=0.0f;
	[self makeUrl];
	//NSLog(@"%d",[self.m_downArrays count]);
	//NSLog(@"%d",m_buttonRow);
}

-(void)dismissSelf:(id)sender
{
	[self dismissModalViewControllerAnimated:YES];

}

/*
- (void)viewWillDisappear:(BOOL)animated{

	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	NSString*tempZipName =[documentpath stringByAppendingString:@"/"];  
	NSString*tempZipName1 =[tempZipName stringByAppendingString:self.m_volumnName];  
	NSString* l_zipfile = [tempZipName1 stringByAppendingString:@".zip"];
	NSString* unzipto = [documentpath stringByAppendingString:@""] ;
	if ([[NSFileManager defaultManager]fileExistsAtPath:l_zipfile]) {
		
		//更改保存plist文件.
		Catalog *catalog =[Catalog sharedCatalog];
		NSMutableString* voluNo =[NSMutableString stringWithString:self.m_volumnName];
		[voluNo deleteCharactersInRange:NSMakeRange(3, [voluNo length]-3)];
		[catalog setDownLoadStatus:voluNo];
		
		//解压文件
		ZipArchive* zip = [[ZipArchive alloc] init];
		if( [zip UnzipOpenFile:l_zipfile] )
	  {
		BOOL ret = [zip UnzipFileTo:unzipto overWrite:YES];
		if( NO==ret )
		{
		}
		
		[zip UnzipCloseFile];
	  }
		[zip release];
	  
		//删除源文件
	    NSError *error = nil;
		bool oldStoreRemoveSuccess = [[NSFileManager defaultManager] removeItemAtPath:l_zipfile error:&error];
		NSAssert3(oldStoreRemoveSuccess, @"Unhandled error adding persistent store in %s at line %d: %@", __FUNCTION__, __LINE__, [error localizedDescription]);
	  }else {
		NSLog(@"不存在文件");
	  }
	NSLog(@"%@",self.m_volumnName);

}

 */
-(void)viewDidAppear:(BOOL)animated
{
	self.statusProgress.process=progressPercent;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
	self.statusProgress=nil;
    self.statusLabel = nil;
    self.activityIndicator = nil;
    self.statusButton = nil;
}

- (void)dealloc
{
    [self _stopReceiveWithStatus:@"Stopped"];
	[self->statusProgress release];
    [self->statusLabel release];
    [self->activityIndicator release];
    [self->statusButton release];
	//[m_downArrays release];
	[m_downVolumElement release];
	[kDefaultGetURLText release];
	[m_volumnName release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


@end
