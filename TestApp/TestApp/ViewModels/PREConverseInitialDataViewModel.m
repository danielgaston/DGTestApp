//
//  PREConverseInitialDataViewModel.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataViewModel.h"

@implementation PREConverseInitialDataViewModel

@synthesize model;

- (instancetype)initWithModel:(PREConverseInitialDataModel*)model
{
	self = [super init];
	if (self) {
		self.model = model;
		self.segmentedControlTitles = @[ @"One", @"Two" ];
	}
	return self;
}

@end
