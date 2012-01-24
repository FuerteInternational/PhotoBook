//
//  PBData.m
//  PhotoBook
//
//  Created by Ondrej Rafaj on 26/10/2011.
//  Copyright (c) 2011 Fuerte International. All rights reserved.
//

#import "PBData.h"

@implementation PBData

+ (NSArray *)getBooksData {
	NSMutableArray *arr = [NSMutableArray array];
	for (int i = 0; i < 6; i++) {
		NSMutableDictionary *d = [NSMutableDictionary dictionary];
		
		
		
		[arr addObject:d];
	}
	return arr;
}


@end
