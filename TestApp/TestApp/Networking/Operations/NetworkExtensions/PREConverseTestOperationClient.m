//
//  PREConverseTestOperationClient.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestOperationClient.h"

@implementation NSURLSession (PREConverseTestOperationClient)

#pragma mark - PREConverseTestOperationClient Delegate Methods

- (NSURLSessionDataTask*)getTestJSON
{
	PREConverseTestJSONRequest* request = [[PREConverseTestJSONRequest alloc] init];
	NSURLSessionDataTask* task = [self operationDataTaskWithConverseAPIRequest:request];
	return task;
}

@end

#define kBackgroundSessionID @"ConverseBackgroundOperationSession"

@implementation PREConverseTestOperationClient

#pragma mark - Class Methods

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)defaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [self noCachedURLSessionWithDelegate:delegate];
}

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:delegate delegateQueue:nil];
}

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kBackgroundSessionID] delegate:delegate delegateQueue:nil];
}

@end
