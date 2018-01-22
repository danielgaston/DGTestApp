//
//  PREParentBaseTableViewController.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseTableViewController : UITableViewController <PREParentBaseTableViewControllerAppearanceProtocol>

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* baseSelectionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* separatorColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* sectionBackgroundColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* sectionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIStatusBarStyle customStatusBarStyle PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationBarColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) BOOL navigationBarTransparency PRE_APPEARANCE_SELECTOR;
+ (id)appearance;
- (void)setUpNavigationBarTransparencyAndColor;

@end
