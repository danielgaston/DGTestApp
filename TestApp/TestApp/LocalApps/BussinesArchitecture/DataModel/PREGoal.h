//
//  PREGoal.h
//  Pre
//

#import "PREItem.h"
#import <JSONModel/JSONModel.h>

@protocol PREItem;
@protocol PREMainActionGroup;
@protocol PREMainAction;

@interface PREGoal : JSONModel

@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSArray<PREMainActionGroup, Optional>* mainActionGroups;
@property (nonatomic, strong) NSArray<PREMainAction, Optional>* upcomingMainActions;

@end
