//
//  PREConverseActionsResponse.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionsResponse.h"

@implementation PREConverseActionsResponse

#pragma mark - PREConverseAPIResponse Protocol Methods

- (id)processResponseObject:(NSError**)error
{
	NSError* __error;
	return [[PREConverseActionsModel alloc] initWithData:self.responseObject error:&__error];
}

#pragma mark - Getter & Setters

- (PREConverseActionsModel*)actions
{
	return self.processedResponseObject;
}

@end
