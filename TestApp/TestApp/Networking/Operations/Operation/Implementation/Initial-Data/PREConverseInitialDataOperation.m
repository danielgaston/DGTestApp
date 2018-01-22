//
//  PREConverseInitialDataOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataOperation.h"

@interface PREConverseInitialDataOperation ()

@property (nonatomic, copy) PREConverseInitialDataResponseBlock completion;

@end

@implementation PREConverseInitialDataOperation

#pragma mark - Object LyfeCycle Methods

- (instancetype)initWithRequest:(PREConverseInitialDataRequest*)request operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate completion:(PREConverseInitialDataResponseBlock)completion;
{
	self = [super init];

	if (self) {
		self.taskRequest = request;
		self.completion = completion;
		self.name = @"Initial-Data Operation";
	}

	return self;
}

#pragma mark - Overriden Methods

- (void)start
{
	[super start];

	NSURLSession* defaultClient = [PREConverseDefaultOperationClient defaultURLSessionWithDelegate:self];
	self.task = [defaultClient getInitialData];
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

	// DG: PROCESS DATA INTO CORE DATA AT THIS POINT

	[self finish];
}
@end
