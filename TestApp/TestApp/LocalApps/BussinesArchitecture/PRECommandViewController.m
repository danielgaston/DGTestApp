//
//  PRECommandViewController.m
//  Pre
//

#import "PRECommandViewController.h"
#import "PREActionDetailsViewController.h"
#import "PREAlertManager.h"
#import "PREGoalTableViewCell.h"
#import "PRELocalAppRequestManager.h"
#import "UIColor+HTMLColors.h"

static NSString* kGoalCellId = @"PREGoalTableViewCell";

@interface PRECommandViewController ()
@property (weak, nonatomic) IBOutlet UIButton* commandButton;
@property (weak, nonatomic) IBOutlet UITextField* commandTextField;
@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UIView* commandBoxViewContainer;
@property (weak, nonatomic) IBOutlet UIButton* upcomingActionButton;

@property (strong, nonatomic) NSArray<PREGroup*>* originalWorkplaceOntologyConcepts;
@property (strong, nonatomic) NSArray<PREGroup*>* actionWorkplaceOntologyConcepts;
@property (strong, nonatomic) NSArray<PREGroup*>* filteredActionWorkplaceOntologyConcepts;

@property (strong, nonatomic) NSArray<PREBACommand*>* baCommandArray;
@property (assign) CommandBoxOption commandBoxOption;
@property (strong, nonatomic) NSArray<PREMainAction*>* upcomingMainActions;
@property (assign, nonatomic) BOOL displayUpcomingMainActions;

@end

@implementation PRECommandViewController

- (void)awakeFromNib
{
	[super awakeFromNib];

	[self.commandButton setImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_plus_icon_default"] forState:UIControlStateNormal];
	[self.upcomingActionButton setImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_upcoming_actions_icon_default"] forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
	[self.tableView registerNib:[UINib nibWithNibName:kGoalCellId bundle:nil] forCellReuseIdentifier:kGoalCellId];

	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 44;

	self.commandBoxViewContainer.layer.cornerRadius = 2.0f;
	self.commandBoxViewContainer.layer.masksToBounds = YES;
	self.commandBoxViewContainer.layer.borderColor = [UIColor colorWithHexString:@"#666666"].CGColor;
	self.commandBoxViewContainer.layer.borderWidth = 1.0f;

	UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panningGesture:)];
	[self.commandTextField addGestureRecognizer:panGesture];
	self.upcomingActionButton.enabled = NO;
	self.upcomingMainActions = nil;
}

- (void)panningGesture:(UIPanGestureRecognizer*)panGR
{
	CGPoint translationPoint = [panGR translationInView:self.view];
	if (translationPoint.y > 0) {
		switch (panGR.state) {
		case UIGestureRecognizerStateBegan:
			NSLog(@"UIGestureRecognizerStateBegan %@", NSStringFromCGPoint(translationPoint));
			break;
		case UIGestureRecognizerStateChanged:
			NSLog(@"UIGestureRecognizerStateChanged %@", NSStringFromCGPoint(translationPoint));
			if (self.parentViewController && [self.parentViewController conformsToProtocol:@protocol(PRECommandViewControllerDelegate)]) {
				id pvcontroller = self.parentViewController;
				[pvcontroller changeCommandViewControllerPosition:translationPoint.y];
			}
			break;
		case UIGestureRecognizerStateEnded:
			NSLog(@"UIGestureRecognizerStateEnded %@", NSStringFromCGPoint(translationPoint));
			if (self.parentViewController && [self.parentViewController conformsToProtocol:@protocol(PRECommandViewControllerDelegate)]) {
				if (translationPoint.y > SCREEN_HEIGHT / 4) {
					[self closeCommandBox];
				} else {
					[self openCommandBox];
				}
			}
			break;

		default:
			break;
		}
	}
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
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

- (IBAction)commandButtonClicked:(id)sender
{
	if (self.baCommandArray.count > 0) {
		NSPredicate* predicateTitle = [NSPredicate predicateWithFormat:@"SELF.title contains[cd] %@", self.commandTextField.text];
		NSArray* resultArray = [self.baCommandArray filteredArrayUsingPredicate:predicateTitle];
		if (resultArray.count > 0) {
			PREBACommand* baCommand = resultArray.firstObject;
			[self createActionWithCommand:baCommand];
			[self closeCommandBox];
			return;
		}
	}
	//in case we do not have the command
	[self createActionWithFreeText:self.commandTextField.text];
	[self closeCommandBox];
}

- (void)createActionWithCommand:(PREBACommand*)baCommand
{
	switch (self.commandBoxOption) {
	case mainActionCommandBoxOption: {
		[[PRELocalAppRequestManager sharedInstance] createMainAction:baCommand
													 withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
														 if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(refreshList)]) {
															 [self.parentViewController performSelector:@selector(refreshList)];
														 }
													 }];
	} break;
	case actionCommandBoxOption: {
		[[PRELocalAppRequestManager sharedInstance] createAction:baCommand
												 withResultBlock:^(ResultRequestStatus status, PREAction* action) {
													 if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(refreshList)]) {
														 [self.parentViewController performSelector:@selector(refreshList)];
													 }
												 }];
	} break;
	}
}

