//
//  PREActionDetailsViewController.m
//  Pre
//

#import "PREActionDetailsViewController.h"
#import "PREAlertManager.h"
#import "PREComplianceTableViewViewController.h"
#import "PREExpandableSection.h"
#import "PRELocalAppManager.h"
#import "PRELocalAppRequestManager.h"
#import "PREMainActionGroupTableViewController.h"
#import "PRESimpleFormViewController.h"
#import "SchemaManager.h"
#import "UIImage+Color.h"
@interface PREActionDetailsViewController ()

@property (nonatomic, strong) ObjectEditorDM* objectEditorDataModel;
@property (nonatomic, strong) PREMainAction* mainAction;
@property (nonatomic, strong) PREAction* action;
@property (nonatomic, strong) PREActivityDetailsViewController* objectEditorVC;

@property (nonatomic, strong) PREBACommand* editCommand;
@property (nonatomic, strong) PREBACommand* mailCommand;
@property (nonatomic, strong) PREBACommand* phoneCommand;
@property (nonatomic, strong) PREBACommand* twitterCommand;

@end

@implementation PREActionDetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
	if (self.mainActionId.length > 0) {

		switch (self.viewType) {
		case planGoalsViewType: {
			[[PRELocalAppRequestManager sharedInstance] getPlan:self.mainActionId
												withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
													if (status == ResultRequestStatusSuccess) {
														self.mainAction = mainAction;
														//creating agnostic form
														[self loadAgnosticFormFromMainAction:mainAction changeToEditMode:YES];
													} else {
														[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
															data.title = NSLocalizedString(@"Error", nil);
															data.message = NSLocalizedString(@"planGoalsError", nil);
														}];
													}
												}];
		} break;
		case goalsDetailsViewType: {
			[[PRELocalAppRequestManager sharedInstance] getGoalDetailsForGoalId:self.mainActionId
																withResultBlock:^(ResultRequestStatus status, PREForm* form) {
																	if (status == ResultRequestStatusSuccess) {
																		//creating agnostic form
																		[self loadAgnosticFormFromForm:form changeToEditMode:NO];
																	} else {
																		[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																			data.title = NSLocalizedString(@"Error", nil);
																			data.message = NSLocalizedString(@"goalDetails", nil);
																		}];
																	}
																}];
		} break;

		case mainActionViewType:
		default: {
			[[PRELocalAppRequestManager sharedInstance] getMainAction:self.mainActionId
													  withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
														  if (status == ResultRequestStatusSuccess) {
															  self.mainAction = mainAction;
															  //creating agnostic form
															  [self loadAgnosticFormFromMainAction:mainAction changeToEditMode:NO];
														  } else {
															  [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																  data.title = NSLocalizedString(@"Error", nil);
																  data.message = NSLocalizedString(@"mainActionError", nil);
															  }];
														  }
													  }];

			if (self.originMainActionId) {
				[[PRELocalAppRequestManager sharedInstance] getMainAction:self.originMainActionId
														  withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
															  if (status == ResultRequestStatusSuccess) {
																  NSMutableArray* toolbarButtonsArray = [NSMutableArray new];
																  [mainAction.utaCommands enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
																	  PREBACommand* baCommand = obj;
																	  if ([baCommand.id isEqualToString:@"edit"]) {
																		  self.editCommand = baCommand;
																		  [toolbarButtonsArray addObject:[[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_edit_icon_default"] style:UIBarButtonItemStyleDone target:self action:@selector(editMainAction:)]];
																	  }
																  }];
																  [mainAction.communicationCommands enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
																	  PREBACommand* baCommand = obj;
																	  if ([baCommand.id isEqualToString:@"email"]) {
																		  self.mailCommand = baCommand;
																		  [toolbarButtonsArray addObject:[[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_mail_icon_default"] style:UIBarButtonItemStyleDone target:self action:@selector(mailMainAction:)]];
																	  } else if ([baCommand.id isEqualToString:@"phone"]) {
																		  self.phoneCommand = baCommand;
																		  [toolbarButtonsArray addObject:[[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_phone_icon_default"] style:UIBarButtonItemStyleDone target:self action:@selector(phoneMainAction:)]];
																	  } else if ([baCommand.id isEqualToString:@"twitter"]) {
																		  self.twitterCommand = baCommand;
																		  [toolbarButtonsArray addObject:[[UIBarButtonItem alloc] initWithImage:[[PREImageManager sharedInstance] localImageNamed:@"ba_twitter_icon_default"] style:UIBarButtonItemStyleDone target:self action:@selector(twitterMainAction:)]];
																	  }
																  }];
																  if (toolbarButtonsArray.count > 0) {
																	  self.navigationItem.rightBarButtonItems = toolbarButtonsArray;
																  }
															  }
														  }];
			}

		} break;
		}
	} else if (self.actionId.length > 0) {
		switch (self.viewType) {
		case actionViewType:
		default: {
			[[PRELocalAppRequestManager sharedInstance] getAction:self.actionId
												  withResultBlock:^(ResultRequestStatus status, PREAction* action) {
													  if (status == ResultRequestStatusSuccess) {
														  self.action = action;
														  //creating agnostic form
														  [self loadAgnosticFormFromAction:action changeToEditMode:NO];
													  } else {
														  [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
															  data.title = NSLocalizedString(@"Error", nil);
															  data.message = NSLocalizedString(@"mainActionError", nil);
														  }];
													  }
												  }];

		} break;
		}
	}
}

- (void)loadAgnosticFormFromForm:(PREForm*)form changeToEditMode:(BOOL)editMode
{
	AgnosticForm* agnosticForm = [AgnosticForm initWithDictionary:[form toDictionary]];
	if (editMode) {
		agnosticForm.currentMode = @"edit";
	}

	//initializing datamodel with form
	self.objectEditorDataModel = [ObjectEditorDM initWithBaseObject:agnosticForm];
	PREContentSelectorDataModel* contentSelectorDataModel = [self parseSegmentedControlOptionsWithTitle:nil subtitle:nil];
	[self responseObjects:@[ contentSelectorDataModel ] forLink:nil];
}

- (void)loadAgnosticFormFromAction:(PREAction*)action changeToEditMode:(BOOL)editMode
{
	PREForm* form = action.form;
	AgnosticForm* agnosticForm = [AgnosticForm initWithDictionary:[form toDictionary]];
	if (editMode) {
		agnosticForm.currentMode = @"edit";
	}
	//initializing datamodel with form
	self.objectEditorDataModel = [ObjectEditorDM initWithBaseObject:agnosticForm];
	PREContentSelectorDataModel* contentSelectorDataModel = [self parseSegmentedControlOptionsWithTitle:action.title subtitle:nil];
	[self responseObjects:@[ contentSelectorDataModel ] forLink:nil];
}

- (void)loadAgnosticFormFromMainAction:(PREMainAction*)mainAction changeToEditMode:(BOOL)editMode
{
	PREForm* form = mainAction.form;
	AgnosticForm* agnosticForm = [AgnosticForm initWithDictionary:[form toDictionary]];
	if (editMode) {
		agnosticForm.currentMode = @"edit";
	}
	//initializing datamodel with form
	self.objectEditorDataModel = [ObjectEditorDM initWithBaseObject:agnosticForm];
	PREContentSelectorDataModel* contentSelectorDataModel = [self parseSegmentedControlOptionsWithTitle:mainAction.title subtitle:mainAction.subtitle];
	[self responseObjects:@[ contentSelectorDataModel ] forLink:nil];
}

- (void)responseObjects:(NSArray*)objects forLink:(Link*)link
{
	[super responseObjects:objects forLink:link];

	//used to skip/hide segmented control but loading one option
	if (self.viewType == goalsDetailsViewType) {
		__weak PREActionDetailsViewController* wSelf = self;
		self.executeBlockAfterViewDidAppear = ^{
			CellGroupDM* cellGroupDM = [[CellGroupDM alloc] init];
			cellGroupDM.name = NSLocalizedString(@"Details", nil);
			[wSelf loadViewInContainerWithcellGroupDM:cellGroupDM];
		};
	} else if (self.viewType == actionViewType) {
		__weak PREActionDetailsViewController* wSelf = self;
		self.executeBlockAfterViewDidAppear = ^{
			CellGroupDM* cellGroupDM = [[CellGroupDM alloc] init];
			cellGroupDM.name = @"";
			[wSelf loadViewInContainerWithcellGroupDM:cellGroupDM];
		};
	}
}

- (PREContentSelectorDataModel*)parseSegmentedControlOptionsWithTitle:(NSString*)title subtitle:(NSString*)subtitle
{
	PREContentSelectorDataModel* contentSelectorDataModel = [[PREContentSelectorDataModel alloc] init];
	if (title.length > 0) {
		HeaderDM* headerDM = [HeaderDM new];
		headerDM.name = title ?: @"";
		headerDM.subtitle = [[NSMutableAttributedString alloc] initWithString:subtitle ?: @""];
		NSMutableArray* cellGroups = [NSMutableArray new];
		if (self.viewType == mainActionViewType || self.viewType == planGoalsViewType || self.viewType == goalsDetailsViewType) {
			//Adding Details tab by default
			CellGroupDM* cellGroupDM = [[CellGroupDM alloc] init];
			cellGroupDM.name = NSLocalizedString(@"Details", nil);
			[cellGroups addObject:cellGroupDM];

			if ([PRELocalAppManager sharedInstance].initialData && [PRELocalAppManager sharedInstance].initialData.formMenu.count > 0) {
				[[PRELocalAppManager sharedInstance].initialData.formMenu enumerateObjectsUsingBlock:^(PREBAObject* _Nonnull baObject, NSUInteger idx, BOOL* _Nonnull stop) {
					CellGroupDM* cellGroupDM = [[CellGroupDM alloc] init];
					cellGroupDM.name = baObject.title;
					[cellGroups addObject:cellGroupDM];
				}];
			}
		} else if (self.viewType == actionViewType) {
			//cellGroups will be an emty array
		}
		contentSelectorDataModel.cellGroups = cellGroups;
		contentSelectorDataModel.headerDM = headerDM;
	}
	return contentSelectorDataModel;
}

- (void)loadViewInContainerWithcellGroupDM:(CellGroupDM*)cellGroupDM
{
	[self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView* _Nonnull view, NSUInteger idx, BOOL* _Nonnull stop) {
		[view removeFromSuperview];
	}];
	if (self.childViewControllers.count > 0) {
		[self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
			[obj willMoveToParentViewController:nil];
			[obj.view removeFromSuperview];
			[obj didMoveToParentViewController:nil];
			[obj removeFromParentViewController];
		}];
	}

	if ([cellGroupDM.name isEqualToString:NSLocalizedString(@"Details", nil)] && (self.viewType == goalsDetailsViewType || self.viewType == mainActionViewType || self.viewType == planGoalsViewType)) {
		if (self.objectEditorDataModel) { //this can happen on both cases (self.viewType == goalsDetailsViewType || self.viewType == actionViewType)
			self.objectEditorVC = [[PREActivityDetailsViewController alloc] init];
			self.objectEditorVC.dataModel = self.objectEditorDataModel;
			__weak PREActionDetailsViewController* wSelf = self;
			self.objectEditorVC.refreshProcessBlock = ^{
				[wSelf.objectEditorVC responseObjects:@[ wSelf.objectEditorDataModel ] forLink:nil];
			};
			[self constraintsTableAsChildViewController:self.objectEditorVC];
			self.objectEditorVC.view.translatesAutoresizingMaskIntoConstraints = NO;
			[self addChildViewController:self.objectEditorVC];
			[self.objectEditorVC willMoveToParentViewController:self];
			[self.containerView addSubview:self.objectEditorVC.view];

			[NSLayoutConstraint activateConstraints:@[ [self.objectEditorVC.view.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor], [self.objectEditorVC.view.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor], [self.objectEditorVC.view.topAnchor constraintEqualToAnchor:self.containerView.topAnchor], [self.objectEditorVC.view.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor] ]];

			[self.objectEditorVC didMoveToParentViewController:self];
		} else if (self.action.mainActionGroups.count > 0) { //this is just for self.viewType == actionViewType case
			PREMainActionGroupTableViewController* mainActionGroupTableViewController = [[PREMainActionGroupTableViewController alloc] initWithNibName:@"PREMainActionGroupTableViewController" bundle:nil];
			mainActionGroupTableViewController.mainActionGroups = self.action.mainActionGroups;

			[self addChildViewController:mainActionGroupTableViewController];
			[mainActionGroupTableViewController willMoveToParentViewController:self];
			[self.containerView addSubview:mainActionGroupTableViewController.view];

			mainActionGroupTableViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
			[NSLayoutConstraint activateConstraints:@[ [mainActionGroupTableViewController.view.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor], [mainActionGroupTableViewController.view.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor], [mainActionGroupTableViewController.view.topAnchor constraintEqualToAnchor:self.containerView.topAnchor], [mainActionGroupTableViewController.view.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor] ]];

			[mainActionGroupTableViewController didMoveToParentViewController:self];
		}
	} else if ([cellGroupDM.name isEqualToString:NSLocalizedString(@"Compliance", nil)]) {
		PREComplianceTableViewViewController* complianceTableViewController = [[PREComplianceTableViewViewController alloc] initWithNibName:@"PREComplianceTableViewViewController" bundle:nil];
		complianceTableViewController.mainActionId = self.mainActionId;
		[self addChildViewController:complianceTableViewController];
		[complianceTableViewController willMoveToParentViewController:self];
		[self.containerView addSubview:complianceTableViewController.view];

		complianceTableViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
		[NSLayoutConstraint activateConstraints:@[ [complianceTableViewController.view.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor], [complianceTableViewController.view.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor], [complianceTableViewController.view.topAnchor constraintEqualToAnchor:self.containerView.topAnchor], [complianceTableViewController.view.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor] ]];

		[complianceTableViewController didMoveToParentViewController:self];
	}
}

