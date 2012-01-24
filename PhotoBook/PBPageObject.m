//
//  PBPageObject.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPageObject.h"

@implementation PBPageObject

@synthesize photoArray = _photoArray;
@synthesize pageIndex;


#pragma mark Object data handling

- (PBPageObject *)getClone {
	PBPageObject *p = [[PBPageObject alloc] init];
	
	return p;
}


@end
