//
//  PREParentBaseViewController.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseViewController : UIViewController <PREParentBaseViewControllerAppearanceProtocol>

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIStatusBarStyle customStatusBarStyle PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationBarColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) BOOL navigationBarTransparency PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarBackgroundColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarBorderColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarButtonTintColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarTextColor PRE_APPEARANCE_SELECTOR;

+ (id)appearance;
- (void)setUpNavigationBarTransparencyAndColor;

@end
