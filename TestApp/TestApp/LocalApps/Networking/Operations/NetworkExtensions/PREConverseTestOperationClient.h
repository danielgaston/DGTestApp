//
//  PREConverseTestOperationClient.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestJSONRequest.h"
#import "PREConverseTestJSONResponse.h"

@protocol PREConverseTestOperationClient

- (NSURLSessionDataTask*)getTestJSON;

@end

@interface NSURLSession (PREConverseTestOperationClient) <PREConverseTestOperationClient>

@end

@interface PREConverseTestOperationClient : NSObject

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)defaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPIOperationClient, PREConverseTestOperationClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;

@end
