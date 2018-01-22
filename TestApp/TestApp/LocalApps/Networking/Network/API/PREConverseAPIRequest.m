//
//  PREConverseAPIRequest.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIRequest.h"
#import "PREConverseAPIResponse.h"

@interface PREConverseAPISimpleRequest ()

@property (nonatomic, readwrite) PREConverseAPIMethod method;
@property (nonatomic, readwrite, copy) NSURL* baseURL;
@property (nonatomic, readwrite, copy) NSString* path;
@property (nonatomic, readwrite, copy) NSDictionary* headers;
@property (nonatomic, readwrite) Class<PREConverseAPIResponse> responseClass;

@end

@implementation PREConverseAPISimpleRequest

#pragma mark - Object LyfeCycle Methods

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.responseClass = [PREConverseAPISimpleResponse class];
	}
	return self;
}

@end

@implementation PREConverseAPIJSONRequest

#pragma mark - Object LyfeCycle Methods

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.responseClass = [PREConverseAPIJSONResponse class];
		self.headers = @{ kAcceptHeaderKey : kApplicationJsonContentType,
			kContentTypeKey : kApplicationJsonContentType };
	}
	return self;
}

@end
