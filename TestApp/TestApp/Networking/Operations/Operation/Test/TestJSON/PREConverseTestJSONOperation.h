//
//  PREConverseTestJSONOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDataOperation.h"
#import "PREConverseTestJSONRequest.h"
#import "PREConverseTestJSONResponse.h"
#import "PREConverseTestOperationClient.h"

@interface PREConverseTestJSONOperation : PREConverseAPIDataOperation

- (instancetype)initWithRequest:(PREConverseTestJSONRequest*)request
			  operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate
					 completion:(PREConverseTestJSONResponseBlock)completion;

@end
