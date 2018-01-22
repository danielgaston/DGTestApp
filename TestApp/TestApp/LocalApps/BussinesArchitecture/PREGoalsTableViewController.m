//
//  PREGoalsTableViewController.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREGoalsTableViewController.h"
#import "PREActionDetailsViewController.h"
#import "PREAlertManager.h"
#import "PREComplianceTableViewViewController.h"
#import "PREGoalContentTableViewController.h"
#import "PREGoalTableViewCell.h"
#import "PRELocalAppManager.h"
#import "PRELocalAppRequestManager.h"
#import "PRESubActionTableViewCell.h"
#import "SectionHeaderView.h"

NSString* const kComplianceGoalMenuOptionId = @"compliance";
NSString* const kContentGoalMenuOptionId = @"content";
NSString* const kDetailsGoalMenuOptionId = @"details";
NSString* const kCommunicationGoalMenuOptionId = @"communication";
NSString* const kGoalsGoalMenuOptionId = @"goals";

@interface PREGoalsTableViewController ()
@property (nonatomic, strong) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UILabel* tableTopLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint* containerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* containerTopConstraint;

@property (strong, nonatomic) PRECommandViewController* commandViewController;

@property (nonatomic, strong) NSMutableArray<NSMutableArray*>* cellGroups;
@property (nonatomic, strong) NSMutableDictionary<NSString*, SubActionsArrayObject*>* mainActionSubActions;

@end

static NSString* kGoalCellId = @"PREGoalTableViewCell";
static NSString* kSubActionCellId = @"PRESubActionTableViewCell";

@implementation PREGoalsTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.tableView registerNib:[UINib nibWithNibName:kGoalCellId bundle:nil] forCellReuseIdentifier:kGoalCellId];
	[self.tableView registerNib:[UINib nibWithNibName:kSubActionCellId bundle:nil] forCellReuseIdentifier:kSubActionCellId];

	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 66;
	self.tableView.tableFooterView = [[PREParentBaseTableViewFooterView alloc] initWithFrame:CGRectZero];

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"more_icon_vert_default" useThemes:YES] style:UIBarButtonItemStyleDone target:self action:@selector(displayMoreOptions)];

	self.cellGroups = [NSMutableArray new];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	if (self.mainActionId && self.goalId) {
		[self requestGoalsForMainAction];
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"more_icon_vert_default" useThemes:YES] style:UIBarButtonItemStyleDone target:self action:@selector(displayMoreOptions)];
	} else if (self.goalId) {
		[self requestGoalsForGoalId];
	}
	if ([PRELocalAppManager sharedInstance].initialData && [PRELocalAppManager sharedInstance].initialData.actionWorkplaceOntologyConcepts.count > 0) {
		[self.commandViewController loadActionWorkplaceOntologyConcepts:[PRELocalAppManager sharedInstance].initialData.actionWorkplaceOntologyConcepts
												withUpcomingMainActions:self.goal.upcomingMainActions
												   withCommandBoxOption:actionCommandBoxOption];
	}
}

- (void)fillSubactionsDictionaryWithGoal:(PREGoal*)goal forActionId:(NSString*)mainActionId withCompletionBlock:(void (^)(void))completionBlock
{

	if (completionBlock) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
			[self _fillSubactionsDictionaryWithGoal:goal forActionId:mainActionId withCompletionBlock:completionBlock];
		});
	} else {
		[self _fillSubactionsDictionaryWithGoal:goal forActionId:mainActionId withCompletionBlock:completionBlock];
	}
}

