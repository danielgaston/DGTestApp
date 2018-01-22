//
//  PREConverseActionRequest_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionRequest_FAKE.h"
#import "PREConverseActionResponse_FAKE.h"

@implementation PREConverseActionRequest_FAKE

- (Class)responseClass
{
	return [PREConverseActionResponse_FAKE class];
}

@end
