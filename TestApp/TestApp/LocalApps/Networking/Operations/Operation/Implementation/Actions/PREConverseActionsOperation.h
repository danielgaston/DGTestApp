//
//  PREConverseActionsOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDataOperation.h"
#import "PREConverseActionsRequest.h"
#import "PREConverseActionsResponse.h"

@interface PREConverseActionsOperation : PREConverseAPIDataOperation

- (instancetype)initWithRequest:(PREConverseActionsRequest*)request
						 params:(PREConverseActionsRequestParams*)params
			  operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate
					 completion:(PREConverseActionsResponseBlock)completion;

@end
