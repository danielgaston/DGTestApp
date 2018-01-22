//
//  PREParentBaseTableViewSectionView.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PREParentBaseAppearanceProtocols.h"

/****************************************************************************************
 UITableViewHeaderFooterView corresponds to a UITableView section. Apple misleading name.
 ****************************************************************************************/

@interface PREParentBaseTableViewSectionView : UITableViewHeaderFooterView <PREParentBaseTableViewSectionViewAppearanceProtocol>

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* borderColor PRE_APPEARANCE_SELECTOR;

@property (nonatomic, strong) PREColor* accessoryViewColor PRE_APPEARANCE_SELECTOR;

+(id)appearance;

@end
