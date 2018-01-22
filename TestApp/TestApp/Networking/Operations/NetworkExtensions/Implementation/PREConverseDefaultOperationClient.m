//
//  PREConverseDefaultOperationClient.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultOperationClient.h"

@implementation NSURLSession (PREConverseDefaultOperationClient)

#pragma mark - PREConverseDefaultOperationClient Delegate Methods

- (NSURLSessionDataTask*)getInitialData
{
	PREConverseInitialDataRequest* request = [[PREConverseInitialDataRequest alloc] init];
	NSURLSessionDataTask* task = [self operationDataTaskWithConverseAPIRequest:request];
	return task;
}

- (NSURLSessionDataTask*)getActionsWithParams:(PREConverseActionsRequestParams*)params
{
	PREConverseActionsRequest* request = [[PREConverseActionsRequest alloc] initWithParameters:[params toDictionary]];
	NSURLSessionDataTask* task = [self operationDataTaskWithConverseAPIRequest:request];
	return task;
}

- (NSURLSessionDataTask*)getActionWithParams:(PREConverseActionRequestParams*)params
{
	PREConverseActionRequest* request = [[PREConverseActionRequest alloc] initWithParameters:[params toDictionary]];
	NSURLSessionDataTask* task = [self operationDataTaskWithConverseAPIRequest:request];
	return task;
}

@end

#define kBackgroundOperationSessionID @"ConverseBackgroundOperationSession"

@implementation PREConverseDefaultOperationClient

#pragma mark - Class Methods

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)defaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [self noCachedURLSessionWithDelegate:delegate];
}

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kBackgroundOperationSessionID] delegate:delegate delegateQueue:nil];
}

@end
