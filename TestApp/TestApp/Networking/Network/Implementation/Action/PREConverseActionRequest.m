//
//  PREConverseActionRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionRequest.h"
#import "PREConverseActionResponse.h"

@implementation PREConverseActionRequest

#pragma mark - PREConverseAPIRequest Protocol Methods

- (PREConverseAPIMethod)method
{
	return GET;
}

- (NSString*)path
{
	return @"/cnv/actions/0.0.0.0";
}

- (Class)responseClass
{
	return [PREConverseActionResponse class];
}

@end

@implementation PREConverseActionRequestParams

@end
