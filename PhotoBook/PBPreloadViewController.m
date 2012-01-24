//
//  PBPreloadViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPreloadViewController.h"
#import "PBHomeViewController.h"
#import "UIView+Layout.h"


@implementation PBPreloadViewController

@synthesize centeredImage = _centeredImage;


#pragma mark Launching Home screen

- (void)launchHomeScreen {
	PBHomeViewController *c = [[PBHomeViewController alloc] init];
	[c setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
	[self presentModalViewController:c animated:YES];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set background
	[super setBackgroundWithImageName:@"PB_red_leather_bcg.png"];
	
	// Set center image
	self.centeredImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PB_intro_photo.png"]];
	[self.view addSubview:_centeredImage];
	[_centeredImage centerInSuperView];
	[_centeredImage setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(launchHomeScreen) userInfo:nil repeats:NO];
}


@end
