//
//  PREConverseActionsOperation.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionsOperation.h"

@interface PREConverseActionsOperation ()

@property (nonatomic, copy) PREConverseActionsResponseBlock completion;
@property (nonatomic, copy) PREConverseActionsRequestParams* taskRequestParams;

@end

@implementation PREConverseActionsOperation
@synthesize taskRequestParams;

#pragma mark - Object LyfeCycle Methods

- (instancetype)initWithRequest:(PREConverseActionsRequest*)request params:(PREConverseActionsRequestParams*)params operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate completion:(PREConverseActionsResponseBlock)completion
{
	self = [super init];

	if (self) {
		self.taskRequest = request;
		self.taskRequestParams = params;
		self.completion = completion;
		self.name = @"Actions Operation";
	}

	return self;
}

#pragma mark - Overriden Methods

- (void)start
{
	[super start];

	NSURLSession* defaultClient = [PREConverseDefaultOperationClient defaultURLSessionWithDelegate:self];
	self.task = [defaultClient getActionsWithParams:self.taskRequestParams];
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
