//
//  PREParentBaseSplitViewController.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseSplitViewController : UISplitViewController <UISplitViewControllerDelegate, PREParentBaseSplitViewControllerAppearanceProtocol>

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIStatusBarStyle customStatusBarStyle PRE_APPEARANCE_SELECTOR;

+ (id)appearance;

@end
