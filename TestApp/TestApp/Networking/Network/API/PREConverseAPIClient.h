//
//  PREConverseAPIClient.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

@import Foundation;

#import "PREConverseAPIRequest.h"
#import "PREConverseAPIResponse.h"

typedef void (^PREConverseAPIClientCompletionBlock)(id<PREConverseAPIResponse> response);

/*!
 * @brief Defined to use an NSURLSessionDataTask directly on an NSURLSession
 */
@protocol PREConverseAPINetworkDataClient <NSObject>

- (NSURLSessionDataTask*)dataTaskWithConverseAPIRequest:(id<PREConverseAPIRequest>)request
											 completion:(PREConverseAPIClientCompletionBlock)completion;
@end

/*!
 * @brief Defined to use an NSURLSessionDataTask directly on an NSURLSession inside an NSOperation
 */
@protocol PREConverseAPIOperationDataClient <NSObject>

- (NSURLSessionDataTask*)operationDataTaskWithConverseAPIRequest:(id<PREConverseAPIRequest>)request;

@end

@protocol PREConverseAPINetworkUploadClient <NSObject>
// NSURLSessionUploadTask API pending to be implemented
@end
@protocol PREConverseAPIOperationUploadClient <NSObject>
// NSURLSessionUploadTask API pending to be implemented
@end
@protocol PREConverseAPINetworkDownloadClient <NSObject>
// NSURLSessionDownloadTask API pending to be implemented
@end
@protocol PREConverseAPIOperationDownloadClient <NSObject>
// NSURLSessionDownloadTask API pending to be implemented
@end
@protocol PREConverseAPINetworkStreamClient <NSObject>
// NSURLSessionStreamTask API pending to be implemented
@end
@protocol PREConverseAPIOperationStreamClient <NSObject>
// NSURLSessionStreamTask API pending to be implemented
@end

// INFO: Our Main client implements dataTasks only, but it is open to implement the rest of protocols in a future
@protocol PREConverseAPINetworkClient <PREConverseAPINetworkDataClient>
@end
// INFO: Our Main client implements dataTasks only, but it is open to implement the rest of protocols in a future
@protocol PREConverseAPIOperationClient <PREConverseAPIOperationDataClient>
@end

@interface NSURLSession (PREConverseAPINetworkClient) <PREConverseAPINetworkClient>
@end
@interface NSURLSession (PREConverseAPIOperationClient) <PREConverseAPIOperationClient>
@end
