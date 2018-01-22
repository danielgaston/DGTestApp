//
//  PREGoalTableViewCell.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREGoalTableViewCell.h"
#import "PREAlertManager.h"
#import "PRELocalAppRequestManager.h"
#import "UIImage+Utils.h"
#import "UIImageView+webimage.h"

@interface PREGoalTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView* profileImageView;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UIButton* moreActionsButton;
@property (weak, nonatomic) IBOutlet UILabel* timeLabel;
@property (weak, nonatomic) IBOutlet UIButton* showSubActionsButton;
@property (weak, nonatomic) IBOutlet UIStackView* stackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* actionTopSeparatorLineViewHeightConstraint;

@property (nonatomic, strong) NSMutableArray<UIView*>* subActionViews;
@property (nonatomic, assign) BOOL showSubActions;
@property (nonatomic, strong) NSArray<PREAction*>* subActions;
@end

@implementation PREGoalTableViewCell

- (void)awakeFromNib
{
	[super awakeFromNib];
	self.profileImageView.layer.cornerRadius = 25;
	self.profileImageView.clipsToBounds = YES;
	self.stackView.arrangedSubviews.lastObject.hidden = YES;
	self.subActionViews = [NSMutableArray new];
	self.showSubActionsButton.hidden = YES;
	self.actionTopSeparatorLineViewHeightConstraint.constant = 1.f / [UIScreen mainScreen].scale; //enforces it to be a true 1 pixel line
	[self.moreActionsButton setImage:[[PREImageManager sharedInstance] localImageNamed:@"more_icon_vert_default" useThemes:YES useTintColor:self.accessoryViewColor] forState:UIControlStateNormal];

	[self composeSubActionsButton];
}

- (void)setMainAction:(PREMainAction*)mainAction
{
	_mainAction = mainAction;

	self.titleLabel.text = mainAction.title;
	self.timeLabel.text = mainAction.dateTimeInfo;
	self.subActions = mainAction.actions;

	if (self.subActionViews.count == 0 && self.subActions.count > 0) {
		[self composeSubActionViews];
	}

	[self.profileImageView setImageFromURL:[[PRELocalAppRequestManager sharedInstance] resolveImageURL:mainAction.icon] placeholderImage:[UIImage new]];
}

- (void)setAction:(PREAction*)action
{
	_action = action;
	self.titleLabel.text = action.title;
}

- (void)composeSubActionViews
{

	for (PREAction* subAction in self.subActions) {
		UILabel* subActionLabel = [UILabel new];
		subActionLabel.text = subAction.title;
		[subActionLabel sizeToFit];
		subActionLabel.hidden = YES;
		subActionLabel.backgroundColor = [UIColor whiteColor];
		subActionLabel.textAlignment = NSTextAlignmentCenter;
		[self.subActionViews addObject:subActionLabel];
	}

	self.showSubActionsButton.hidden = NO;
}

- (IBAction)toggleSubActions
{

	self.showSubActions = !self.showSubActions;

	UITableView* tableView = (UITableView*)self.superview.superview;
	[tableView beginUpdates];

	for (UIView* subActionView in self.subActionViews) {
		if (![self.stackView.arrangedSubviews containsObject:subActionView]) {
			[self.stackView addArrangedSubview:subActionView];
		}
		subActionView.hidden = !self.showSubActions;
	}

	[self composeSubActionsButton];

	[tableView endUpdates];
}

- (void)composeSubActionsButton
{
	NSString* chevronImage = self.showSubActions ? @"chevron_up_default" : @"chevron_down_default";
	NSString* buttonText = self.showSubActions ? @"Hide sub-actions" : @"Show sub-actions";
	[self.showSubActionsButton setTitle:buttonText forState:UIControlStateNormal];
	[self.showSubActionsButton setImage:[[PREImageManager sharedInstance] localImageNamed:chevronImage] forState:UIControlStateNormal];
	self.showSubActionsButton.tintColor = [UIColor grayColor];
}

- (IBAction)actionButtonClick:(id)sender
{
	[PREAlertManager displayActionSheetWithData:^(PREAlertManagerData* data) {
		data.title = @"Please select an option";
		[data addCancelButtonWithAction:nil];
		[data addButtonWithTitle:@"Set Reminder"
					   andAction:^{
						   if (self.actionButtonDelegate) {
							   [self.actionButtonDelegate didSelectOptionAtIndex:0 forCellAtIndexPath:self.indexPath];
						   }
					   }];

		[data addButtonWithTitle:@"Plan"
					   andAction:^{
						   if (self.actionButtonDelegate) {
							   [self.actionButtonDelegate didSelectOptionAtIndex:1 forCellAtIndexPath:self.indexPath];
						   }
					   }];

	}];
}

- (void)prepareForReuse
{
	[super prepareForReuse];
	for (UIView* subActionView in self.subActionViews) {
		[self.stackView removeArrangedSubview:subActionView];
	}

	self.subActionViews = [NSMutableArray new];

	self.showSubActionsButton.hidden = YES;
}

@end
