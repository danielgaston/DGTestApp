//
//  PREConverseOperationQueueManager.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseOperationQueueManager.h"

#define kOperationCountKeyPath @"operationCount"
#define kMaxConcurrentOperationCountKeyPath @"maxConcurrentOperationCount"
#define kSuspendedKeyPath @"suspended"

@interface PREConverseOperationQueueManager ()

@property (nonatomic, strong) NSOperationQueue* queue;

@end

@implementation PREConverseOperationQueueManager

#pragma mark - View LifeCycle Methods

- (instancetype)init
{
	self = [super init];

	if (self) {
		self.queue = [[NSOperationQueue alloc] init];
		[self.queue setName:@"Converse Network Operational Queue"];
		[self.queue setQualityOfService:NSQualityOfServiceUserInitiated];
		[self initializeObservers];
	}

	return self;
}

- (void)dealloc
{
	[self deinitializeObservers];
}

#pragma mark - Public Methods

- (void)addOperation:(NSOperation*)operation
{
	[self.queue addOperation:operation];
}

- (void)cancelAllOperations
{
	[self.queue cancelAllOperations];
}

#pragma mark - Getters & Setters

- (NSInteger)queueMaxConcurrentOps
{
	return _queue.maxConcurrentOperationCount;
}

- (void)setQueueMaxConcurrentOps:(NSInteger)maxOps
{
	[_queue setMaxConcurrentOperationCount:maxOps];
}

- (NSQualityOfService)queueQualityOfService
{
	return _queue.qualityOfService;
}

- (void)setQueueQualityOfService:(NSQualityOfService)quality
{
	[_queue setQualityOfService:quality];
}

#pragma mark - Initialialization Methods

- (void)initializeObservers
{
	[self.queue addObserver:self forKeyPath:kOperationCountKeyPath options:NSKeyValueObservingOptionNew context:nil];
	[self.queue addObserver:self forKeyPath:kMaxConcurrentOperationCountKeyPath options:NSKeyValueObservingOptionNew context:nil];
	[self.queue addObserver:self forKeyPath:kSuspendedKeyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (void)deinitializeObservers
{
	[self.queue removeObserver:self forKeyPath:kOperationCountKeyPath];
	[self.queue removeObserver:self forKeyPath:kMaxConcurrentOperationCountKeyPath];
	[self.queue removeObserver:self forKeyPath:kSuspendedKeyPath];
}

#pragma mark - Observation Methods

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
	[self outputQueueStats];
}

#pragma mark - Helper

- (NSString*)verboseMaxConcurrentOps:(NSInteger)maxOps
{
	switch (maxOps) {
	case NSOperationQueueDefaultMaxConcurrentOperationCount:
		return @"System Max";
	default:
		return [[NSNumber numberWithInteger:maxOps] stringValue];
	}
}

- (NSString*)verboseQualityOfService:(NSQualityOfService)quality
{
	switch (quality) {
	case NSQualityOfServiceUserInteractive:
		return @"User Interactive";
	case NSQualityOfServiceUserInitiated:
		return @"User Initiated";
		;
	case NSQualityOfServiceUtility:
		return @"Utility";
	case NSQualityOfServiceBackground:
		return @"Background";
		;
	case NSQualityOfServiceDefault:
		return @"Default";
	default:
		return nil;
	}
}

- (void)outputQueueStats
{
	NSLog(@"");
	NSLog(@"<<<<---- %@ ----->>>>", self.queue.name);
	NSLog(@"Queue Max Concurrent Ops: %@", [self verboseMaxConcurrentOps:self.queue.maxConcurrentOperationCount]);
	NSLog(@"Queue Cur Concurrent Ops: %ld", self.queue.operationCount);
	NSLog(@"Queue Quality of Service: %@", [self verboseQualityOfService:self.queue.qualityOfService]);
	NSLog(@"Queue Suspended: %@", self.queue.isSuspended ? @"YES" : @"NO");
}

@end
