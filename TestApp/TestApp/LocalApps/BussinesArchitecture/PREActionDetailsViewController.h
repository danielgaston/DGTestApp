//
//  PREActionDetailsViewController.h
//  Pre
//

#import "ObjectEditorVC.h"
#import "PREBAObject.h"
#import "PREContentSelectorViewController.h"
#import "PRERefreshTableViewProtocol.h"

typedef NS_ENUM(NSUInteger, ViewType) {
	mainActionViewType = 0,
	actionViewType,
	planGoalsViewType,
	goalsDetailsViewType
};

@interface PREActionDetailsViewController : PREContentSelectorViewController

@property (nonatomic, strong) NSString* mainActionId;
@property (nonatomic, strong) NSString* actionId;
@property (nonatomic, assign) ViewType viewType;
@property (nonatomic, weak) id<PRERefreshTableViewProtocol> delegate;

@property (nonatomic, strong) NSString* originMainActionId;
@property (nonatomic, strong) NSString* originGoalId;

@end
