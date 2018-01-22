//
//  PREConverseActionsResponse_FAKE.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseActionsResponse_FAKE.h"

@implementation PREConverseActionsResponse_FAKE

- (id)responseObject
{
	NSDictionary* jsonDict =
		@{ @"data" : @[ @{
						   @"id" : @"0.0.0.0",
						   @"actionName" : @"Create Ticket",
						   @"priority" : @1,
						   @"dueDate" : @"2018-04-01T12:00:00Z"
					   },
			@{
			   @"id" : @"0.0.0.1",
			   @"actionName" : @"Notify Ticket Requester",
			   @"priority" : @3,
			   @"dueDate" : @"2019-03-25T12:00:00Z"
			} ],
			@"attributes" : @[ @{
								  @"id" : @"actionName",
								  @"name" : @"Action name"
							  },
				@{
				   @"id" : @"priority",
				   @"name" : @"Priority",
				   @"substitutions" : @[ @1, @2, @3 ],
				   @"calculatedSubstitutions" : @[ @"High", @"Mid", @"Low" ]
				},
				@{
				   @"id" : @"dueDate",
				   @"name" : @"Due date"
				} ]
		};

	NSError* error;
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
													   options:0
														 error:&error];
	return jsonData;
}

@end
