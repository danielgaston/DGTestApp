//
//  PREConverseTestRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseTestRequest.h"

@implementation PREConverseTestRequest

#pragma mark - Public Methods

- (instancetype)initWithParameters:(NSDictionary*)params
{
	self = [super init];
	if (self) {
		self.parameters = params;
	}
	return self;
}

#pragma mark - PREConverseAPIRequest Delegate Methods

- (NSURL*)baseURL
{
	return [NSURL URLWithString:@"https://jsonip.com/"];
}

@end
