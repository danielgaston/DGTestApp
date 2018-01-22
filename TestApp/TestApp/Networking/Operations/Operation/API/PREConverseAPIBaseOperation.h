//
//  PREConverseAPIBaseOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseDefaultOperationClient.h"
#import "PREConverseDefaultRequest.h"
#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>

@class PREConverseAPIBaseOperation;
@protocol PREConverseAPIBaseOperationDelegate

- (void)converseAPIBaseOperation:(PREConverseAPIBaseOperation*)op reportsKBperSecond:(CGFloat)KBperSec;

@end

@interface PREConverseAPIBaseOperation : NSOperation <NSURLSessionDelegate, NSURLSessionTaskDelegate>

/*!
 * @brief Delegate used to report network speed, and adapt the queue accordingly
 * @warning PREConverseOperationNetworkManager variable must be retained in a ViewController, otherwise operationDelegate is deallocated before the request finishes
 */
@property (nonatomic, weak) id<PREConverseAPIBaseOperationDelegate> operationDelegate;
@property (nonatomic) NSURLSessionTask* task;
@property (nonatomic) NSMutableData* taskIncomingData;
@property (nonatomic) NSURLSession* taskSession;
@property (nonatomic) NSURLResponse* taskResponse;

/*!
 * @brief Finishes the execution of the operation
 * @warning This shouldn’t be called externally as this is used internally by subclasses. To cancel an operation use cancel instead.
 */
- (void)finish;
- (void)processCurrentState;
@end
