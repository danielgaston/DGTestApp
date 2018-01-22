//
//  PREParentBaseTableViewCell.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAppearanceProtocols.h"
#import "UIImageView+webimage.h"
#import <UIKit/UIKit.h>

@interface PREParentBaseTableViewCell : UITableViewCell <PREParentBaseTableViewCellAppearanceProtocol>

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
- (void)setRemoteImageWithURL:(NSURL*)imageURL;

@end