- (void)_fillSubactionsDictionaryWithGoal:(PREGoal*)goal forActionId:(NSString*)mainActionId withCompletionBlock:(void (^)(void))completionBlock
{
	//fill mainActionSubActions dictionary with all mainactions
	__block BOOL stopBucle = NO;
	[goal.mainActionGroups enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
		//for each day
		*stop = stopBucle;
		PREMainActionGroup* mainActionGroup = obj;
		//initialize the mutable dictionary in case it is not
		if (!self.mainActionSubActions) {
			self.mainActionSubActions = [NSMutableDictionary new];
		}
		[mainActionGroup.mainActions enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
			//enumerate all main actions: only the current main action Id has child actions (what we search)
			PREMainAction* mainAction = obj;
			if ([mainAction.id isEqualToString:mainActionId]) { //getting actions from our main action Id
				if (mainAction.actions.count > 0) {
					[self.mainActionSubActions setObject:[SubActionsArrayObject subActionsArrayObjectCollapsed:YES withActionsArray:mainAction.actions] forKey:mainAction.id];
				} else { //in case our main action id has not actions lets add an empty array
					[self.mainActionSubActions setObject:[SubActionsArrayObject subActionsArrayObjectCollapsed:YES withActionsArray:[NSArray new]] forKey:mainAction.id];
				}
				LOG(@"Added %ld actions for action id %@", mainAction.actions.count, mainActionId);
				//we got ours so we get out the bucle
				if (!completionBlock) { //in case we are in recursivity search and we found our main action stop bucle so main bucle can go on
					*stop = YES;
					stopBucle = YES;
				}
			} else {
				if (!self.mainActionSubActions[mainAction.id]) {
					if (mainAction.actions.count > 0) {
						[self.mainActionSubActions setObject:[SubActionsArrayObject subActionsArrayObjectCollapsed:YES withActionsArray:mainAction.actions] forKey:mainAction.id];
					} else { //repeat process recursively untill all mainActionsId are inside dictionary
						PREGoal* goal = [[PRELocalAppRequestManager sharedInstance] synch_getGoal:self.goalId forMainAction:mainAction.id];
						if (goal) {
							//recursivity!
							[self fillSubactionsDictionaryWithGoal:goal forActionId:mainAction.id withCompletionBlock:nil];
						}
					}
				}
			}

		}];
	}];
	if (completionBlock) {
		dispatch_async(dispatch_get_main_queue(), ^{
			completionBlock();
		});
	}
}

- (void)requestGoalsForMainAction
{
	[[PRELocalAppRequestManager sharedInstance] getGoal:self.goalId
										  forMainAction:self.mainActionId
										withResultBlock:^(ResultRequestStatus status, PREGoal* goal) {
											if (status == ResultRequestStatusSuccess) {
												//fill mainActionSubActions dictionary with all mainactions
												[self fillSubactionsDictionaryWithGoal:goal
																		   forActionId:self.mainActionId
																   withCompletionBlock:^{
																	   self.title = goal.title;
																	   self.goal = goal;
																	   [self.tableView reloadData];
																   }];
											} else {
												[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
													data.title = NSLocalizedString(@"Error", nil);
													data.message = NSLocalizedString(@"goalGoals", nil);
												}];
											}

										}];
}

- (void)requestGoalsForGoalId
{
	[[PRELocalAppRequestManager sharedInstance] getGoalGoalsForGoalId:self.goalId
													  withResultBlock:^(ResultRequestStatus status, PREGoal* goal) {
														  if (status == ResultRequestStatusSuccess) {
															  self.title = goal.title;
															  self.goal = goal;
															  [self.tableView reloadData];
														  } else {
															  [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																  data.title = NSLocalizedString(@"Error", nil);
																  data.message = NSLocalizedString(@"goalGoals", nil);
															  }];
														  }
													  }];
}

- (void)displayMoreOptions
{

	[PREAlertManager displayActionSheetWithData:^(PREAlertManagerData* data) {
		data.title = @"Please select an option";
		for (PREBAObject* baObject in [PRELocalAppManager sharedInstance].initialData.goalMenu) {
			[data addButtonWithTitle:baObject.title
						   andAction:^{
							   NSLog(@"Option selected: %@", baObject.title);
							   [self processOption:baObject];
						   }];
		}
		[data addCancelButtonWithAction:nil];
	}];
}

