//
//  PREConverseInitialDataResponse.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultResponse.h"
#import "PREConverseInitialDataModel.h"

@interface PREConverseInitialDataResponse : PREConverseDefaultResponse

- (PREConverseInitialDataModel*)initialDataModel;

@end

typedef void (^PREConverseInitialDataResponseBlock)(PREConverseInitialDataResponse* response);
