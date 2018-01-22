//
//  PREConverseTestNetworkClient.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestNetworkClient.h"

@implementation NSURLSession (PREConverseTestNetworkClient)

#pragma mark - PREConverseTestNetworkClient Delegate Methods

- (NSURLSessionDataTask*)getTestJSON:(PREConverseTestJSONResponseBlock)completion
{
	PREConverseTestJSONRequest* request = [[PREConverseTestJSONRequest alloc] init];
	NSURLSessionDataTask* task = [self dataTaskWithConverseAPIRequest:request completion:completion];
	return task;
}

@end

#define kBackgroundSessionID @"ConverseBackgroundNetworkSession"

@implementation PREConverseTestNetworkClient

#pragma mark - Class Methods

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)sharedURLSession
{
	return [NSURLSession sharedSession];
}

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kBackgroundSessionID] delegate:delegate delegateQueue:nil];
}

@end
