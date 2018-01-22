//
//  PREConverseAPIDataOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDataOperation.h"
#import "NSDate+Utilities.h"

@interface PREConverseAPIDataOperation ()

@property (nonatomic) NSDate* startTime;
@property (nonatomic) NSDate* endTime;

@end

@implementation PREConverseAPIDataOperation
@synthesize task;

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.queuePriority = NSOperationQueuePriorityVeryHigh;
	}
	return self;
}

#pragma mark - Overriden Methods

- (void)start
{
	[super start];

	self.startTime = [NSDate date];
}

#pragma mark - NSURLSessionDataDelegate

- (void)URLSession:(NSURLSession*)session task:(NSURLSessionTask*)task didCompleteWithError:(NSError*)error
{
	self.endTime = [NSDate date];

	if (self.startTime && self.endTime && self.taskIncomingData) {
		NSTimeInterval interval = [self.endTime timeIntervalSinceDate:self.startTime];
		// number of KiloBytes contained in the mutable data object
		NSUInteger bytes = self.taskIncomingData.length;
		CGFloat KB = bytes / 1024.0f;
		CGFloat KBPerSec = KB / interval;

		if (self.operationDelegate)
			[self.operationDelegate converseAPIBaseOperation:self reportsKBperSecond:KBPerSec];
	}
}

// Tells the delegate that the data task received the initial reply (headers) from the server.
- (void)URLSession:(NSURLSession*)session dataTask:(NSURLSessionDataTask*)dataTask didReceiveResponse:(NSURLResponse*)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
	[self processCurrentState];

	self.taskResponse = response;
	completionHandler(NSURLSessionResponseAllow);
}

// Tells the delegate that the data task has received some of the expected data.
- (void)URLSession:(NSURLSession*)session dataTask:(NSURLSessionDataTask*)dataTask didReceiveData:(NSData*)data
{
	[self processCurrentState];

	[self.taskIncomingData appendData:data];
}

- (void)URLSession:(NSURLSession*)session dataTask:(NSURLSessionDataTask*)dataTask willCacheResponse:(NSCachedURLResponse*)proposedResponse completionHandler:(void (^)(NSCachedURLResponse* cachedResponse))completionHandler
{
	[self processCurrentState];

	completionHandler(proposedResponse);
}

@end
