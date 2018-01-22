//
//  PREMainActionGroupTableViewController.h
//  Pre
//

#import <UIKit/UIKit.h>
#import "PREMainActionGroup.h"

@interface PREMainActionGroupTableViewController : PREParentBaseTableViewController

@property (nonatomic, strong) NSArray<PREMainActionGroup*>* mainActionGroups;

@end
