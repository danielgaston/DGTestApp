//
//  PRESimpleFormViewController.m
//  Pre
//
#import "PRESimpleFormViewController.h"
#import "PREAlertManager.h"
#import "PRELocalAppRequestManager.h"
#import "PREToolbar.h"

CGFloat const kDefaultToolbarHeight = 44.0;

@interface PRESimpleFormViewController ()

@end

@implementation PRESimpleFormViewController

@dynamic dataModel;

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	if (self.command) {
		[[PRELocalAppRequestManager sharedInstance] createAction:self.command
												 withResultBlock:^(ResultRequestStatus status, PREAction* action) {
													 if (status == ResultRequestStatusSuccess) {
														 //Adding footer to the table
														 self.tableView.tableFooterView = [self completeToolbarWithCommands:action.form.itemTemplate.commands];
														 //title
														 self.title = action.title;
														 //creating agnostic form
														 PREForm* form = action.form;
														 AgnosticForm* agnosticForm = [AgnosticForm initWithDictionary:[form toDictionary]];
														 if (action.form.itemTemplate.commands.count > 0) {
															 agnosticForm.currentMode = @"edit";
														 }
														 //initializing datamodel with form
														 self.dataModel = [ObjectEditorDM initWithBaseObject:agnosticForm];
														 [self.tableView reloadData];
													 }
												 }];
	}
}

- (PREToolbar*)completeToolbarWithCommands:(NSArray<PRECommand*>*)commandArray
{
	if (commandArray.count > 0) {
		PREToolbar* buttonsToolbar = [[PREToolbar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, kDefaultToolbarHeight)];
		NSMutableArray* barButtonArray = [NSMutableArray new];
		[barButtonArray addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
		for (PRECommand* command in commandArray) {
			PREUserDataBarButtonItem* barButtomItem = [[PREUserDataBarButtonItem alloc] initWithTitle:command.title style:UIBarButtonItemStylePlain target:self action:@selector(performBarButtonAction:)];
			barButtomItem.userData = [command toDictionary];
			//special case: test save and reject on navigation bar.
			if ([command.command.lowercaseString isEqualToString:@"cancel"]) {
				[barButtomItem setTitle:NSLocalizedString(@"Cancel", nil)];
				self.navigationItem.leftBarButtonItem = barButtomItem;
			} else if ([command.command.lowercaseString isEqualToString:@"form-save-link"]) {
				[barButtomItem setTitle:NSLocalizedString(@"Done", nil)];
				self.navigationItem.rightBarButtonItem = barButtomItem;
			} else {
				[barButtonArray addObject:barButtomItem];
				[barButtonArray addObject:[[PREUserDataBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
			}
		}
		if (barButtonArray.count > 0) {
			[buttonsToolbar setItems:barButtonArray];
			[buttonsToolbar addBottomBorder];

			return buttonsToolbar;
		}
	}
	return nil;
}

- (void)performBarButtonAction:(id)sender
{
	if ([sender isKindOfClass:[PREUserDataBarButtonItem class]]) {
		PREUserDataBarButtonItem* barButtonItem = sender;
		NSError* error;
		PRECommand* command = [[PRECommand alloc] initWithDictionary:barButtonItem.userData error:&error];
		if ([command.command.lowercaseString isEqualToString:@"form-save-link"]) {
			[self saveCurrentAgnosticForm];
		} else if ([command.command.lowercaseString isEqualToString:@"cancel"]) {
			[self.navigationController popViewControllerAnimated:YES];
		}
	}
}

- (void)saveCurrentAgnosticForm
{
	NSString* postBodyString = [self composeFormJson];
	NSError* error;
	PREForm* form = [[PREForm alloc] initWithString:postBodyString error:&error];
	if (!error) {
		[[PRELocalAppRequestManager sharedInstance] postSaveForm:form
												  andResultBlock:^(ResultRequestStatus status, PREForm* updatedform) {
													  if (status == ResultRequestStatusSuccess) {
														  [self.navigationController popViewControllerAnimated:YES];
													  } else {
														  [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
															  data.title = NSLocalizedString(@"Error", nil);
															  data.message = NSLocalizedString(@"There has been an error when trying to save data on server. Please contact the administrator", nil);
														  }];
													  }
												  }];
	}
}

@end
