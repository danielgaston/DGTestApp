//
//  PREConverseActionResponse_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionResponse_FAKE.h"

@implementation PREConverseActionResponse_FAKE

- (id)responseObject
{
	NSDictionary* jsonDict = @{
		@"title" : @"Create Ticket",
		@"subTitle" : @"Provide all available information for the creation of a new ticket.",
		@"attributes" : @[ @{
							  @"id" : @"dueDate",
							  @"name" : @"Due date"
						  },
			@{
			   @"id" : @"priority",
			   @"name" : @"Priority",
			   @"substitutions" : @[ @1, @2, @3 ],
			   @"calculatedSubstitutions" : @[ @"High", @"Mid", @"Low" ]
			} ],
		@"fields" : @[ @{
						  @"id" : @"dueDate",
						  @"group" : @"General"
					  },
			@{
			   @"id" : @"priority",
			   @"group" : @"General"
			} ]
	};

	NSError* error;
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
													   options:0
														 error:&error];
	return jsonData;
}

@end
