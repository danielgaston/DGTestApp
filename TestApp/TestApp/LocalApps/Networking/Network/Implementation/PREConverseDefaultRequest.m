//
//  PREConverseDefaultRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultRequest.h"

@implementation PREConverseDefaultRequest

#pragma mark - Public Methods

- (instancetype)initWithParameters:(NSDictionary*)params
{
	self = [super init];
	if (self) {
		self.parameters = params;
	}
	return self;
}

#pragma mark - PREConverseAPIRequest Protocol Methods

- (NSURL*)baseURL
{
	return [NSURL URLWithString:@"https://acm.isis-papyrus.com"];
}

@end
