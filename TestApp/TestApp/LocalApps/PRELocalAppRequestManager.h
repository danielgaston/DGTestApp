//
//  PRELocalAppRequestManager.h
//  Pre
//

#import "PREActionWorkplace.h"
#import "PREBACommand.h"
#import "PREInitialData.h"
#import "PREWorkplace.h"
#import <Foundation/Foundation.h>

//Request documentation on http://schemas.isis-papyrus.com/baservicedoc/index.html

typedef NS_ENUM(NSInteger, ResultRequestStatus) {
	ResultRequestStatusSuccess = 1,
	ResultRequestStatusFailure
};

typedef void (^ResultRequestBlock)(ResultRequestStatus status, NSDictionary* dictionary);

@interface PRELocalAppRequestManager : NSObject

+ (PRELocalAppRequestManager*)sharedInstance;

- (void)getInitialDataWithResultBlock:(void (^)(ResultRequestStatus status, PREInitialData* initialData))block;
- (void)getWorkPlacesListWithResultBlock:(void (^)(ResultRequestStatus status, NSArray<PREWorkplace*>* array))block;
- (void)getWorkPlace:(NSString*)workplaceId withResultBlock:(void (^)(ResultRequestStatus status, PREWorkplace* workplace))block;
- (void)getActionsWorkPlace:(NSString*)actionWorkplaceId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block;
- (void)getActionsWorkPlace:(NSString*)actionWorkplaceId sortBy:(NSString*)sortByParameter withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block;
- (void)getMainAction:(NSString*)actionId withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block;
- (void)getAction:(NSString*)actionId withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block;
- (void)getGoal:(NSString*)goalId forMainAction:(NSString*)mainActionId withResultBlock:(void (^)(ResultRequestStatus status, PREGoal* goal))block;
- (PREGoal*)synch_getGoal:(NSString*)goalId forMainAction:(NSString*)mainActionId;
- (void)getPlan:(NSString*)mainActionId withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block;
- (void)postUpdateItemWithAttributesArray:(PREForm*)originalForm andResultBlock:(void (^)(ResultRequestStatus status, PREForm* updatedform))block;
- (void)postSaveForm:(PREForm*)originalForm andResultBlock:(void (^)(ResultRequestStatus status, PREForm* updatedform))block;
- (void)postCancelForm:(PREForm*)originalForm andResultBlock:(void (^)(ResultRequestStatus status, PREForm* updatedform))block;
- (void)getCommandsWithText:(NSString*)commandText andResultBlock:(void (^)(ResultRequestStatus status, NSArray<PREBACommand*>* baCommand))block;
- (void)createMainAction:(PREBACommand*)baCommand withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block;
- (void)createMainActionWithFreeText:(NSString*)freeText withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block;
- (void)createAction:(PREBACommand*)baCommand withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block;
- (void)createActionWithFreeText:(NSString*)freeText withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block;
- (void)getComplianceForMainActionId:(NSString*)mainActionId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block;
- (void)getComplianceForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block;
- (void)getContentForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block;
- (void)getGoalDetailsForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREForm* form))block;
- (void)getGoalGoalsForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREGoal* goal))block;
- (void)getContentBinaryForId:(NSString*)contentId fromViewController:(UIViewController*)viewController;

- (NSURL*)iconForWorkPlace:(PREWorkplace*)workplace;

- (NSURL*)resolveImageURL:(NSString*)imageId;

@end
