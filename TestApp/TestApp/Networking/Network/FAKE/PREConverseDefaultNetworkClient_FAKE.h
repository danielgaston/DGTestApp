//
//  PREConverseDefaultNetworkClient_FAKE.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionRequest_FAKE.h"
#import "PREConverseActionResponse_FAKE.h"
#import "PREConverseActionsRequest_FAKE.h"
#import "PREConverseActionsResponse_FAKE.h"
#import "PREConverseInitialDataRequest_FAKE.h"
#import "PREConverseInitialDataResponse_FAKE.h"
#import "PREConverseNetworking.h"

@protocol PREConverseDefaultNetworkClient_FAKE

- (NSURLSessionDataTask*)getInitialData_FAKE:(PREConverseInitialDataResponseBlock_FAKE)completion;
- (NSURLSessionDataTask*)getActionsWithParams_FAKE:(PREConverseActionRequestParams*)params completion:(PREConverseActionsResponseBlock_FAKE)completion;
- (NSURLSessionDataTask*)getActionWithParams_FAKE:(PREConverseActionRequestParams*)params completion:(PREConverseActionResponseBlock_FAKE)completion;

@end

@interface NSURLSession (PREConverseDefaultNetworkClient_FAKE) <PREConverseDefaultNetworkClient_FAKE>

@end
