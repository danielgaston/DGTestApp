//
//  PREActionWorkplace.m
//  Pre
//

#import "PREActionWorkplace.h"

@implementation PREActionWorkplace

+ (JSONKeyMapper*)keyMapper
{
	return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"mainActionSort" : @"mainActionSort.items",
		@"mainActionMenu" : @"mainActionMenu.items"
	}];
}

@end
