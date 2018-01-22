//
//  PREConverseActionOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDataOperation.h"
#import "PREConverseActionRequest.h"
#import "PREConverseActionResponse.h"

@interface PREConverseActionOperation : PREConverseAPIDataOperation

- (instancetype)initWithRequest:(PREConverseActionRequest*)request
						 params:(PREConverseActionRequestParams*)params
			  operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate
					 completion:(PREConverseActionResponseBlock)completion;

@end
