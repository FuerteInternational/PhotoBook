//
//  PBPhotoView.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPhotoView.h"
#import <QuartzCore/QuartzCore.h>


@implementation PBPhotoView

@synthesize photoFrame = _photoFrame;
@synthesize imageView = _imageView;
@synthesize backgroundView = _backgroundView;
@synthesize photoObject = _photoObject;


#pragma mark Setters & getters

- (void)setNewPhotoObject:(PBPhotoObject *)object {
	[self setPhotoObject:object];
}

#pragma mark Creating elements

- (void)createSmoothBorder {
	
}

- (void)createAllElements {
	self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
	[_backgroundView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[_backgroundView setBackgroundColor:[UIColor whiteColor]];
	[self addSubview:_backgroundView];
}

#pragma mark Initialization

- (void)initializeView {
	[self createAllElements];
	[self createSmoothBorder];
	
	[self setBackgroundColor:[UIColor clearColor]];
}

- (id)initWithPhotoObject:(PBPhotoObject *)object {
	self = [super init];
	if (self) {
		[self setSize:object.size];
		[self setCenter:object.center];
		[self setTransform:CGAffineTransformRotate(self.transform, object.rotation)];
	}
	return self;
}

#pragma mark Draw rect

- (void)drawRect:(CGRect)rect {
	//[super drawRect:rect];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	CGContextSetShouldAntialias(context, true);
	CGContextSetAllowsAntialiasing(context, true);
	[super drawRect:rect];
	// We have to turn it back off since it's not saved in graphic state.
	CGContextSetAllowsAntialiasing(context, false);
	CGContextRestoreGState(context);
}


@end
