//
//  PREConverseActionsRequest.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultRequest.h"
#import "PREConverseDefaultRequestParameters.h"

@interface PREConverseActionsRequest : PREConverseDefaultRequest

@end

@interface PREConverseActionsRequestParams : PREConverseDefaultRequestParameters

@property (nonatomic, copy) NSString* view;
@property (nonatomic, copy) NSString<Optional>* searchform;
@property (nonatomic, copy) NSString<Optional>* skip;
@property (nonatomic, copy) NSString<Optional>* top;
@property (nonatomic, copy) NSString<Optional>* orderby;

@end