- (void)createActionWithFreeText:(NSString*)freeText
{
	switch (self.commandBoxOption) {
	case mainActionCommandBoxOption: {
		[[PRELocalAppRequestManager sharedInstance] createMainActionWithFreeText:freeText
																 withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
																	 if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(refreshList)]) {
																		 [self.parentViewController performSelector:@selector(refreshList)];
																	 }
																 }];
	} break;
	case actionCommandBoxOption: {
		[[PRELocalAppRequestManager sharedInstance] createActionWithFreeText:freeText
															 withResultBlock:^(ResultRequestStatus status, PREAction* action) {
																 if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(refreshList)]) {
																	 [self.parentViewController performSelector:@selector(refreshList)];
																 }
															 }];
	} break;
	}
}

- (void)closeCommandBox
{
	self.actionWorkplaceOntologyConcepts = nil;
	self.filteredActionWorkplaceOntologyConcepts = nil;
	self.commandTextField.text = @"";
	self.commandButton.enabled = NO;
	self.upcomingActionButton.enabled = NO;
	[self.commandTextField resignFirstResponder];
}

- (void)openCommandBox
{
	if (self.commandTextField.isFirstResponder) {
		if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(extendCommandViewController)]) {
			[self.parentViewController performSelector:@selector(extendCommandViewController)];
		}
	} else {
		[self.commandTextField becomeFirstResponder];
	}
}

- (void)loadActionWorkplaceOntologyConcepts:(NSArray<PREGroup*>*)actionWorkplaceOntologyConcepts
					withUpcomingMainActions:(NSArray<PREMainAction*>*)upcomingMainActions
					   withCommandBoxOption:(CommandBoxOption)commandBoxOption
{
	self.actionWorkplaceOntologyConcepts = actionWorkplaceOntologyConcepts;
	self.filteredActionWorkplaceOntologyConcepts = actionWorkplaceOntologyConcepts;
	self.originalWorkplaceOntologyConcepts = actionWorkplaceOntologyConcepts;
	self.commandBoxOption = commandBoxOption;
	self.upcomingMainActions = upcomingMainActions;
	[self.tableView reloadData];
}

#pragma mark - textField IBAction

- (IBAction)textFieldDidChange:(id)sender
{
	self.baCommandArray = nil;
	if (self.upcomingMainActions.count > 0) {
		self.upcomingActionButton.enabled = YES;
	}
	if (self.commandTextField.text.length == 0) {
		self.commandButton.enabled = NO;
		self.actionWorkplaceOntologyConcepts = self.originalWorkplaceOntologyConcepts;
		self.filteredActionWorkplaceOntologyConcepts = self.originalWorkplaceOntologyConcepts;
		[self.tableView reloadData];
		return;
	}
	self.commandButton.enabled = YES;
	self.filteredActionWorkplaceOntologyConcepts = [self arrayFromArray:self.actionWorkplaceOntologyConcepts filteredBy:self.commandTextField.text];
	if (self.filteredActionWorkplaceOntologyConcepts.count > 1 || (self.filteredActionWorkplaceOntologyConcepts.count == 1 && ![self.filteredActionWorkplaceOntologyConcepts[0].title isEqualToStringCaseInsensitive:self.commandTextField.text])) {
		[self.tableView reloadData];
	} else {
		[[PRELocalAppRequestManager sharedInstance] getCommandsWithText:self.commandTextField.text
														 andResultBlock:^(ResultRequestStatus status, NSArray<PREBACommand*>* baCommandsArray) {
															 if (status == ResultRequestStatusSuccess) {
																 if (baCommandsArray.count > 0) {
																	 self.baCommandArray = baCommandsArray;
																	 self.actionWorkplaceOntologyConcepts = [self arrayFromArray:baCommandsArray];
																	 self.filteredActionWorkplaceOntologyConcepts = [self arrayFromArray:baCommandsArray];
																	 self.commandButton.enabled = YES;
																 } else {
																	 self.actionWorkplaceOntologyConcepts = self.originalWorkplaceOntologyConcepts;
																	 self.filteredActionWorkplaceOntologyConcepts = [self arrayFromArray:self.actionWorkplaceOntologyConcepts filteredBy:self.commandTextField.text];
																 }
																 [self.tableView reloadData];
															 }
														 }];
	}
}

#pragma mark - button IBAction

