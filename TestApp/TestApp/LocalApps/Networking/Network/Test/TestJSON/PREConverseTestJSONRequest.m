//
//  PREConverseTestJSONRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestJSONRequest.h"
#import "PREConverseTestJSONResponse.h"

@implementation PREConverseTestJSONRequest

#pragma mark - PREConverseAPIRequest Delegate Methods

- (PREConverseAPIMethod)method
{
	return GET;
}

- (NSString*)path
{
	return @"";
}

- (Class)responseClass
{
	return [PREConverseTestJSONResponse class];
}

@end
