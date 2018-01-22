//
//  PREComplianceTableViewViewController.h
//  Pre
//

#import "PREActionWorkplace.h"
#import <UIKit/UIKit.h>

@interface PREComplianceTableViewViewController : PREParentBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<PREMainAction*>* mainActions;
@property (nonatomic, strong) NSString* goalId;
@property (nonatomic, strong) NSString* mainActionId;

@end
