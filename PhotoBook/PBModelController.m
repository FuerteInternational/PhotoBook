//
//  PBModelController.m
//  PageTurnTest
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBModelController.h"
#import "PBPageViewController.h"
#import "PBPageObject.h"
#import "PBPhotoObject.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface PBModelController ()

@property (readonly, strong, nonatomic) NSArray *pageData;

@end


@implementation PBModelController

@synthesize pageData = _pageData;


#pragma mark Initialization

- (id)init {
    self = [super init];
    if (self) {
		NSMutableArray *arr = [NSMutableArray array];
		for (int i = 0; i < 50; i++) {
			PBPageObject *o = [[PBPageObject alloc] init];
			[o setPageIndex:i];
			[o setPhotoArray:[NSArray arrayWithObject:[PBPhotoObject newPhotoObject]]];
			[arr addObject:o];
		}
		_pageData = arr;
		
//		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//		_pageData = [[dateFormatter monthSymbols] copy];
    }
    return self;
}

#pragma mark Page controllers

- (PBPageViewController *)viewControllerAtIndex:(NSUInteger)index {   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
//    if (index == 0) {
//		PBPageViewController *c = [[PBPageViewController alloc] init];
//		[c.view setBackgroundColor:[UIColor clearColor]];
//		
//		return c;
//	}
    // Create a new view controller and pass suitable data.
    PBPageViewController *dataViewController = [[PBPageViewController alloc] init];
	[dataViewController setDataObject:(PBPageObject *)[self.pageData objectAtIndex:index]];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(PBPageViewController *)viewController {   
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(PBPageViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(PBPageViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


@end
