//
//  PREConverseOperationQueueManager.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PREConverseOperationQueueManager : NSObject

@property (nonatomic) NSInteger queueMaxConcurrentOps;
@property (nonatomic) NSQualityOfService queueQualityOfService;

- (void)addOperation:(NSOperation*)operation;
- (void)cancelAllOperations;

@end