- (UIView*)headerView
{
	if (self.viewType != goalsDetailsViewType && self.viewType != actionViewType) {
		PREExpandableSection* expandableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"PREExpandableSection" owner:self options:nil] firstObject];
		//setting view width
		expandableHeaderView.frame = self.view.frame;
		NSArray<PRECommand*>* commandArray = self.mainAction.form.itemTemplate.commands;
		if (commandArray.count > 0) {
			[expandableHeaderView hideButtonsStackView:NO];
			//adding buttons on header view
			[commandArray enumerateObjectsUsingBlock:^(PRECommand* _Nonnull command, NSUInteger idx, BOOL* _Nonnull stop) {
				PREUserDataButton* button = [self buttonForCommand:command];
				[expandableHeaderView addButton:button];
			}];
		} else {
			[expandableHeaderView hideButtonsStackView:YES];
		}
		expandableHeaderView.titleLabel.text = self.mainAction.title;
		expandableHeaderView.descriptionLabel.text = self.mainAction.subtitle;
		//updating header view height according to label texts
		[expandableHeaderView updateHeight];
		return expandableHeaderView;
	}
	return nil;
}

- (PREUserDataButton*)buttonForCommand:(PRECommand*)command
{
	PREUserDataButton* button = [PREUserDataButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:command.title forState:UIControlStateNormal];

	button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	button.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];

	CGFloat buttonPadding = 3.0;

	[button setContentEdgeInsets:UIEdgeInsetsMake(buttonPadding, buttonPadding, buttonPadding, buttonPadding)];

	[button addTarget:self action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
	button.userData = [command toDictionary];

	button.layer.masksToBounds = YES;
	button.layer.cornerRadius = 5;
	button.layer.borderWidth = 1;

	return button;
}

