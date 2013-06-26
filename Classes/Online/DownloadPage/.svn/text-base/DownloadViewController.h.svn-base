//
//  DownloadViewController.h
//  Download
//
//  Created by landry yang on 10-3-25.
//  Copyright lzjtu 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatalogElement.h"
#import "NTProgressView.h"
@interface DownloadViewController : UIViewController {
	
    UILabel *                   statusLabel;
    UIActivityIndicatorView *   activityIndicator;
	UIButton *                  statusButton;
	//UIImageView *               imageView;
	//UIProgressView*             statusProgress;
	 NTProgressView *             statusProgress;
	 float progressPercent;
	 NSInteger dataLen;	
	 NSInteger size;
	
	    
    NSURLConnection *           connection;
    NSString *                  filePath;
    NSOutputStream *            fileStream;
	
	
 //NSUInteger           m_buttonRow;              //接受行号
//	NSArray             *m_downArrays;             //接受传过来的当前目录的数组  
	CatalogElement      *m_downVolumElement;      
	NSString           *kDefaultGetURLText;          //当前下载的URL
	NSString          *m_volumnName;                  //当前下载的卷的名字
}

@property (nonatomic, retain) IBOutlet UILabel *                   statusLabel;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *   activityIndicator;
@property (nonatomic, retain) IBOutlet UIButton *           statusButton;
//@property (nonatomic, retain) IBOutlet UIImageView *               imageView;
//@property (nonatomic, retain) IBOutlet UIProgressView* statusProgress;
@property (nonatomic, retain) IBOutlet	 NTProgressView *       statusProgress;
@property (nonatomic, readonly) BOOL              isReceiving;
@property (nonatomic) float progressPercent;
@property (nonatomic) NSInteger dataLen;
@property (nonatomic) NSInteger size;

@property (nonatomic, retain)   NSURLConnection * connection;
@property (nonatomic, copy)     NSString *        filePath;
@property (nonatomic, retain)   NSOutputStream *  fileStream;

//@property (nonatomic,assign)	NSUInteger           m_buttonRow; 
//@property (nonatomic,retain)	NSArray             *m_downArrays;  
@property (nonatomic,retain)	CatalogElement      *m_downVolumElement; 
@property (nonatomic,retain)	NSString           *kDefaultGetURLText ;
@property (nonatomic,retain)	NSString           *m_volumnName;

- (IBAction)getOrCancelAction:(id)sender;
-(void) makeUrl;
-(NSString *) calculateTotalVolumnNo :(CatalogElement *)voluCateElement;  //计算出第二层的卷号 ，如 T01 ,T02
-(void)dismissSelf:(id)sender;

@end

