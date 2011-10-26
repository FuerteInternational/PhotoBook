//
//  PBPageDesignerViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPageDesignerViewController.h"

@implementation PBPageDesignerViewController

@synthesize mainView = _mainView;


#pragma mark Creating elements

- (void)createMainView {
	self.mainView = [[FTPhotoCompositionView alloc] initWithFrame:[super fullscreenRect]];
	[_mainView setBackgroundColor:[UIColor redColor]];
	[_mainView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[self.view addSubview:_mainView];
}

- (void)createAllElements {
	[self createMainView];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Creating elements
	[self createAllElements];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}


@end
