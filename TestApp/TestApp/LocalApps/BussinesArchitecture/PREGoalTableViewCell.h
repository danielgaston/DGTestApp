//
//  PREGoalTableViewCell.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREMainAction.h"
#import "PREMainActionTableViewCell.h"
#import <UIKit/UIKit.h>

@interface PREGoalTableViewCell : PREParentBaseTableViewCell
@property (nonatomic, assign) PREMainAction* mainAction;
@property (nonatomic, assign) PREAction* action;
@property (nonatomic, assign) id<PREActionButtonDelegate> actionButtonDelegate;
@property (nonatomic, strong) NSIndexPath* indexPath;
@property (weak, nonatomic) IBOutlet UIView *actionTopSeparatorLineView;

@end