- (void)performBarButtonAction:(id)sender
{
	if ([sender isKindOfClass:[PREUserDataButton class]]) {
		PREUserDataButton* button = sender;
		NSError* error;
		PRECommand* command = [[PRECommand alloc] initWithDictionary:button.userData error:&error];
		if ([command.command.lowercaseString isEqualToString:@"form-save-link"]) {
			[self saveCurrentAgnosticForm];
		} else if ([command.command.lowercaseString isEqualToString:@"cancel"]) {
			[self cancelCurrentAgnosticForm];
		}
	}
}

- (void)cancelCurrentAgnosticForm
{
	NSString* postBodyString = [self.objectEditorVC composeFormJson];
	NSError* error;
	PREForm* form = [[PREForm alloc] initWithString:postBodyString error:&error];
	if (!error) {
		[[PRELocalAppRequestManager sharedInstance] postCancelForm:form
													andResultBlock:^(ResultRequestStatus status, PREForm* updatedform) {
														if (status == ResultRequestStatusSuccess) {
															self.mainAction.form = updatedform;
															[self loadAgnosticFormFromMainAction:self.mainAction changeToEditMode:NO];
															//force to reload child view controllers
															if (self.executeBlockAfterViewDidAppear) {
																self.executeBlockAfterViewDidAppear();
																self.executeBlockAfterViewDidAppear = nil;
															}
															if (self.delegate) {
																[self.delegate refreshList];
															}
														} else {
															[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																data.title = NSLocalizedString(@"Error", nil);
																data.message = NSLocalizedString(@"cancelFormError", nil);
															}];
														}
													}];
	}
}

