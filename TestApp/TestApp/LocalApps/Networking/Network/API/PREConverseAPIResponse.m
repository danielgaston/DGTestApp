//
//  PREConverseAPIResponse.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIResponse.h"

@interface PREConverseAPISimpleResponse ()

@property (nonatomic, copy) NSURLSessionDataTask* task;
@property (nonatomic, copy) NSURLResponse* response;
@property (nonatomic, copy) NSError* error;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) id processedResponseObject;

@end

@implementation PREConverseAPISimpleResponse

#pragma mark - PREConverseAPIResponse Protocol Delegate Methods

- (instancetype)initWithTask:(NSURLSessionDataTask*)task response:(NSURLResponse*)response responseObject:(id)responseObject error:(NSError*)error;
{
	self = [super init];
	if (self) {
		self.task = task;
		self.response = response;
		self.error = error;
		self.responseObject = responseObject;

		if (!error) {
			NSError* serializationError;
			self.processedResponseObject = [self processResponseObject:&serializationError];
			if (serializationError) {
				self.error = serializationError;
			}
		}
	}
	return self;
}

- (id)processResponseObject:(NSError* __autoreleasing*)error
{
	return self.responseObject;
}

@end

@implementation PREConverseAPIJSONResponse

@end
