//
//  PREGoalContentTableViewCell.m
//  Pre
//

#import "PREGoalContentTableViewCell.h"
#import "PREAlertManager.h"
#import "UIColor+HTMLColors.h"

@interface PREGoalContentTableViewCell ()

@end

@implementation PREGoalContentTableViewCell

- (void)awakeFromNib
{
	[super awakeFromNib];
	// Initialization code
	UIButton* actionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[actionsButton setImage:[[PREImageManager sharedInstance] localImageNamed:@"more_icon_vert_default" useThemes:YES useTintColor:self.accessoryViewColor] forState:UIControlStateNormal];
	actionsButton.frame = CGRectMake(0, 0, kCustomAccessoryViewWidth, kCustomAccessoryViewHeight);
	[actionsButton addTarget:self action:@selector(actionsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	self.accessoryView = actionsButton;
	self.fileImageView.backgroundColor = [UIColor colorWithHexString:@"#004080"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];

	if (selected) {
		self.fileImageView.backgroundColor = [UIColor colorWithHexString:@"#004080"];
	}
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
	if (highlighted) {
		self.fileImageView.backgroundColor = [UIColor colorWithHexString:@"#004055"];
	}
}

- (void)actionsButtonClicked:(id)event
{
	if (self.actionArray.count > 0) {
		[PREAlertManager displayActionSheetWithData:^(PREAlertManagerData* data) {
			[self.actionArray enumerateObjectsUsingBlock:^(PREAction* _Nonnull action, NSUInteger idx, BOOL* _Nonnull stop) {
				[data addButtonWithTitle:action.title
							   andAction:^{
								   [PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
									   data.title = NSLocalizedString(@"Alert", nil);
									   data.message = @"To be defined.";
								   }];
							   }];
			}];
			[data addCancelButtonWithAction:nil];
		}];
	} else {
		[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
			data.title = NSLocalizedString(@"Alert", nil);
			data.message = @"No actions";
		}];
	}
}

@end
