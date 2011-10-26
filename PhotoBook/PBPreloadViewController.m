//
//  PBPreloadViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPreloadViewController.h"
#import "PBHomeViewController.h"


@implementation PBPreloadViewController


#pragma mark Launching Home screen

- (void)launchHomeScreen {
	PBHomeViewController *c = [[PBHomeViewController alloc] init];
	[self.navigationController pushViewController:c animated:YES];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor greenColor]];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(launchHomeScreen) userInfo:nil repeats:NO];
}


@end
