//
//  PBAppDelegate.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBPreloadViewController;

@interface PBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PBPreloadViewController *viewController;

@end
