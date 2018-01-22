//
//  PREConverseAPIDownloadOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDownloadOperation.h"

@implementation PREConverseAPIDownloadOperation
@synthesize task;

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.queuePriority = NSOperationQueuePriorityLow;
	}
	return self;
}

#pragma mark - NSURLSessionDownload Delegate Methods

// --> NSURLSessionDownload Delegate Methods pending to be implemented

- (void)URLSession:(nonnull NSURLSession*)session downloadTask:(nonnull NSURLSessionDownloadTask*)downloadTask didFinishDownloadingToURL:(nonnull NSURL*)location
{
}

@end
