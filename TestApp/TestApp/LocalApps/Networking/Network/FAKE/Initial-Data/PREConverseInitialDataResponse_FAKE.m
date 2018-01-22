//
//  PREConverseInitialDataResponse_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataResponse_FAKE.h"

@implementation PREConverseInitialDataResponse_FAKE

- (id)responseObject
{
	NSDictionary* jsonDict = @{ @"actionsViews" : @[ @{ @"id" : @"my-inbox", @"title" : @"My Inbox" }, @{ @"id" : @"completed", @"title" : @"Completed" } ] };
	NSError* error;
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
													   options:0
														 error:&error];
	return jsonData;
}

@end
