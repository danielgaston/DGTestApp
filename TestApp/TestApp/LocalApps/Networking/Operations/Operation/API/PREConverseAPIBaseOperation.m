//
//  PREConverseAPIBaseOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIBaseOperation.h"

@implementation PREConverseAPIBaseOperation

/*
 We need to do old school synthesizing as the compiler has trouble creating the internal ivars.
 */
@synthesize ready = _ready;
@synthesize executing = _executing;
@synthesize finished = _finished;

#pragma mark - Operation LifeCycle Methods

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self initializePreProcessing];
	}
	return self;
}

#pragma mark - Initialization Methods

- (void)initializePreProcessing
{
	self.ready = YES;
	self.taskIncomingData = [NSMutableData new];
}

#pragma mark - Public Methods

- (void)finish
{
	if (self.executing) {
		self.executing = NO;
		self.finished = YES;
		NSLog(@"%@ Operation Finished.", self.name);
	}
}

- (void)processCurrentState
{
	if (self.cancelled) {
		[self.task cancel];
		[self cancel];
		return;
	}
}

#pragma mark - Overriding Methods

- (void)start
{
	if (!self.isExecuting) {
		self.ready = NO;
		self.executing = YES;
		self.finished = NO;
		NSLog(@"%@ Operation Started.", self.name);
	}
}

#pragma mark - Getters & Setters

- (void)setReady:(BOOL)ready
{
	if (_ready != ready) {
		[self willChangeValueForKey:NSStringFromSelector(@selector(isReady))];
		_ready = ready;
		[self didChangeValueForKey:NSStringFromSelector(@selector(isReady))];
	}
}

- (BOOL)isReady
{
	return _ready;
}

- (void)setExecuting:(BOOL)executing
{
	if (_executing != executing) {
		[self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
		_executing = executing;
		[self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
	}
}

- (BOOL)isExecuting
{
	return _executing;
}

- (void)setFinished:(BOOL)finished
{
	if (_finished != finished) {
		[self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
		_finished = finished;
		[self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
	}
}

- (BOOL)isFinished
{
	return _finished;
}

- (BOOL)isAsynchronous
{
	return YES;
}

#pragma mark - Helper Methods

- (void)cancel
{
	[super cancel];

	[self finish];
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession*)session didBecomeInvalidWithError:(NSError*)error
{
	// Left blanck intentionally
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession*)session
{
	// Left blanck intentionally
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession*)session task:(NSURLSessionTask*)task didCompleteWithError:(NSError*)error
{
	[self processCurrentState];

	if (NSThread.isMainThread)
		NSLog(@"Failed to receive response: %@", error.localizedDescription);

	if (error) {
		NSLog(@"Failed to receive response: %@", error.localizedDescription);
		[self cancel];
		return;
	}
}

@end