- (void)processOption:(PREBAObject*)baObject
{
	if ([baObject.id isEqualToString:kComplianceGoalMenuOptionId]) {

		PREComplianceTableViewViewController* complianceTableViewController = [[PREComplianceTableViewViewController alloc] initWithNibName:@"PREComplianceTableViewViewController" bundle:nil];
		complianceTableViewController.goalId = self.goalId;
		complianceTableViewController.title = baObject.title;
		[self.navigationController pushViewController:complianceTableViewController animated:YES];

	} else if ([baObject.id isEqualToString:kContentGoalMenuOptionId]) {
		PREGoalContentTableViewController* goalContentTableViewController = [[PREGoalContentTableViewController alloc] initWithNibName:@"PREGoalContentTableViewController" bundle:nil];
		goalContentTableViewController.goalId = self.goalId;
		[self.navigationController pushViewController:goalContentTableViewController animated:YES];

	} else if ([baObject.id isEqualToString:kDetailsGoalMenuOptionId]) {
		PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
		actionDetailsViewController.mainActionId = self.goal.id;
		actionDetailsViewController.viewType = goalsDetailsViewType;
		actionDetailsViewController.delegate = self;
		[self.navigationController pushViewController:actionDetailsViewController animated:YES];
	} else if ([baObject.id isEqualToString:kCommunicationGoalMenuOptionId]) {
		[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
			data.title = NSLocalizedString(@"Alert", nil);
			data.message = @"To be defined.";
		}];
	} else if ([baObject.id isEqualToString:kGoalsGoalMenuOptionId]) {
		UIStoryboard* tableViewStoryboard = [UIStoryboard storyboardWithName:@"workplace" bundle:nil];
		PREGoalsTableViewController* goalsTVC = [tableViewStoryboard instantiateViewControllerWithIdentifier:@"goalsTableViewController"];
		goalsTVC.goalId = self.goal.id;
		[self.navigationController pushViewController:goalsTVC animated:YES];
	}
}

- (void)setGoal:(PREGoal*)goal
{
	_goal = goal;

	for (PREMainActionGroup* group in goal.mainActionGroups) {

		NSMutableArray* cellGroup = [NSMutableArray new];

		for (PREMainAction* mainAction in group.mainActions) {
			[cellGroup addObject:mainAction];
			//find actions for main action
			if (self.mainActionSubActions[mainAction.id]) {
				//for the moment we show them all (not collapsing)
				NSArray* actionsArray = ((SubActionsArrayObject*)self.mainActionSubActions[mainAction.id]).actionsArray;
				for (PREAction* action in actionsArray) {
					[cellGroup addObject:action];
				}
			}
		}

		[self.cellGroups addObject:cellGroup];
	}
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
	return self.goal.mainActionGroups.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.cellGroups[section].count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	JSONModel* model = self.cellGroups[indexPath.section][indexPath.row];

	if ([model isKindOfClass:[PREMainAction class]]) {
		PREGoalTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kGoalCellId];

		PREMainAction* mainAction = (PREMainAction*)model;
		cell.mainAction = mainAction;
		cell.actionButtonDelegate = self;

		if (self.tableTopLabel.text.length == 0 && mainAction.subtitle.length > 0) {
			self.tableTopLabel.text = mainAction.subtitle;
		}

		//separator for first cell on each section
		if (indexPath.row == 0) {
			cell.actionTopSeparatorLineView.backgroundColor = tableView.separatorColor;
		} else {
			cell.actionTopSeparatorLineView.backgroundColor = [UIColor clearColor];
		}

		return cell;
	} else { //sub action
		PREGoalTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kSubActionCellId];
		cell.action = (PREAction*)model;

		return cell;
	}
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
	return ((PREMainActionGroup*)self.goal.mainActionGroups[section]).title;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
	SectionHeaderView* sectionHeaderView = [[SectionHeaderView alloc] init];
	sectionHeaderView.titleLabel.text = [self tableView:self.tableView titleForHeaderInSection:section];
	return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
	return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	JSONModel* model = self.cellGroups[indexPath.section][indexPath.row];

	PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
	if ([model isKindOfClass:[PREMainAction class]]) {
		PREMainAction* mainAction = (PREMainAction*)model;
		actionDetailsViewController.mainActionId = mainAction.id;
		actionDetailsViewController.originMainActionId = self.mainActionId;
		actionDetailsViewController.originGoalId = self.goalId;
		actionDetailsViewController.viewType = mainActionViewType;
		actionDetailsViewController.delegate = self;
	} else {
		PREAction* action = (PREAction*)model;
		actionDetailsViewController.actionId = action.id;
		actionDetailsViewController.viewType = actionViewType;
		actionDetailsViewController.delegate = self;
		NSLog(@"Subaction");
	}
	[self.navigationController pushViewController:actionDetailsViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"containerCommandViewController"]) {
		self.commandViewController = segue.destinationViewController;
	}
}

