//
//  PREConverseAPIRequest.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

@import Foundation;

#import "PREConverseAPIMethod.h"

@protocol PREConverseAPIResponse;

@protocol PREConverseAPIRequest <NSObject>

- (PREConverseAPIMethod)method;
- (NSURL*)baseURL;
- (NSString*)path;
- (NSDictionary*)parameters;
- (NSDictionary*)headers;
- (Class<PREConverseAPIResponse>)responseClass;

@end

@interface PREConverseAPISimpleRequest : NSObject <PREConverseAPIRequest>

@property (nonatomic, readonly) PREConverseAPIMethod method;
@property (nonatomic, readonly, copy) NSURL* baseURL;
@property (nonatomic, readonly, copy) NSString* path;
@property (nonatomic, readwrite, copy) NSDictionary* parameters;
@property (nonatomic, readonly, copy) NSDictionary* headers;
@property (nonatomic, readonly) Class<PREConverseAPIResponse> responseClass;

@end

@interface PREConverseAPIJSONRequest : PREConverseAPISimpleRequest

@end
