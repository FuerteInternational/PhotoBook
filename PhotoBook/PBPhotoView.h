//
//  PBPhotoView.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "FTView.h"
#import "FTImageView.h"
#import "PBPhotoObject.h"


@interface PBPhotoView : FTView

@property (nonatomic, strong) UIImageView *photoFrame;
@property (nonatomic, strong) FTImageView *imageView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) PBPhotoObject *photoObject;


- (id)initWithPhotoObject:(PBPhotoObject *)object;

- (void)setNewPhotoObject:(PBPhotoObject *)object;


@end
