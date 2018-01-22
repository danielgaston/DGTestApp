//
//  PREConverseAPIStreamOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIStreamOperation.h"

@implementation PREConverseAPIStreamOperation
@synthesize task;

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.queuePriority = NSOperationQueuePriorityHigh;
	}
	return self;
}

#pragma mark - NSURLSessionStream Delegate Methods

// --> NSURLSessionStream Delegate Methods pending to be implemented

@end
