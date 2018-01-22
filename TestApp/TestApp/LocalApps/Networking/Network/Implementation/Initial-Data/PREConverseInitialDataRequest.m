//
//  PREConverseInitialDataRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataRequest.h"
#import "PREConverseInitialDataResponse.h"

@implementation PREConverseInitialDataRequest

#pragma mark - PREConverseAPIRequest Protocol Methods

- (PREConverseAPIMethod)method
{
	return GET;
}

- (NSString*)path
{
	return @"/cnv/initialdata";
}

- (Class)responseClass
{
	return [PREConverseInitialDataResponse class];
}

@end
