//
//  PREConverseOperationNetworkTestManager.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIBaseOperation.h"
#import "PREConverseTestNetworkClient.h"
#import <Foundation/Foundation.h>

@interface PREConverseOperationNetworkTestManager : NSObject <PREConverseAPIBaseOperationDelegate>

- (void)getTestJSON:(PREConverseTestJSONResponseBlock)completion;

- (void)cancelAllRequests;

@end
