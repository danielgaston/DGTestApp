//
//  PREConverseInitialDataResponse.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataResponse.h"

@implementation PREConverseInitialDataResponse

#pragma mark - PREConverseAPIResponse Protocol Methods

- (id)processResponseObject:(NSError**)error;
{
	NSError* __error;
	return [[PREConverseInitialDataModel alloc] initWithData:self.responseObject error:&__error];
}

#pragma mark - Getter & Setters

- (PREConverseInitialDataModel*)initialDataModel
{
	return self.processedResponseObject;
}

@end
