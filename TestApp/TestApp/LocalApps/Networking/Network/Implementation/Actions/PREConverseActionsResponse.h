//
//  PREConverseActionsResponse.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionsModel.h"
#import "PREConverseDefaultResponse.h"

@interface PREConverseActionsResponse : PREConverseDefaultResponse

- (PREConverseActionsModel*)actionsModel;

@end

typedef void (^PREConverseActionsResponseBlock)(PREConverseActionsResponse* response);
