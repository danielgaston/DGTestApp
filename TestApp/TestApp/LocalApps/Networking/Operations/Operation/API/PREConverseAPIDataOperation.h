//
//  PREConverseAPIDataOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIBaseOperation.h"
#import "PREConverseDefaultOperationClient.h"

@interface PREConverseAPIDataOperation : PREConverseAPIBaseOperation <NSURLSessionDataDelegate>

@property (nonatomic) NSURLSessionDataTask* task;
@property (nonatomic) PREConverseDefaultRequest* taskRequest;
@property (nonatomic) PREConverseDefaultRequestParameters* taskRequestParams;

@end
