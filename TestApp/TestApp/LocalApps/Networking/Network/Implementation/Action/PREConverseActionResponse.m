//
//  PREConverseActionResponse.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionResponse.h"

@implementation PREConverseActionResponse

#pragma mark - PREConverseAPIResponse Protocol Methods

- (id)processResponseObject:(NSError**)error
{
	NSError* __error;
	return [[PREConverseActionModel alloc] initWithData:self.responseObject error:&__error];
}

#pragma mark - Getter & Setters

- (PREConverseActionModel*)actionModel
{
	return self.processedResponseObject;
}

@end
