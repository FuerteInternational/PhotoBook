//
//  PBTemplateSelectorViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBTemplateSelectorViewController.h"

@implementation PBTemplateSelectorViewController

#pragma mark Creating elements

- (void)createMainView {
	
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
