//
//  PREConverseActionResponse.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionModel.h"
#import "PREConverseDefaultResponse.h"

@interface PREConverseActionResponse : PREConverseDefaultResponse

- (PREConverseActionModel*)actionModel;

@end

typedef void (^PREConverseActionResponseBlock)(PREConverseActionResponse* response);
