//
//  PREWorkplaceViewController.m
//  Pre
//

#import "PREWorkplaceViewController.h"
#import "PREActionDetailsViewController.h"
#import "PREAlertManager.h"
#import "PREAlertManagerData.h"
#import "PRECommandViewController.h"
#import "PRELocalAppRequestManager.h"
#import "PREMainActionTableViewCell.h"
#import "PRESegmentedControl.h"
#import "UIImage+Color.h"

CGFloat const kSearchBarVisibleHeigh = 40;
CGFloat const kTableViewRowHeigh = 72;
CGFloat const kTableDefaultTopEdgeInset = 10;

NSString* const kCellReuseIdentifier = @"PREMainActionTableViewCell";

@interface PREWorkplaceViewController ()

@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet PRESegmentedControl* segmentedControl;
@property (weak, nonatomic) IBOutlet UIView* activityIndicatorView;
@property (weak, nonatomic) IBOutlet UISearchBar* searchBar;

@property (strong, nonatomic) PRECommandViewController* commandViewController;

@property (strong, nonatomic) NSArray<PREWorkplace*>* workPlaceArray; //segments
@property (strong, nonatomic) NSArray<PREMainActionGroup*>* actionWorkPlaceArray; //table
@property (strong, nonatomic) NSMutableArray<PREMainActionGroup*>* filteredActionWorkPlaceArray; //table

@property (weak, nonatomic) IBOutlet NSLayoutConstraint* containerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* containerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* searchViewhightConstraint;

@property (strong, nonatomic) NSString* sortOption;

@end

@implementation PREWorkplaceViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.tableView registerNib:[UINib nibWithNibName:kCellReuseIdentifier bundle:nil] forCellReuseIdentifier:kCellReuseIdentifier];

	self.tableView.rowHeight = kTableViewRowHeigh;
	self.tableView.contentInset = UIEdgeInsetsMake(kTableDefaultTopEdgeInset, 0, 0, 0);
	self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kTableDefaultTopEdgeInset, 0, 0, 0);
	self.searchViewhightConstraint.constant = kSearchBarVisibleHeigh;

	self.segmentedControl.hidden = YES;
	//getting segmented control data
	[[PRELocalAppRequestManager sharedInstance] getWorkPlace:self.workplaceId
											 withResultBlock:^(ResultRequestStatus status, PREWorkplace* workplace) {
												 [self.segmentedControl removeAllSegments];
												 self.workPlaceArray = workplace.actionWorkplaces;
												 if (status == ResultRequestStatusSuccess) {
													 int index = 0;
													 for (PREWorkplace* workplace in self.workPlaceArray) {
														 [self.segmentedControl insertSegmentWithTitle:workplace.title atIndex:index animated:NO];
														 index++;
													 }
													 self.segmentedControl.hidden = NO;

													 [self.segmentedControl setSelectedSegmentIndex:0];
													 [self loadActionWorkPlaceTable];
												 }
											 }];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_back_icon_default"]
																			 style:UIBarButtonItemStylePlain
																			target:self
																			action:@selector(dismissViewController)];

	if (self.actionWorkplaceMainActionSortMenu) {
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_sort_icon_default"]
																				  style:UIBarButtonItemStylePlain
																				 target:self
																				 action:@selector(displaySortOptions)];
	}

	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasShown:)
												 name:UIKeyboardWillShowNotification
											   object:nil];

	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillBeHidden:)
												 name:UIKeyboardWillHideNotification
											   object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];

	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillShowNotification
												  object:nil];

	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillHideNotification
												  object:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"containerCommandViewController"]) {
		self.commandViewController = segue.destinationViewController;
		[self.commandViewController loadActionWorkplaceOntologyConcepts:self.actionWorkplaceOntologyConcepts
												withUpcomingMainActions:nil
												   withCommandBoxOption:mainActionCommandBoxOption];
	}
}

- (void)dismissViewController
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)segmentedControlValueChanged:(id)sender
{
	PRESegmentedControl* segmentedControl = sender;
	NSLog(@"segmentedControlValueChanged value %ld", (long)segmentedControl.selectedSegmentIndex);
	[self cleanActionWorkPlaceTable];
	[self loadActionWorkPlaceTable];
}

- (void)loadActionWorkPlaceTable
{
	[self loadActionWorkPlaceTableSortingBy:self.sortOption];
}

