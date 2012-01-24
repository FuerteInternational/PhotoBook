//
//  PBHomeViewController.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBViewController.h"

@interface PBHomeViewController : PBViewController <UIScrollViewDelegate> {
	
	int currentPage;
	
}


//@property (nonatomic, strong) UIScrollView *controlScrollView;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSMutableArray *contentScrollViewPages;
@property (nonatomic, strong) UIPageControl *pageControl;


@end
