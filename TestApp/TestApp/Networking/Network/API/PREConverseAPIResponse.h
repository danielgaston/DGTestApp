//
//  PREConverseAPIResponse.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

@import Foundation;

@protocol PREConverseAPIResponse <NSObject>

- (NSURLSessionDataTask*)task;
- (NSURLResponse*)response;
- (NSError*)error;
- (id)responseObject;
- (id)processedResponseObject;

- (instancetype)initWithTask:(NSURLSessionDataTask*)task
					response:(NSURLResponse*)response
			  responseObject:(id)responseObject
					   error:(NSError*)error;

- (id)processResponseObject:(NSError**)error;

@end

@interface PREConverseAPISimpleResponse : NSObject <PREConverseAPIResponse> {
	NSURLSessionDataTask* _task;
	NSURLResponse* _response;
	NSError* _error;
	id _responseObject;
	id _processedResponseObject;
}

@end

@interface PREConverseAPIJSONResponse : PREConverseAPISimpleResponse

@end