- (void)loadActionWorkPlaceTableSortingBy:(NSString*)sortByOption
{
	[self.activityIndicatorView setHidden:NO];
	if (self.workPlaceArray.count == self.segmentedControl.numberOfSegments) {
		PREWorkplace* workplace = self.workPlaceArray[self.segmentedControl.selectedSegmentIndex];
		[[PRELocalAppRequestManager sharedInstance] getActionsWorkPlace:workplace.id
																 sortBy:sortByOption
														withResultBlock:^(ResultRequestStatus status, PREActionWorkplace* actionWorkplace) {
															self.actionWorkPlaceArray = actionWorkplace.mainActionGroups;
															[self.activityIndicatorView setHidden:YES];
															[self.tableView reloadData];
															dispatch_async(dispatch_get_main_queue(), ^{
																if (self.tableView.numberOfSections > 0) {
																	NSInteger lastRowNumber = [self.tableView numberOfRowsInSection:self.tableView.numberOfSections - 1] - 1;
																	NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:self.tableView.numberOfSections - 1];
																	[self.tableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
																} else {
																	//there is no sections so no need to display search bar
																	[self displaySearchBar:NO animated:NO];
																}
															});
														}];
	}
}

- (void)displaySortOptions
{
	[PREAlertManager displayActionSheetWithData:^(PREAlertManagerData* data) {
		[self.actionWorkplaceMainActionSortMenu enumerateObjectsUsingBlock:^(PREBAObject* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
			[data addButtonWithTitle:obj.title
						   andAction:^{
							   self.sortOption = obj.id;
							   [self loadActionWorkPlaceTableSortingBy:obj.id];
						   }];
		}];
		[data addCancelButtonWithAction:nil];
	}];
}

- (void)cleanActionWorkPlaceTable
{
	self.actionWorkPlaceArray = nil;
	self.filteredActionWorkPlaceArray = nil;
	[self displaySearchBar:NO animated:YES];
	[self.tableView reloadData];
}

- (void)displaySearchBar:(BOOL)show animated:(BOOL)animated
{
	CGFloat constraintValue = -1;
	if (show && self.searchViewhightConstraint.constant == 0) {
		constraintValue = kSearchBarVisibleHeigh;

	} else if (!show && self.searchViewhightConstraint.constant == kSearchBarVisibleHeigh) {
		self.searchBar.text = @"";
		[self.searchBar resignFirstResponder];
		constraintValue = 0;
	}
	if (constraintValue != -1) {
		if (animated) {
			[UIView animateWithDuration:0.4
							 animations:^{
								 self.searchViewhightConstraint.constant = constraintValue;
								 [self.view layoutIfNeeded];
							 }
							 completion:nil];
		} else {
			self.searchViewhightConstraint.constant = constraintValue;
		}
	}
}

- (void)filterArrayWithText:(NSString*)text
{
	NSLog(@"filterArrayWithText: %@", text);
	self.filteredActionWorkPlaceArray = nil;
	NSPredicate* predicateTitle = [NSPredicate predicateWithFormat:@"SELF.title contains[cd] %@", text];
	NSPredicate* predicateSubtitle = [NSPredicate predicateWithFormat:@"SELF.subtitle contains[cd] %@", text];
	NSPredicate* predicateTextInfo = [NSPredicate predicateWithFormat:@"SELF.addTextInfo contains[cd] %@", text];
	NSPredicate* bPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[ predicateTitle, predicateSubtitle, predicateTextInfo ]];
	if (text.length > 0) {
		self.filteredActionWorkPlaceArray = [NSMutableArray new];
		for (PREMainActionGroup* mainActionGrop in self.actionWorkPlaceArray) {
			NSArray* filteredMainActions = [mainActionGrop.mainActions filteredArrayUsingPredicate:bPredicate];
			if (filteredMainActions.count > 0) {
				PREMainActionGroup* newMainActionGroup = [[PREMainActionGroup alloc] init];
				newMainActionGroup.title = mainActionGrop.title;
				newMainActionGroup.mainActions = (NSArray<PREMainAction>*)filteredMainActions;
				[self.filteredActionWorkPlaceArray addObject:newMainActionGroup];
			}
		}
	}
	[self.tableView reloadData];
}

