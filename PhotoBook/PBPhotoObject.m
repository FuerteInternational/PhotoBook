//
//  PBPhotoObject.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBPhotoObject.h"

@implementation PBPhotoObject

@synthesize size;
@synthesize rotation;
@synthesize center;
@synthesize objectData = _objectData;


#pragma Data processing

+ (NSDictionary *)getEmptyData {
	NSMutableDictionary *d = [NSMutableDictionary dictionary];
	
	return d;
}

- (void)processData {
	self.size = CGSizeMake(300, 250);
	self.rotation = 0.4;
	self.center = CGPointMake(350, 350);
}

#pragma mark Initialization

+ (id)newPhotoObject {
	NSDictionary *data = [self getEmptyData];
	return [[PBPhotoObject alloc] initWithData:data];
}

- (id)init {
	self = [super init];
	if (self) {
		if (!_objectData) [self setObjectData:[PBPhotoObject getEmptyData]];
		[self processData];
	}
	return self;
}

- (id)initWithData:(NSDictionary *)data {
	self = [super init];
	if (self) {
		[self setObjectData:data];
		[self processData];
	}
	return self;
}

@end
