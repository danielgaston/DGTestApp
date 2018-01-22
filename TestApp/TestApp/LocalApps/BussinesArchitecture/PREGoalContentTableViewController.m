//
//  PREGoalContentTableViewController.m
//  Pre
//

#import "PREGoalContentTableViewController.h"
#import "PREAlertManager.h"
#import "PREGoalContentTableViewCell.h"
#import "PRELocalAppRequestManager.h"

static NSString* kContentCellId = @"PREGoalContentTableViewCell";

@interface PREGoalContentTableViewController ()

@property (nonatomic, strong) PREActionWorkplace* actionWorkplace;

@end

@implementation PREGoalContentTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.tableView registerNib:[UINib nibWithNibName:kContentCellId bundle:nil] forCellReuseIdentifier:kContentCellId];

	self.tableView.estimatedRowHeight = 75;
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	[self.tableView setSeparatorInset:UIEdgeInsetsZero];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[[PRELocalAppRequestManager sharedInstance] getContentForGoalId:self.goalId
													withResultBlock:^(ResultRequestStatus status, PREActionWorkplace* actionWorkplace) {
														if (status == ResultRequestStatusSuccess) {
															self.actionWorkplace = actionWorkplace;
															[self.tableView reloadData];
														} else {
															[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
																data.title = NSLocalizedString(@"Error", nil);
																data.message = NSLocalizedString(@"contentError", nil);
																[data addButtonWithTitle:NSLocalizedString(@"Ok", nil)
																			   andAction:^{
																				   [self.navigationController popViewControllerAnimated:YES];
																			   }];
															}];
														}
													}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
	return self.actionWorkplace.mainActionGroups.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return ((PREMainActionGroup*)self.actionWorkplace.mainActionGroups[section]).mainActions.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	PREGoalContentTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kContentCellId forIndexPath:indexPath];
	PREMainAction* mainAction = ((PREMainActionGroup*)self.actionWorkplace.mainActionGroups[indexPath.section]).mainActions[indexPath.row];

	cell.titleLabel.text = mainAction.title;
	cell.subtitleLabel.text = mainAction.subtitle;
	[cell.fileButton setTitle:[[mainAction.title pathExtension] uppercaseString] forState:UIControlStateNormal];
	cell.actionArray = mainAction.actions;

	return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	PREMainAction* mainAction = ((PREMainActionGroup*)self.actionWorkplace.mainActionGroups[indexPath.section]).mainActions[indexPath.row];
	[[PRELocalAppRequestManager sharedInstance] getContentBinaryForId:mainAction.id fromViewController:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