#pragma mark UITableViewDataSource UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
	if (self.filteredActionWorkPlaceArray) {
		return self.filteredActionWorkPlaceArray.count;
	}
	return self.actionWorkPlaceArray ? self.actionWorkPlaceArray.count : 0;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	if (self.filteredActionWorkPlaceArray) {
		return ((PREMainActionGroup*)self.filteredActionWorkPlaceArray[section]).mainActions.count;
	}
	return ((PREMainActionGroup*)self.actionWorkPlaceArray[section]).mainActions.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	PREMainActionTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
	PREMainAction* mainAction;
	if (self.filteredActionWorkPlaceArray) {
		mainAction = ((PREMainActionGroup*)self.filteredActionWorkPlaceArray[indexPath.section]).mainActions[indexPath.row];
	} else {
		mainAction = ((PREMainActionGroup*)self.actionWorkPlaceArray[indexPath.section]).mainActions[indexPath.row];
	}

	cell.titleLabel.text = mainAction.title;
	cell.subtitleLabel.text = mainAction.subtitle;
	cell.idLabel.text = mainAction.addTextInfo;
	cell.indexPath = indexPath;
	cell.actionButtonDelegate = self;
	return cell;
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
	return ((PREMainActionGroup*)self.actionWorkPlaceArray[section]).title;
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
	return CGFLOAT_MIN;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	PREMainAction* mainAction = ((PREMainActionGroup*)self.actionWorkPlaceArray[indexPath.section]).mainActions[indexPath.row];
	PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
	actionDetailsViewController.mainActionId = mainAction.id;
	actionDetailsViewController.viewType = mainActionViewType;
	actionDetailsViewController.delegate = self;
	[self.navigationController pushViewController:actionDetailsViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
	if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].y > 0) {
		//show search bar
		[self displaySearchBar:YES animated:YES];
	} else {
		//hide search bar
		if (self.searchBar.text.length == 0) {
			[self displaySearchBar:NO animated:YES];
		}
	}
}

#pragma mark - PRERefreshTableViewProtocol

- (void)refreshList
{
	[self loadActionWorkPlaceTable];
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

- (void)tableView:(UITableView*)tableView willDisplayHeaderView:(UIView*)view forSection:(NSInteger)section
{
	UITableViewHeaderFooterView* header = (UITableViewHeaderFooterView*)view;
	header.textLabel.text = header.textLabel.text.capitalizedString;
	header.textLabel.font = [UIFont fontWithName:header.textLabel.font.fontName size:13];
	CGRect headerFrame = header.frame;
	header.textLabel.frame = headerFrame;
}

#pragma mark - UISearchBarDelegate , UISearchResultsUpdating

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	[self performSelector:@selector(filterArrayWithText:)
			   withObject:searchText
			   afterDelay:0.5];
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
							 self.tableView.contentInset = UIEdgeInsetsMake(kTableDefaultTopEdgeInset, 0, intersect.size.height, 0);
							 self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kTableDefaultTopEdgeInset, 0, intersect.size.height, 0);
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
						 self.tableView.contentInset = UIEdgeInsetsMake(kTableDefaultTopEdgeInset, 0, 0, 0);
						 ;
						 self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kTableDefaultTopEdgeInset, 0, 0, 0);
					 }
					 completion:nil];
}

- (void)showGoal:(NSString*)goalId forMainAction:(NSString*)mainActionId
{
	UIStoryboard* tableViewStoryboard = [UIStoryboard storyboardWithName:@"workplace" bundle:nil];
	PREGoalsTableViewController* goalsTVC = [tableViewStoryboard instantiateViewControllerWithIdentifier:@"goalsTableViewController"];
	goalsTVC.mainActionId = mainActionId;
	goalsTVC.goalId = goalId;
	[self.navigationController pushViewController:goalsTVC animated:YES];

	//do the call to parse the goals
}

- (void)showPlan:(NSString*)mainActionId
{
	PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
	actionDetailsViewController.mainActionId = mainActionId;
	actionDetailsViewController.viewType = planGoalsViewType;
	actionDetailsViewController.delegate = self;
	[self.navigationController pushViewController:actionDetailsViewController animated:YES];
}

- (void)didSelectOptionAtIndex:(NSInteger)actionIndex forCellAtIndexPath:(NSIndexPath*)indexPath
{
	PREMainAction* mainAction = ((PREMainActionGroup*)self.actionWorkPlaceArray[indexPath.section]).mainActions[indexPath.row];
	if (actionIndex == 0) {
		[self showGoal:mainAction.goal.id forMainAction:mainAction.id];
	}

	if (actionIndex == 1) {
		[self showPlan:mainAction.id];
	}
}

@end