#pragma mark - PRERefreshTableViewProtocol

- (void)refreshList
{
	[self requestGoalsForMainAction];
}

#pragma mark - PRECommandViewControllerDelegate

- (void)extendCommandViewController
{
	[self.view layoutIfNeeded];
	[UIView animateWithDuration:0.2
					 animations:^{
						 self.containerTopConstraint.constant = 0;
						 self.containerTopConstraint.priority = UILayoutPriorityDefaultHigh;
						 self.containerHeightConstraint.priority = UILayoutPriorityDefaultLow;
						 [self.view layoutIfNeeded];
					 }
					 completion:nil];
}

- (void)compactCommandViewController
{
	[self.view layoutIfNeeded];
	[UIView animateWithDuration:0.2
					 animations:^{
						 self.containerTopConstraint.priority = UILayoutPriorityDefaultLow;
						 self.containerHeightConstraint.priority = UILayoutPriorityDefaultHigh;
						 [self.view layoutIfNeeded];
					 }
					 completion:nil];
}

- (void)changeCommandViewControllerPosition:(CGFloat)position
{
	if (self.containerTopConstraint.priority == UILayoutPriorityDefaultHigh) {
		self.containerTopConstraint.constant = position;
	}
}

#pragma mark -  keyboard interaction functions

- (void)keyboardWasShown:(NSNotification*)aNotification
{
	//get the end position keyboard frame
	NSDictionary* keyInfo = [aNotification userInfo];
	CGRect keyboardFrame = [[keyInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	//convert it to the same view coords as the tableView it might be occluding
	keyboardFrame = [self.tableView convertRect:keyboardFrame fromView:nil];
	//calculate if the rects intersect
	CGRect intersect = CGRectIntersection(keyboardFrame, self.tableView.bounds);
	if (!CGRectIsNull(intersect)) {
		//first get the duration of the keyboard appearance animation
		NSTimeInterval duration = [[keyInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
		// adjust the animation curve - untested
		NSInteger curve = [aNotification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue] << 16;
		//change the table insets to match - animated to the same duration of the keyboard appearance
		[UIView animateWithDuration:duration
							  delay:0.0
							options:curve
						 animations:^{
							 self.tableView.contentInset = UIEdgeInsetsMake(0, 0, intersect.size.height, 0);
							 self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, intersect.size.height, 0);
						 }
						 completion:nil];
	}
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
	NSDictionary* keyInfo = [aNotification userInfo];
	NSTimeInterval duration = [[keyInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	NSInteger curve = [aNotification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue] << 16;
	//change the table insets to match - animated to the same duration of the keyboard appearance
	[UIView animateWithDuration:duration
						  delay:0.0
						options:curve
					 animations:^{
						 self.tableView.contentInset = UIEdgeInsetsZero;
						 self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
					 }
					 completion:nil];
}

- (void)didSelectOptionAtIndex:(NSInteger)actionIndex forCellAtIndexPath:(NSIndexPath*)indexPath
{
	PREMainAction* mainAction = ((PREMainActionGroup*)self.goal.mainActionGroups[indexPath.section]).mainActions[indexPath.row];
	if (actionIndex == 0) {
		[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
			data.title = NSLocalizedString(@"Alert", nil);
			data.message = @"To be defined.";
		}];
	}

	if (actionIndex == 1) {
		[self showPlan:mainAction.id];
	}
}

- (void)showPlan:(NSString*)mainActionId
{
	PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
	actionDetailsViewController.mainActionId = mainActionId;
	actionDetailsViewController.viewType = planGoalsViewType;
	actionDetailsViewController.delegate = self;
	[self.navigationController pushViewController:actionDetailsViewController animated:YES];
}

@end

@implementation SubActionsArrayObject

+ (SubActionsArrayObject*)subActionsArrayObjectCollapsed:(BOOL)collapsed withActionsArray:(NSArray<PREAction*>*)actionsArray
{
	SubActionsArrayObject* subActionsArrayObject = [SubActionsArrayObject alloc];
	subActionsArrayObject.collapsed = collapsed;
	subActionsArrayObject.actionsArray = actionsArray;
	return subActionsArrayObject;
}

@end
