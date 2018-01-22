//
//  PREConverseTestNetworkClient.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestJSONRequest.h"
#import "PREConverseTestJSONResponse.h"

@protocol PREConverseTestNetworkClient

- (NSURLSessionDataTask*)getTestJSON:(PREConverseTestJSONResponseBlock)completion;

@end

@interface NSURLSession (PREConverseTestNetworkClient) <PREConverseTestNetworkClient>

@end

@interface PREConverseTestNetworkClient : NSObject

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)sharedURLSession;
+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPINetworkClient, PREConverseTestNetworkClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;

@end
