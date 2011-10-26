//
//  PBHomeViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBHomeViewController.h"
#import "PBPageDesignerViewController.h"


@implementation PBHomeViewController

@synthesize contentScrollView = _contentScrollView;


#pragma mark Layout

- (void)doLayoutSubviews {
	[_contentScrollView setContentSize:CGSizeMake(([_contentScrollView width] * 10), [_contentScrollView height])];
}

#pragma mark Creating elements

- (void)createMainScrollView {
	self.contentScrollView = [[UIScrollView alloc] initWithFrame:[super fullscreenRect]];
	[_contentScrollView setBackgroundColor:[UIColor blueColor]];
	[_contentScrollView setPagingEnabled:YES];
	[_contentScrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[self.view addSubview:_contentScrollView];
	[_contentScrollView setContentSize:CGSizeMake(([_contentScrollView width] * 10), [_contentScrollView height])];
	
	UIButton *testBook = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[testBook addTarget:self action:@selector(didClickBookButton:) forControlEvents:UIControlEventTouchUpInside];
	[testBook setTitle:@"Launch book designer" forState:UIControlStateNormal];
	[testBook setFrame:CGRectMake(100, 100, 300, 300)];
	[_contentScrollView addSubview:testBook];
}

- (void)createAllElements {
	[self createMainScrollView];
}

#pragma mark Button actions

- (void)didClickBookButton:(UIButton *)sender {
	PBPageDesignerViewController *c = [[PBPageDesignerViewController alloc] init];
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
