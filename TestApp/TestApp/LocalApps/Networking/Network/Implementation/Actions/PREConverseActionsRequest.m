//
//  PREConverseActionsRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionsRequest.h"
#import "PREConverseActionsResponse.h"

@implementation PREConverseActionsRequest

#pragma mark - PREConverseAPIRequest Protocol Methods

- (PREConverseAPIMethod)method
{
	return GET;
}

- (NSString*)path
{
	return @"/cnv/actions";
}

- (Class)responseClass
{
	return [PREConverseActionsResponse class];
}

@end

@implementation PREConverseActionsRequestParams

@end