- (void)saveCurrentAgnosticForm
{
	NSString* postBodyString = [self.objectEditorVC composeFormJson];
	NSError* error;
	PREForm* form = [[PREForm alloc] initWithString:postBodyString error:&error];
	if (!error) {
		[[PRELocalAppRequestManager sharedInstance] postSaveForm:form
												  andResultBlock:^(ResultRequestStatus status, PREForm* updatedform) {
													  if (status == ResultRequestStatusSuccess) {
														  self.mainAction.form = updatedform;
														  [self loadAgnosticFormFromMainAction:self.mainAction changeToEditMode:NO];
														  //force to reload child view controllers
														  if (self.executeBlockAfterViewDidAppear) {
															  self.executeBlockAfterViewDidAppear();
															  self.executeBlockAfterViewDidAppear = nil;
														  }
														  if (self.delegate) {
															  [self.delegate refreshList];
														  }
													  } else {
														  [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
															  data.title = NSLocalizedString(@"Error", nil);
															  data.message = NSLocalizedString(@"saveFormError", nil);
														  }];
													  }
												  }];
	}
}

#pragma mark - Toolbar button actions

- (PREMainAction*)mainActionWithGoal
{
	PREGoal* goal = [[PREGoal alloc] init];
	goal.id = self.originGoalId;
	PREMainAction* mainAction = [[PREMainAction alloc] init];
	mainAction.id = self.originMainActionId;
	mainAction.goal = goal;
	return mainAction;
}

