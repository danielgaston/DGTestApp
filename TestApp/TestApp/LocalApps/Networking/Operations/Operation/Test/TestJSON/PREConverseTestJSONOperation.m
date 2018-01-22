//
//  PREConverseTestJSONOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestJSONOperation.h"

@interface PREConverseTestJSONOperation ()

@property (nonatomic, copy) PREConverseTestJSONResponseBlock completion;

@end

@implementation PREConverseTestJSONOperation

#pragma mark - Object LyfeCycle Methods

- (instancetype)initWithRequest:(PREConverseTestJSONRequest*)request operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate completion:(PREConverseTestJSONResponseBlock)completion
{
	self = [super init];

	if (self) {
		self.taskRequest = request;
		self.operationDelegate = operationDelegate;
		self.completion = completion;
		self.name = @"TEST JSON Operation";
	}

	return self;
}

#pragma mark - Overriden Methods

- (void)start
{
	[super start];

	NSURLSession* testClient = [PREConverseTestOperationClient defaultURLSessionWithDelegate:self];
	self.task = [testClient getTestJSON];
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession*)session task:(NSURLSessionTask*)task didCompleteWithError:(NSError*)error
{
	[super URLSession:session task:task didCompleteWithError:error];

	Class responseClass = [self.taskRequest responseClass];
	id<PREConverseAPIResponse> apiResponse = [[responseClass alloc] initWithTask:self.task response:self.taskResponse responseObject:self.taskIncomingData error:error];

	if (self.completion) {
		self.completion(apiResponse);
	}

	[self finish];
}

@end
