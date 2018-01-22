//
//  PREConverseOperationNetworkTestManager.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseOperationNetworkTestManager.h"
#import "PREConverseOperationQueueManager.h"
#import "PREConverseTestJSONOperation.h"

@interface PREConverseOperationNetworkTestManager ()

@property (nonatomic) PREConverseOperationQueueManager* queueManager;

@end

@implementation PREConverseOperationNetworkTestManager

#pragma mark - Object LifeCycle Methods

- (instancetype)init
{
	self = [super init];
	if (self) {
		_queueManager = [PREConverseOperationQueueManager new];
	}
	return self;
}

- (void)dealloc
{
	[self cancelAllRequests];
}

#pragma mark - Public API Methods

- (void)getTestJSON:(PREConverseTestJSONResponseBlock)completion
{
	PREConverseTestJSONRequest* request = [[PREConverseTestJSONRequest alloc] init];
	PREConverseTestJSONOperation* operation = [[PREConverseTestJSONOperation alloc] initWithRequest:request operationDelegate:self completion:completion];

	[self.queueManager addOperation:operation];
}

- (void)cancelAllRequests
{
	[self.queueManager cancelAllOperations];
}

#pragma mark - PREConverseAPIBaseOperationDelegate

- (void)converseAPIBaseOperation:(PREConverseAPIBaseOperation*)op reportsKBperSecond:(CGFloat)KBperSec
{
	NSLog(@"CURRENT NETWORK SPEEDx: KB/s: %f", KBperSec);

	// TODO: Modify NSOperationQueue based on measurements
}

@end
