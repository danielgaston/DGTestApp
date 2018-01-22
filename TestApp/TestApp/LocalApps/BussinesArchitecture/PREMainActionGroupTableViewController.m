//
//  PREMainActionGroupTableViewController.m
//  Pre
//

#import "PREMainActionGroupTableViewController.h"
#import "BaseTableSection.h"
#import "PREContentSelectorViewController.h"

@interface PREMainActionGroupTableViewController ()

@end

@implementation PREMainActionGroupTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	//	[self manageTableViewHeader];
	self.tableView.tableHeaderView.backgroundColor = [UIColor purpleColor];
	if (self.parentViewController && [self.parentViewController respondsToSelector:@selector(setHiddenSegmentedControl:)]) {
		[(PREContentSelectorViewController*)self.parentViewController setHiddenSegmentedControl:YES];
	}
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
	return self.mainActionGroups.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.mainActionGroups[section].mainActions.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"simpleCell"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"simpleCell"];
	}
	[cell.imageView setImage:[[PREImageManager sharedInstance] localImageNamed:@"error_icon_default"]]; //harcoded icon as server sends then in svg
	cell.textLabel.text = ((PREMainAction*)self.mainActionGroups[indexPath.section].mainActions[indexPath.row]).title;
	cell.detailTextLabel.text = ((PREMainAction*)self.mainActionGroups[indexPath.section].mainActions[indexPath.row]).subtitle;

	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark helper fucntion

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

@end
