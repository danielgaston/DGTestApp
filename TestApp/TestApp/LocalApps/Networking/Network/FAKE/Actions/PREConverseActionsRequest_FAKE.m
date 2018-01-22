//
//  PREConverseActionsRequest_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionsRequest_FAKE.h"
#import "PREConverseActionsResponse_FAKE.h"

@implementation PREConverseActionsRequest_FAKE

- (Class)responseClass
{
	return [PREConverseActionsResponse_FAKE class];
}

@end
