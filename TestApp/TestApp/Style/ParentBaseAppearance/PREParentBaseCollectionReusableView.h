//
//  PREParentBaseCollectionReusableView.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseCollectionReusableView : UICollectionReusableView <PREParentBaseCollectionReusableViewAppearanceProtocol>

@property (nonatomic, strong) PREColor* headerBackgroundColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* headerTextColor PRE_APPEARANCE_SELECTOR;

+ (id)appearance;

@end
