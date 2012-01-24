//
//  PBHomeViewController.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 25/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBHomeViewController.h"
#import "PBPageDesignerViewController.h"
#import "PBData.h"


@implementation PBHomeViewController

@synthesize contentScrollView = _contentScrollView;
@synthesize contentScrollViewPages = _contentScrollViewPages;
@synthesize pageControl = _pageControl;


#pragma mark Positioning & sizes

- (CGSize)getMainScrollViewContentSize {
	return CGSizeMake(([_contentScrollView width] * [data count]), [_contentScrollView height]);
}

- (CGRect)frameForPageControl {
	CGRect r = [super fullscreenRect];
	r.origin.y = (r.size.height - 35);
	r.size.height = 20;
	return r;
}

#pragma mark Reloading data

- (void)reloadScrollViewPages {
	if (!_contentScrollViewPages) {
		self.contentScrollViewPages = [NSMutableArray array];
		for (int i = 0; i < [data count]; i++) {
			CGFloat x = (i * [_contentScrollView width]);
			CGRect r = CGRectMake(x, 0, 0, 0);
			r.size = [_contentScrollView size];
			UIView *page = [[UIView alloc] initWithFrame:r];
			
			UIButton *testBook = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			[testBook setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
			[testBook addTarget:self action:@selector(didClickBookButton:) forControlEvents:UIControlEventTouchUpInside];
			[testBook setTitle:[NSString stringWithFormat:@"Launch book designer: %d", (i + 1)] forState:UIControlStateNormal];
			[testBook setFrame:CGRectMake(0, 0, 300, 300)];
			[page addSubview:testBook];
			[testBook centerInSuperView];
			
			[_contentScrollView addSubview:page];
			[_contentScrollViewPages addObject:page];
			
		}
	}
	for (int i = 0; i < [data count]; i++) {
		UIView *page = [_contentScrollViewPages objectAtIndex:i];
		CGFloat x = (i * [_contentScrollView width]);
		CGRect r = CGRectMake(x, 0, 0, 0);
		r.size = [_contentScrollView size];
		[page setFrame:r];
	}
	[_pageControl setNumberOfPages:[data count]];
}

#pragma mark Layout

- (void)doLayoutSubviews {
	[UIView beginAnimations:nil context:nil];
	
	[_contentScrollView setFrame:[super fullscreenRect]];
	[self reloadScrollViewPages];
	[_pageControl setFrame:[self frameForPageControl]];
	
	[UIView commitAnimations];
	
	[_contentScrollView setContentSize:[self getMainScrollViewContentSize]];
	[_contentScrollView setContentOffset:CGPointMake((currentPage * [_contentScrollView width]), 0) animated:YES];
}

#pragma mark Creating elements

- (void)createMainScrollView {
	[super setData:[PBData getBooksData]];
	
	self.contentScrollView = [[UIScrollView alloc] initWithFrame:[super fullscreenRect]];
	[_contentScrollView setDelegate:self];
	[_contentScrollView setBackgroundColor:[UIColor clearColor]];
	[_contentScrollView setPagingEnabled:YES];
	[self.view addSubview:_contentScrollView];
	[_contentScrollView setContentSize:[self getMainScrollViewContentSize]];
	
	[self reloadScrollViewPages];
}

- (void)createPageControl {
	self.pageControl = [[UIPageControl alloc] initWithFrame:[self frameForPageControl]];
	[_pageControl setCurrentPage:0];
	[self.view addSubview:_pageControl];
}

- (void)createAllElements {
	[super setBackgroundWithImageName:@"PB_red_leather_bcg.png"];
	
	[self createMainScrollView];
	[self createPageControl];
}

#pragma mark Button actions

- (void)didClickBookButton:(UIButton *)sender {
	PBPageDesignerViewController *c = [[PBPageDesignerViewController alloc] init];
	[c setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
	[self presentModalViewController:c animated:YES];
}

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Creating elements
	[self createAllElements];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

#pragma mark Scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	int p = (scrollView.contentOffset.x / [scrollView width]);
	[_pageControl setCurrentPage:p];
	currentPage = p;
}


@end
