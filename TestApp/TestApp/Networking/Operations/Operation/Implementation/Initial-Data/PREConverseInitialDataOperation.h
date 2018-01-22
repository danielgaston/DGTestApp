//
//  PREConverseInitialDataOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDataOperation.h"
#import "PREConverseInitialDataRequest.h"
#import "PREConverseInitialDataResponse.h"

@interface PREConverseInitialDataOperation : PREConverseAPIDataOperation

- (instancetype)initWithRequest:(PREConverseInitialDataRequest*)request
			  operationDelegate:(id<PREConverseAPIBaseOperationDelegate>)operationDelegate
					 completion:(PREConverseInitialDataResponseBlock)completion;

@end
