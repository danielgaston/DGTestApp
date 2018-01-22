//
//  PREConverseAPIClient.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIClient.h"
#import <objc/runtime.h>

@interface NSURL (Additions)

+ (NSURL*)urlWithString:(NSString*)path baseURL:(NSURL*)baseURL parameters:(NSDictionary*)parameters;

@end

@interface NSURLRequest (Additions)

+ (NSURLRequest*)requestWithMethod:(PREConverseAPIMethod)method url:(NSURL*)url headers:(NSDictionary*)headers;

@end

@implementation NSURLSession (PREConverseAPINetworkClient)

- (NSURLSessionDataTask*)dataTaskWithConverseAPIRequest:(id<PREConverseAPIRequest>)request
											 completion:(PREConverseAPIClientCompletionBlock)completion;
{
	NSURL* requestUrl = [NSURL urlWithString:request.path baseURL:request.baseURL parameters:request.parameters];
	NSURLRequest* httpRequest = [NSURLRequest requestWithMethod:request.method url:requestUrl headers:request.headers];
	__block NSURLSessionDataTask* task;
	task = [self dataTaskWithRequest:httpRequest
				   completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {

					   Class responseClass = [request responseClass];
					   id<PREConverseAPIResponse> apiResponse = [[responseClass alloc] initWithTask:task response:response responseObject:data error:error];

					   [[NSOperationQueue mainQueue] addOperationWithBlock:^{
						   if (completion) {
							   completion(apiResponse);
						   }
					   }];
				   }];
	[task resume];
	return task;
}

@end

@implementation NSURLSession (PREConverseAPIOperationClient)

- (NSURLSessionDataTask*)operationDataTaskWithConverseAPIRequest:(id<PREConverseAPIRequest>)request
{
	NSURL* requestUrl = [NSURL urlWithString:request.path baseURL:request.baseURL parameters:request.parameters];
	NSURLRequest* httpRequest = [NSURLRequest requestWithMethod:request.method url:requestUrl headers:request.headers];
	__block NSURLSessionDataTask* task;
	task = [self dataTaskWithRequest:httpRequest];
	[task resume];
	return task;
}

@end

@implementation NSURL (Additions)

+ (NSURL*)urlWithString:(NSString*)path baseURL:(NSURL*)baseURL parameters:(NSDictionary*)parameters
{
	NSURLComponents* components = [[NSURLComponents alloc] initWithString:path];
	if (parameters.count > 0) {
		components.queryItems = @[];
		for (NSString* key in parameters) {
			NSString* value = parameters[key];
			NSURLQueryItem* queryItem = [[NSURLQueryItem alloc] initWithName:key value:value];
			components.queryItems = [components.queryItems arrayByAddingObject:queryItem];
		}
	}
	return [components URLRelativeToURL:baseURL];
}

@end

@implementation NSURLRequest (Additions)

+ (NSURLRequest*)requestWithMethod:(PREConverseAPIMethod)method url:(NSURL*)url headers:(NSDictionary*)headers;
{
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
	request.HTTPMethod = HTTPMethodString(method);
	for (NSString* key in headers) {
		[request setValue:headers[key] forHTTPHeaderField:key];
	}
	return [request copy];
}

@end
