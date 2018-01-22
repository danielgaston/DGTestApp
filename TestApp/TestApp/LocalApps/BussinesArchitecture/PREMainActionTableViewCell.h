//
//  PREMainActionTableViewCell.h
//  Pre
//

#import <UIKit/UIKit.h>

@protocol PREActionButtonDelegate <NSObject>

@required
- (void)didSelectOptionAtIndex:(NSInteger)actionIndex forCellAtIndexPath:(NSIndexPath*)indexPath;
@end

@interface PREMainActionTableViewCell : PREParentBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel* idLabel;
@property (weak, nonatomic) IBOutlet UIButton* actionButton;
@property (nonatomic, assign) id<PREActionButtonDelegate> actionButtonDelegate;
@property (nonatomic, strong) NSIndexPath* indexPath;
@end
