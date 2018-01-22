//
//  PREConverseDefaultOperationClient.h
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

@protocol PREConverseDefaultOperationClient

- (NSURLSessionDataTask*)getInitialData;
- (NSURLSessionDataTask*)getActionsWithParams:(PREConverseActionsRequestParams*)params;
- (NSURLSessionDataTask*)getActionWithParams:(PREConverseActionRequestParams*)params;

@end

@interface NSURLSession (PREConverseDefaultOperationClient) <PREConverseDefaultOperationClient>

@end

@interface PREConverseDefaultOperationClient : NSObject

+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)defaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)noCachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)cachedURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;
+ (NSURLSession<PREConverseAPIOperationClient, PREConverseDefaultOperationClient>*)backgroundAppDefaultURLSessionWithDelegate:(id<NSURLSessionDelegate>)delegate;

@end
