//
//  PREParentBaseAlertViewController.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseAlertViewController : UIAlertController <PREParentBaseAlertViewControllerAppearanceProtocol>

@property (nonatomic, strong) PREColor* alertTitleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* alertSubtitleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* defaultActionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* cancelActionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* destructiveActionColor PRE_APPEARANCE_SELECTOR;

+ (id)appearance;

@end
