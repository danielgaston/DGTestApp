//
//  PREConverseAPIUploadOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIUploadOperation.h"

@implementation PREConverseAPIUploadOperation
@synthesize task;

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.queuePriority = NSOperationQueuePriorityLow;
	}
	return self;
}

@end
