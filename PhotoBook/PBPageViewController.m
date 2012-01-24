//
//  PBPageViewController.m
//  PageTurnTest
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPageViewController.h"
#import "UIColor+Tools.h"


@implementation PBPageViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;
@synthesize backgroundImage = _backgroundImage;
@synthesize photoElements = _photoElements;


#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark Creating elements

- (void)createBackgroundImage {
	self.backgroundImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
	[_backgroundImage setClipsToBounds:YES];
	[_backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
	[_backgroundImage setImage:[UIImage imageNamed:@"PB_old_paper.jpg"]];
	[_backgroundImage setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[self.view addSubview:_backgroundImage];
}

- (void)createAllElements {
	[self createBackgroundImage];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor randomColor]];
	
	[self createAllElements];
	
	for (PBPhotoObject *o in _dataObject.photoArray) {
		PBPhotoView *v = [[PBPhotoView alloc] initWithPhotoObject:o];
		[self.view addSubview:v];
	}
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
