//
//  PREConverseTestClient.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestNetworkClient.h"

@implementation NSURLSession (PREConverseTestClient)

#pragma mark - PREConverseTestClient Delegate Methods

- (NSURLSessionDataTask*)getTestJSON
{
	PREConverseTestJSONRequest* request = [[PREConverseTestJSONRequest alloc] init];
	NSURLSessionDataTask* task = [self operationDataTaskWithConverseAPIRequest:request];
	return task;
}

- (NSURLSessionDataTask*)getTestJSON:(PREConverseTestJSONResponseBlock)completion
{
	PREConverseTestJSONRequest* request = [[PREConverseTestJSONRequest alloc] init];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

@end

#define kBackgroundSessionID @"ConverseBackgroundSession"

@implementation PREConverseTestNetworkClient

#pragma mark - Class Methods

+ (NSURLSession<PREConverseAPIClient, PREConverseTestClient>*)defaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [self noCachedURLSessionWithDelegate:delegate];
}

+ (NSURLSession<PREConverseAPIClient, PREConverseTestClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPIClient, PREConverseTestClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPIClient, PREConverseTestClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kBackgroundSessionID] delegate:delegate delegateQueue:nil];
}

@end
