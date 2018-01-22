//
//  PREConverseTestJSONResponse.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestJSONResponse.h"

@implementation PREConverseTestJSONResponse

#pragma mark - PREConverseAPIResponse Delegate Methods

- (id)processResponseObject:(NSError**)error;
{
	NSError* __error;

	NSDictionary* json = [NSJSONSerialization JSONObjectWithData:self.responseObject
														 options:NSJSONReadingMutableContainers
														   error:nil];

	return json;
}

#pragma mark - Getters & Setters

- (NSDictionary*)JSON
{
	return self.processedResponseObject;
}

@end
