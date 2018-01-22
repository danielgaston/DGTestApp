//
//  PREConverseDefaultNetworkClient.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionRequest.h"
#import "PREConverseActionResponse.h"
#import "PREConverseActionsRequest.h"
#import "PREConverseActionsResponse.h"
#import "PREConverseInitialDataRequest.h"
#import "PREConverseInitialDataResponse.h"
#import "PREConverseNetworking.h"

@protocol PREConverseDefaultNetworkClient

- (NSURLSessionDataTask*)getInitialData:(PREConverseInitialDataResponseBlock)completion;
- (NSURLSessionDataTask*)getActionsWithParams:(PREConverseActionsRequestParams*)params completion:(PREConverseActionsResponseBlock)completion;
- (NSURLSessionDataTask*)getActionWithParams:(PREConverseActionRequestParams*)params completion:(PREConverseActionResponseBlock)completion;

@end

@interface NSURLSession (PREConverseDefaultNetworkClient) <PREConverseDefaultNetworkClient>

@end

@interface PREConverseDefaultNetworkClient : NSObject

+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)sharedURLSession;
+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;

@end
