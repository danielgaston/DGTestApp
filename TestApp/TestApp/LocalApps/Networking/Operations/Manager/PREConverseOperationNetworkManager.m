//
//  PREConverseOperationNetworkManager.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseOperationNetworkManager.h"
#import "PREConverseActionOperation.h"
#import "PREConverseActionsOperation.h"
#import "PREConverseInitialDataOperation.h"
#import "PREConverseOperationQueueManager.h"

@interface PREConverseOperationNetworkManager ()

@property (nonatomic) PREConverseOperationQueueManager* queueManager;

@end

@implementation PREConverseOperationNetworkManager

#pragma mark - Object LifeCycle Methods

- (instancetype)init
{
	self = [super init];
	if (self) {
		_queueManager = [PREConverseOperationQueueManager new];
	}
	return self;
}

#pragma mark - Public API Methods

- (void)getInitialData:(PREConverseInitialDataResponseBlock)completion
{
	PREConverseInitialDataRequest* request = [[PREConverseInitialDataRequest alloc] init];
	PREConverseInitialDataOperation* operation = [[PREConverseInitialDataOperation alloc] initWithRequest:request operationDelegate:self completion:completion];

	[self.queueManager addOperation:operation];
}

- (void)getActionsWithParams:(PREConverseActionsRequestParams*)params completion:(PREConverseActionsResponseBlock)completion
{
	PREConverseActionsRequest* request = [[PREConverseActionsRequest alloc] init];
	PREConverseActionsOperation* operation = [[PREConverseActionsOperation alloc] initWithRequest:request params:params operationDelegate:self completion:completion];

	[self.queueManager addOperation:operation];
}

- (void)getActionWithParams:(PREConverseActionRequestParams*)params completion:(PREConverseActionResponseBlock)completion
{
	PREConverseActionRequest* request = [[PREConverseActionRequest alloc] init];
	PREConverseActionOperation* operation = [[PREConverseActionOperation alloc] initWithRequest:request params:params operationDelegate:self completion:completion];

	[self.queueManager addOperation:operation];
}

- (void)cancelAllRequests
{
	[self.queueManager cancelAllOperations];
}

#pragma mark - PREConverseAPIBaseOperationDelegate

- (void)converseAPIBaseOperation:(PREConverseAPIBaseOperation*)op reportsKBperSecond:(CGFloat)KBperSec
{
	NSLog(@"OPERATION STATS: KB/s: %f", KBperSec);

	// TODO: Modify NSOperationQueue based on measurements
}

@end
