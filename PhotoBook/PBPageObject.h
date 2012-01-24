//
//  PBPageObject.h
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBPageObject : NSObject

@property (nonatomic, strong) NSMutableArray *photoArray;
@property (nonatomic) NSInteger pageIndex;

- (PBPageObject *)getClone;


@end
