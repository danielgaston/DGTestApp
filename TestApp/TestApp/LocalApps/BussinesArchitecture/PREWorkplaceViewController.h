//
//  PREWorkplaceViewController.h
//  Pre
//

#import "PREBAObject.h"
#import "PRECommandViewController.h"
#import "PREGoalsTableViewController.h"
#import "PREMainActionTableViewCell.h"
#import "PRERefreshTableViewProtocol.h"

#import <UIKit/UIKit.h>

@interface PREWorkplaceViewController : PREParentBaseViewController <UITableViewDataSource, UITableViewDelegate, PRECommandViewControllerDelegate, UISearchBarDelegate, PREActionButtonDelegate, PRERefreshTableViewProtocol>

@property (nonatomic, strong) NSString* workplaceId;
@property (nonatomic, strong) NSArray<PREBAObject*>* actionWorkplaceMainActionSortMenu;
@property (nonatomic, strong) NSArray<PREGroup*>* actionWorkplaceOntologyConcepts;
@property (nonatomic, strong) NSArray<PREBAObject*>* formMenu;

@end
