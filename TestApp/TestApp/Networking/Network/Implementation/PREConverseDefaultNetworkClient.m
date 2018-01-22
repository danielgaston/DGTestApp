//
//  PREConverseDefaultNetworkClient.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultNetworkClient.h"

@implementation NSURLSession (PREConverseDefaultNetworkClient)

#pragma mark - PREConverseDefaultNetworkClient Delegate Methods

- (NSURLSessionDataTask*)getInitialData:(PREConverseInitialDataResponseBlock)completion
{
	PREConverseInitialDataRequest* request = [[PREConverseInitialDataRequest alloc] init];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

- (NSURLSessionDataTask*)getActionsWithParams:(PREConverseActionsRequestParams*)params completion:(PREConverseActionsResponseBlock)completion
{
	PREConverseActionsRequest* request = [[PREConverseActionsRequest alloc] initWithParameters:[params toDictionary]];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

- (NSURLSessionDataTask*)getActionWithParams:(PREConverseActionRequestParams*)params completion:(PREConverseActionResponseBlock)completion
{
	PREConverseActionRequest* request = [[PREConverseActionRequest alloc] initWithParameters:[params toDictionary]];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

@end

#define kBackgroundNetworkSessionID @"ConverseBackgroundNetworkSession"

@implementation PREConverseDefaultNetworkClient

#pragma mark - Class Methods

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)sharedURLSession
{
	return [NSURLSession sharedSession];
}

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kBackgroundNetworkSessionID] delegate:delegate delegateQueue:nil];
}

@end
