//
//  NTProgressView.m
//  iComicReader
//
//  Created by yang on 10-6-21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NTProgressView.h"


@implementation NTProgressView
@synthesize process;
- (id) initWithFrame:(CGRect)rect
{
	self = [super initWithFrame:rect];
	if (self != nil) 
	{
		self.opaque = NO;
	}
	return self;
}


-(void)drawRect:(CGRect)rect
{
	
	UIColor *bgColor = [UIColor colorWithRed:.9 green:.9 blue:0 alpha:.1];
	//UIColor *bgColor = [UIColor darkGrayColor];
	UIColor *loadedColor = [UIColor colorWithRed:.8 green:.8 blue:.0 alpha:1];
	
	CGFloat radius = 10;
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, bgColor.CGColor);
	
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, .5);
	CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect);
	CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	
	CGContextClip(context);
	
	//画背景
	CGContextSetLineWidth(context, 2);
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathEOFillStroke);
	
	//画进度
	CGContextSetFillColorWithColor(context, loadedColor.CGColor);
	midx = maxx * process / 2;
	minx = -100;
	maxx = maxx * process;
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathEOFillStroke);
	
	
	
	//上弧面
	int offsetWidth = 50;
	int startX = offsetWidth * -1;
	int endX = rect.size.width + offsetWidth;
	int height = rect.size.height *1 ;
	CGContextSetRGBStrokeColor(context, 1, 0, 0, 1.0);
	CGContextSetRGBFillColor(context,1, 1, 1, .5);
	CGPoint s = CGPointMake(startX, 0);
	CGPoint e = CGPointMake(endX,0);
	CGPoint cp1 = CGPointMake( rect.size.width * .5, height);
	CGContextMoveToPoint(context, s.x, s.y);
	
	CGContextAddQuadCurveToPoint(context, cp1.x, cp1.y, e.x, e.y);
	CGContextAddLineToPoint(context, s.x, s.y);
	
	CGContextDrawPath(context, kCGPathFill);
	
	CGContextSetRGBFillColor(context,1, 1, 1, 1);
  
}



@end
