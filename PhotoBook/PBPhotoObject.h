//
//  PBPhotoObject.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBPhotoObject : NSObject

@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat rotation;
@property (nonatomic) CGPoint center;

@property (nonatomic, strong) NSDictionary *objectData;


+ (id)newPhotoObject;

- (id)initWithData:(NSDictionary *)data;


@end
