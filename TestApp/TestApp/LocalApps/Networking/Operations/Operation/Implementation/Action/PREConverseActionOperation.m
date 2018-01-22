//
//  PREConverseActionOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionOperation.h"

@interface PREConverseActionOperation ()

@property (nonatomic, copy) PREConverseActionResponseBlock completion;
@property (nonatomic, copy) PREConverseActionRequestParams* taskRequestParams;

@end

@implementation PREConverseActionOperation
@synthesize taskRequestParams;

#pragma mark - Object LyfeCycle Methods

- (instancetype)initWithRequest:(PREConverseActionRequest*)request params:(PREConverseActionRequestParams*)params operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate completion:(PREConverseActionResponseBlock)completion
{
	self = [super init];

	if (self) {
		self.taskRequest = request;
		self.taskRequestParams = params;
		self.operationDelegate = operationDelegate;
		self.completion = completion;
		self.name = @"Action Operation";
	}

	return self;
}

#pragma mark - Overriden Methods

- (void)start
{
	[super start];

	NSURLSession* defaultClient = [PREConverseDefaultOperationClient defaultURLSessionWithDelegate:self];
	self.task = [defaultClient getActionWithParams:self.taskRequestParams];
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
