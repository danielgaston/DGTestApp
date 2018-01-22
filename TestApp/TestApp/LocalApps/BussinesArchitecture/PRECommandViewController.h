//
//  PRECommandViewController.h
//  Pre
//

#import "PREGroup.h"
#import "PREMainAction.h"
#import "PREMainActionTableViewCell.h"
#import "PRERefreshTableViewProtocol.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CommandBoxOption) {
	mainActionCommandBoxOption = 0,
	actionCommandBoxOption
};

@interface PRECommandViewController : PREParentBaseViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, PREActionButtonDelegate, PRERefreshTableViewProtocol>

- (void)loadActionWorkplaceOntologyConcepts:(NSArray<PREGroup*>*)actionWorkplaceOntologyConcepts
					withUpcomingMainActions:(NSArray<PREMainAction*>*)upcomingMainActions
					   withCommandBoxOption:(CommandBoxOption)commandBoxOption;

@end

@protocol PRECommandViewControllerDelegate <NSObject>

@optional
- (void)extendCommandViewController;
- (void)compactCommandViewController;
- (void)changeCommandViewControllerPosition:(CGFloat)position;

@end
