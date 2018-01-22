//
//  PREMainActionTableViewCell.m
//  Pre
//

#import "PREMainActionTableViewCell.h"
#import "PREAlertManager.h"

@implementation PREMainActionTableViewCell

- (void)awakeFromNib
{
	[super awakeFromNib];

	[self.actionButton setImage:[[PREImageManager sharedInstance] localImageNamed:@"more_icon_vert_default" useThemes:YES useTintColor:self.accessoryViewColor] forState:UIControlStateNormal];
}

- (IBAction)actionButtonClick:(id)sender
{
	[PREAlertManager displayActionSheetWithData:^(PREAlertManagerData* data) {
		data.title = @"Please select an option";
		[data addCancelButtonWithAction:nil];
		[data addButtonWithTitle:@"Open"
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

@end
