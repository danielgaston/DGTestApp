//
//  PREConverseOperationNetworkManager.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIBaseOperation.h"
#import "PREConverseDefaultOperationClient.h"
#import <Foundation/Foundation.h>

@interface PREConverseOperationNetworkManager : NSObject <PREConverseAPIBaseOperationDelegate>

- (void)getInitialData:(PREConverseInitialDataResponseBlock)completion;
- (void)getActionsWithParams:(PREConverseActionsRequestParams*)params completion:(PREConverseActionsResponseBlock)completion;
- (void)getActionWithParams:(PREConverseActionRequestParams*)params completion:(PREConverseActionResponseBlock)completion;

- (void)cancelAllRequests;

@end
