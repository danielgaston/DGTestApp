//
//  PREComplianceTableViewCell.m
//  Pre
//

#import "PREComplianceTableViewCell.h"
#import "PREAlertManager.h"
#import "PREBAObject.h"
#import "PRELocalAppManager.h"
#import "PRELocalAppRequestManager.h"

NSString* const kSolveComplianceMenuOptionId = @"solve";
NSString* const kDetailsComplianceMenuOptionId = @"details";
NSString* const kOverrideComplianceMenuOptionId = @"override";
NSString* const kEditComplianceMenuOptionId = @"edit";

@interface PREComplianceTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView* complianceImageView;
@property (weak, nonatomic) IBOutlet UILabel* complianceLabel;

//if you want to display the image change those 2 constraint priorities
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageLabelDistanceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* labelLeadingConstraint;

@end

@implementation PREComplianceTableViewCell

- (void)setMainAction:(PREMainAction*)mainAction
{
	_mainAction = mainAction;

	UIButton* actionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[actionsButton setImage:[[PREImageManager sharedInstance] localImageNamed:@"more_icon_vert_default" useThemes:YES useTintColor:self.accessoryViewColor] forState:UIControlStateNormal];
	actionsButton.frame = CGRectMake(0, 0, kCustomAccessoryViewWidth, kCustomAccessoryViewHeight);
	[actionsButton addTarget:self action:@selector(actionsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	self.accessoryView = actionsButton;

	self.complianceLabel.text = self.mainAction.title;
	self.complianceImageView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}

- (void)actionsButtonClicked:(id)sender
{
	if ([PRELocalAppManager sharedInstance].initialData) {
		if ([PRELocalAppManager sharedInstance].initialData.complianceMenu) {
			[PREAlertManager displayActionSheetWithData:^(PREAlertManagerData* data) {
				data.title = @"Compliance options";
				[[PRELocalAppManager sharedInstance].initialData.complianceMenu enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
					PREBAObject* baObject = obj;
					[data addButtonWithTitle:baObject.title
								   andAction:^{
									   [self processOption:baObject];
								   }];
				}];
				[data addCancelButtonWithAction:nil];
			}];
		}
	}
}

- (void)processOption:(PREBAObject*)baObject
{
	if ([baObject.id isEqualToString:kSolveComplianceMenuOptionId]) {

	} else if ([baObject.id isEqualToString:kDetailsComplianceMenuOptionId]) {

	} else if ([baObject.id isEqualToString:kOverrideComplianceMenuOptionId]) {

	} else if ([baObject.id isEqualToString:kEditComplianceMenuOptionId]) {
		PREBACommand* baCommand = [PREBACommand new];
		baCommand.mainAction = self.mainAction;
		baCommand.id = baObject.id;
		baCommand.title = baObject.title;
		[[PRELocalAppRequestManager sharedInstance] createMainAction:baCommand
													 withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
														 NSLog(@"createMainAction:withResultBlock:");
													 }];
	}
}

@end
