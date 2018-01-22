//
//  PREConverseTestJSONResponse.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseNetworking.h"
#import <Foundation/Foundation.h>

@interface PREConverseTestJSONResponse : PREConverseAPIJSONResponse

- (NSDictionary*)JSON;

@end

typedef void (^PREConverseTestJSONResponseBlock)(PREConverseTestJSONResponse* response);
