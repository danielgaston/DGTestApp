//
//  PREGoalContentTableViewCell.h
//  Pre
//

#import "PREAction.h"
#import <UIKit/UIKit.h>

@interface PREGoalContentTableViewCell : PREParentBaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView* fileImageView;
@property (weak, nonatomic) IBOutlet UIButton* fileButton;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* subtitleLabel;

@property (nonatomic, strong) NSArray<PREAction*>* actionArray;

@end