- (IBAction)upcomingMainActionsPushed:(id)sender
{
	if (self.upcomingMainActions.count > 0) {
		self.displayUpcomingMainActions = !self.displayUpcomingMainActions;
		[self.tableView reloadData];
	}
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField
{
	if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(extendCommandViewController)]) {
		[self.parentViewController performSelector:@selector(extendCommandViewController)];
	}
	[self loadActionWorkplaceOntologyConcepts:self.originalWorkplaceOntologyConcepts
					  withUpcomingMainActions:self.upcomingMainActions
						 withCommandBoxOption:self.commandBoxOption];

	if (self.upcomingMainActions.count > 0) {
		self.upcomingActionButton.enabled = YES;
	}
	// return NO to disallow editing.
	return YES;
}
- (void)textFieldDidEndEditing:(UITextField*)textField
{
	if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(compactCommandViewController)]) {
		[self.parentViewController performSelector:@selector(compactCommandViewController)];
	}
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.displayUpcomingMainActions ? self.upcomingMainActions.count : self.filteredActionWorkplaceOntologyConcepts.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	if (self.displayUpcomingMainActions) {
		PREGoalTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kGoalCellId];

		PREMainAction* mainAction = self.upcomingMainActions[indexPath.row];
		cell.mainAction = mainAction;
		cell.actionButtonDelegate = self;

		return cell;
	}
	UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellId"];
	cell.textLabel.text = self.filteredActionWorkplaceOntologyConcepts[indexPath.row].title;
	return cell;
}

//- (nullable NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
//{
//	//TODO: To define
//	switch (section) {
//	case 0:
//		return @"Suggestions (To Define)";
//	default:
//		return @"Possible Actions (To Define)";
//	}
//}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	if (self.displayUpcomingMainActions) {
		PREMainAction* mainAction = self.upcomingMainActions[indexPath.row];
		PREActionDetailsViewController* actionDetailsViewController = [[PREActionDetailsViewController alloc] initWithNibName:@"PREContentSelectorViewController" bundle:nil];
		actionDetailsViewController.mainActionId = mainAction.id;
		actionDetailsViewController.viewType = mainActionViewType;
		actionDetailsViewController.delegate = self;
		[self.navigationController pushViewController:actionDetailsViewController animated:YES];
		[tableView deselectRowAtIndexPath:indexPath animated:YES];
	} else {
		self.commandTextField.text = self.filteredActionWorkplaceOntologyConcepts[indexPath.row].title;
		[self textFieldDidChange:nil];
	}
}

#pragma mark -  keyboard interaction functions

- (void)keyboardWasShown:(NSNotification*)aNotification
{
	NSDictionary* info = [aNotification userInfo];
	NSValue* keyboardFrameBegin = [info valueForKey:UIKeyboardFrameEndUserInfoKey];
	CGSize kbSize = [keyboardFrameBegin CGRectValue].size;
	CGFloat insetKeyboardHeight = kbSize.height;
	if (self.tabBarController.tabBar.frame.size.height > 0) {
		insetKeyboardHeight = insetKeyboardHeight - self.tabBarController.tabBar.frame.size.height;
	}

	UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, insetKeyboardHeight, 0.0);
	self.tableView.contentInset = contentInsets;
	self.tableView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
	UIEdgeInsets contentInsets = UIEdgeInsetsZero;
	self.tableView.contentInset = contentInsets;
	self.tableView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - util functions

- (NSArray<PREGroup*>*)arrayFromArray:(NSArray<PREGroup*>*)originalArray filteredBy:(NSString*)filter
{
	NSPredicate* predicateTitle = [NSPredicate predicateWithFormat:@"SELF.title contains[cd] %@", filter];
	if (filter.length > 0) {
		return [originalArray filteredArrayUsingPredicate:predicateTitle];
	}
	return originalArray;
}

- (NSArray<PREGroup*>*)arrayFromArray:(NSArray<PREBACommand*>*)originalArray
{
	NSMutableArray* mutableArray = [NSMutableArray new];
	[originalArray enumerateObjectsUsingBlock:^(PREBACommand* _Nonnull baCommand, NSUInteger idx, BOOL* _Nonnull stop) {
		PREGroup* group = [PREGroup new];
		group.title = baCommand.title;
		group.id = baCommand.id;
		[mutableArray addObject:group];
	}];
	return mutableArray;
}

#pragma mark - PREActionButtonDelegate fucntions

- (void)didSelectOptionAtIndex:(NSInteger)actionIndex forCellAtIndexPath:(NSIndexPath*)indexPath
{
	PREMainAction* mainAction = self.upcomingMainActions[indexPath.row];
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

#pragma mark - PRERefreshTableViewProtocol

- (void)refreshList
{
	if (self.displayUpcomingMainActions) {
		if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(refreshList)]) {
			[self.parentViewController performSelector:@selector(refreshList)];
		}
	}
}

@end
