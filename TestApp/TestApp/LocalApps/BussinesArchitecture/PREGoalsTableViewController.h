//
//  PREGoalsTableViewController.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PRECommandViewController.h"
#import "PREGoal.h"
#import "PREMainActionTableViewCell.h"
#import "PRERefreshTableViewProtocol.h"

#import <UIKit/UIKit.h>

@interface PREGoalsTableViewController : PREParentBaseViewController <PRECommandViewControllerDelegate, PREActionButtonDelegate, PRERefreshTableViewProtocol>

@property (nonatomic, strong) NSString* goalId;
@property (nonatomic, strong) NSString* mainActionId;

@property (nonatomic, strong) PREGoal* goal;

@end


@interface SubActionsArrayObject :NSObject

@property (nonatomic, assign) BOOL collapsed;
@property (nonatomic, strong) NSArray<PREAction*>* actionsArray;

+(SubActionsArrayObject*) subActionsArrayObjectCollapsed:(BOOL)collapsed withActionsArray:(NSArray<PREAction*>*)actionsArray;

@end
