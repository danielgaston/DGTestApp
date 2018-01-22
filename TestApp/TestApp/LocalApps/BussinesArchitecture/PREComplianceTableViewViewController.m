//
//  PREComplianceTableViewViewController.m
//  Pre
//

#import "PREComplianceTableViewViewController.h"
#import "BaseTableSection.h"
#import "PREActionDetailsViewController.h"
#import "PREAlertManager.h"
#import "PREComplianceTableViewCell.h"
#import "PRELocalAppRequestManager.h"

@interface PREComplianceTableViewViewController ()

@property (weak, nonatomic) IBOutlet UITableView* tableView;

@end

static NSString* kComplianceCellID = @"PREComplianceTableViewCell";

@implementation PREComplianceTableViewViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.tableView registerNib:[UINib nibWithNibName:kComplianceCellID bundle:nil] forCellReuseIdentifier:kComplianceCellID];
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 44;
}

- (void)viewWillAppear:(BOOL)animated
{
	if (self.goalId) {
		[[PRELocalAppRequestManager sharedInstance] getComplianceForGoalId:self.goalId
														   withResultBlock:^(ResultRequestStatus status, PREActionWorkplace* actionWorkPlace) {
															   if (status == ResultRequestStatusSuccess) {
																   if (actionWorkPlace && actionWorkPlace.mainActionGroups.count > 0) {
																	   self.mainActions = ((PREMainActionGroup*)actionWorkPlace.mainActionGroups.firstObject).mainActions;
																   }
																   [self manageTableViewHeader];
																   [self.tableView reloadData];
															   } else {
																   [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																	   data.title = NSLocalizedString(@"Error", nil);
																	   data.message = NSLocalizedString(@"complianceError", nil);
																   }];
															   }
														   }];
	} else if (self.mainActionId) {
		[[PRELocalAppRequestManager sharedInstance] getComplianceForMainActionId:self.mainActionId
																 withResultBlock:^(ResultRequestStatus status, PREActionWorkplace* actionWorkPlace) {
																	 if (status == ResultRequestStatusSuccess) {
																		 if (actionWorkPlace && actionWorkPlace.mainActionGroups.count > 0) {
																			 self.mainActions = ((PREMainActionGroup*)actionWorkPlace.mainActionGroups.firstObject).mainActions;
																		 }
																		 [self manageTableViewHeader];
																		 [self.tableView reloadData];
																	 } else {
																		 [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																			 data.title = NSLocalizedString(@"Error", nil);
																			 data.message = NSLocalizedString(@"complianceError", nil);
																		 }];
																	 }

																 }];
	}
}

- (void)manageTableViewHeader
{
	if (self.parentViewController) {
		SEL selector = NSSelectorFromString(@"headerView");
		if ([self.parentViewController respondsToSelector:selector]) {
			NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:
														 [[self.parentViewController class] instanceMethodSignatureForSelector:selector]];
			[invocation setSelector:selector];
			[invocation setTarget:self.parentViewController];
			[invocation invoke];

			//invocation getReturnValue has memory problems (http://stackoverflow.com/questions/22018272/nsinvocation-returns-value-but-makes-app-crash-with-exc-bad-access)
			//for this reason __unsafe_retained
			UIView* __unsafe_unretained customHeaderView;
			[invocation getReturnValue:&customHeaderView];
			self.tableView.tableHeaderView = customHeaderView;
			self.tableView.tableHeaderView.autoresizingMask = UIViewAutoresizingNone;
		}
	}

	if ([self.tableView.tableHeaderView conformsToProtocol:@protocol(BaseTableViewSectionProtocol)]) {
		[self.tableView.tableHeaderView performSelector:@selector(setParentVC:) withObject:self];
	}

	if (self.parentViewController) {
		if ([self.parentViewController respondsToSelector:@selector(updateHeaderHeight:)]) {
			[self.parentViewController performSelector:@selector(updateHeaderHeight:) withObject:@(self.tableView.tableHeaderView.frame.size.height)];
		}
	}
}

//function needed in case our view controller is added on a container
- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
	if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(scrollViewDidScroll:)]) {
		[self.parentViewController performSelector:@selector(scrollViewDidScroll:) withObject:scrollView];
	}
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.mainActions.count;
}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	PREComplianceTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kComplianceCellID forIndexPath:indexPath];
	cell.mainAction = self.mainActions[indexPath.row];
	return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (self.goalId) {
		PREMainAction* mainAction = self.mainActions[indexPath.row];
		PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
		actionDetailsViewController.mainActionId = mainAction.id;
		actionDetailsViewController.viewType = mainActionViewType;
		[self.navigationController pushViewController:actionDetailsViewController animated:YES];
	}
}

@end
