//
//  PREParentBaseCollectionViewCell.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseCollectionViewCell : UICollectionViewCell <PREParentBaseCollectionViewCellAppearanceProtocol>

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* baseSelectionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;

@property (nonatomic, strong) PREColor* supportDefaultButtonColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* supportDeleteButtonColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* supportInfoButtonColor PRE_APPEARANCE_SELECTOR;

@property (nonatomic, strong) PREColor* accessoryViewColor PRE_APPEARANCE_SELECTOR;

+ (id)appearance;

@end
