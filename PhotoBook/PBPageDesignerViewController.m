//
//  PBPageDesignerViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPageDesignerViewController.h"
#import "PBModelController.h"
#import "PBPageViewController.h"


@interface PBPageDesignerViewController ()
@property (readonly, strong, nonatomic) PBModelController *modelController;
@end

@implementation PBPageDesignerViewController

@synthesize mainView = _mainView;
@synthesize pageViewController = _pageViewController;
@synthesize modelController = _modelController;
@synthesize topMenu = _topMenu;
@synthesize bottomMenu = _bottomMenu;

#pragma mark Creating elements

- (void)createMainView {
	self.mainView = [[FTPhotoCompositionView alloc] initWithFrame:[super fullscreenRect]];
	[_mainView setBackgroundColor:[UIColor redColor]];
	[_mainView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[self.view addSubview:_mainView];
}

- (void)createPageTurnController {
	self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
	self.pageViewController.delegate = self;
	
	PBPageViewController *startingViewController = [self.modelController viewControllerAtIndex:0];
	NSArray *viewControllers = [NSArray arrayWithObject:startingViewController];
	[self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
	
	[self.pageViewController setDataSource:self.modelController];
	
	[self addChildViewController:self.pageViewController];
	[self.view addSubview:self.pageViewController.view];
	
	// Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
	CGRect pageViewRect = self.view.bounds;
	pageViewRect = CGRectInset(pageViewRect, 0.0, 40.0);
	[self.pageViewController.view setFrame:pageViewRect];
	
	[self.pageViewController didMoveToParentViewController:self];    
	
	// Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPage:)];
	[self.pageViewController.view addGestureRecognizer:tap];
	[self.view setGestureRecognizers:self.pageViewController.gestureRecognizers];
}

- (void)createMenu {
	
}

- (void)createAllElements {
	//[self createMainView];
	[self createPageTurnController];
	[self createMenu];
}

#pragma mark Layout

- (void)doLayoutSubviewsWithAnimation:(BOOL)animation {
	if (animation) [UIView beginAnimations:nil context:nil];
	
	CGFloat xInset = 0;
	CGFloat yInset = (isLandscape ? 0 : 222);
	CGRect pageViewRect = self.view.bounds;
	pageViewRect = CGRectInset(pageViewRect, xInset, yInset);
	[self.pageViewController.view setFrame:pageViewRect];
	
	if (isLandscape) {
		if (isMenuEnabled) {
			if (!isScaledDown) [self.pageViewController.view setTransform:CGAffineTransformScale(self.pageViewController.view.transform, 0.4, 0.4)];
			isScaledDown = YES;
		}
		else {
			[self.pageViewController.view setTransform:CGAffineTransformScale(self.pageViewController.view.transform, 1, 1)];
			isScaledDown = NO;
		}
	}
	else {
		[self.pageViewController.view setTransform:CGAffineTransformScale(self.pageViewController.view.transform, 1, 1)];
		isScaledDown = NO;
	}
	
	if (animation) [UIView commitAnimations];
}

- (void)doLayoutSubviews {
	[self doLayoutSubviewsWithAnimation:NO];
}

#pragma mark Gesture recognizers target methods

- (void)didTapPage:(UITapGestureRecognizer *)recognizer {
	isMenuEnabled = !isMenuEnabled;
	[self doLayoutSubviewsWithAnimation:YES];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
	
	// Creating elements
	[self createAllElements];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

#pragma mark Page turn handling and delegate methods

- (PBModelController *)modelController {
    if (!_modelController) {
        _modelController = [[PBModelController alloc] init];
    }
    return _modelController;
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
	if (UIInterfaceOrientationIsPortrait(orientation) || YES) {
	    UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
	    NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
	    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
	    
	    self.pageViewController.doubleSided = NO;
	    return UIPageViewControllerSpineLocationMin;
	}
	else {
		PBPageViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
		NSArray *viewControllers = nil;
		
		NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:currentViewController];
		if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 2 == 0) {
			UIViewController *nextViewController = [self.modelController pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
			viewControllers = [NSArray arrayWithObjects:currentViewController, nextViewController, nil];
		} 
		else {
			UIViewController *previousViewController = [self.modelController pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
			viewControllers = [NSArray arrayWithObjects:previousViewController, currentViewController, nil];
		}
		[self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
		
		return UIPageViewControllerSpineLocationMid;
	}
}


@end
