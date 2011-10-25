//
//  PBAppDelegate.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBViewController;

@interface PBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PBViewController *viewController;

@end
