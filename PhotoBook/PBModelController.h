//
//  PBModelController.h
//  PageTurnTest
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PBPageViewController;

@interface PBModelController : NSObject <UIPageViewControllerDataSource>

- (PBPageViewController *)viewControllerAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfViewController:(PBPageViewController *)viewController;


@end
