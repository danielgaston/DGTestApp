//
//  PREConverseInitialDataRequest_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataRequest_FAKE.h"
#import "PREConverseInitialDataResponse_FAKE.h"

@implementation PREConverseInitialDataRequest_FAKE

- (Class)responseClass
{
	return [PREConverseInitialDataResponse_FAKE class];
}

@end