- (void)editMainAction:(id)sender
{
	self.editCommand.mainAction = [self mainActionWithGoal];
	PRESimpleFormViewController* simpleFormViewController = [[PRESimpleFormViewController alloc] init];
	simpleFormViewController.command = self.editCommand;
	[self.navigationController pushViewController:simpleFormViewController animated:YES];
}

- (void)mailMainAction:(id)sender
{
	self.mailCommand.mainAction = [self mainActionWithGoal];
	PRESimpleFormViewController* simpleFormViewController = [[PRESimpleFormViewController alloc] init];
	simpleFormViewController.command = self.mailCommand;
	[self.navigationController pushViewController:simpleFormViewController animated:YES];
}

- (void)phoneMainAction:(id)sender
{
	self.phoneCommand.mainAction = [self mainActionWithGoal];
	PRESimpleFormViewController* simpleFormViewController = [[PRESimpleFormViewController alloc] init];
	simpleFormViewController.command = self.phoneCommand;
	[self.navigationController pushViewController:simpleFormViewController animated:YES];
}

- (void)twitterMainAction:(id)sender
{
	self.twitterCommand.mainAction = [self mainActionWithGoal];
	PRESimpleFormViewController* simpleFormViewController = [[PRESimpleFormViewController alloc] init];
	simpleFormViewController.command = self.twitterCommand;
	[self.navigationController pushViewController:simpleFormViewController animated:YES];
}

@end
