//
//  PREParentBaseTableViewFooterView.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PREParentBaseAppearanceProtocols.h"

@interface PREParentBaseTableViewFooterView : UIView <PREParentBaseTableViewFooterViewAppearanceProtocol>

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;

+(id)appearance;

@end
