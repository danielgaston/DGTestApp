//
//  PREConverseDefaultNetworkClient_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultNetworkClient_FAKE.h"

@implementation NSURLSession (PREConverseDefaultNetworkClient_FAKE)

- (NSURLSessionDataTask*)getInitialData_FAKE:(PREConverseInitialDataResponseBlock_FAKE)completion
{
	PREConverseInitialDataRequest_FAKE* request = [[PREConverseInitialDataRequest_FAKE alloc] init];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

- (NSURLSessionDataTask*)getActionsWithParams_FAKE:(PREConverseActionsRequestParams*)params completion:(PREConverseActionsResponseBlock_FAKE)completion
{
	PREConverseActionsRequest_FAKE* request = [[PREConverseActionsRequest_FAKE alloc] initWithParameters:[params toDictionary]];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

- (NSURLSessionDataTask*)getActionWithParams_FAKE:(PREConverseActionRequestParams*)params completion:(PREConverseActionResponseBlock_FAKE)completion
{
	PREConverseActionRequest_FAKE* request = [[PREConverseActionRequest_FAKE alloc] initWithParameters:[params toDictionary]];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

@end
