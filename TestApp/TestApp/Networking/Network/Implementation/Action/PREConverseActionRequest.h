//
//  PREConverseActionRequest.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultRequest.h"
#import "PREConverseDefaultRequestParameters.h"

@interface PREConverseActionRequest : PREConverseDefaultRequest

@end


@interface PREConverseActionRequestParams : PREConverseDefaultRequestParameters

@property (nonatomic, copy) NSString* action;
@property (nonatomic, copy) NSString* view;

@end
