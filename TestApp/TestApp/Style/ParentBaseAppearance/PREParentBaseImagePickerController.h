//
//  PREParentBaseImagePickerController.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseImagePickerController : UIImagePickerController <PREParentBaseImagePickerControllerAppearanceProtocol>
@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIStatusBarStyle customStatusBarStyle PRE_APPEARANCE_SELECTOR;

+ (id)appearance;
@end
