//
//  PBPageViewController.h
//  PageTurnTest
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "FTViewController.h"
#import "PBPageObject.h"
#import "PBPhotoView.h"


@interface PBPageViewController : FTViewController

@property (strong, nonatomic) UILabel *dataLabel;
@property (strong, nonatomic) PBPageObject *dataObject;
@property (strong, nonatomic) NSMutableArray *photoElements;
@property (strong, nonatomic) UIImageView *backgroundImage;


@end
