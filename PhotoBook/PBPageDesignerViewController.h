//
//  PBPageDesignerViewController.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBViewController.h"
#import "FTPhotoCompositionView.h"


@interface PBPageDesignerViewController : PBViewController <UIPageViewControllerDelegate> {
	
	BOOL isMenuEnabled;
	BOOL isScaledDown;
	
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic, strong) FTPhotoCompositionView *mainView;

@property (nonatomic, strong) UIView *topMenu;
@property (nonatomic, strong) UIView *bottomMenu;


@end
