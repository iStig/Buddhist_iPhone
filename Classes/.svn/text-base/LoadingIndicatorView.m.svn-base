//
//  LoadingIndicatorView.m
//  dfdaily
//
//  Created by jishen on 6/16/10.
//  Copyright 2010 SmilingMobile. All rights reserved.
//

#import "LoadingIndicatorView.h"


@implementation LoadingIndicatorView

@synthesize activityView;


- (void)dealloc {
	[activityView release];
    [super dealloc];
}

- (void) startAnimating {
	activityView.hidden = NO;
	[activityView startAnimating];
}

- (void) stopAnimating {
	[activityView stopAnimating];
}


@end
