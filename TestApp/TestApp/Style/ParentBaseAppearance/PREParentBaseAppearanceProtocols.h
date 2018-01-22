//
//  PREParentBaseAppearanceProtocols.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREAppearance.h"
#import "PREColor.h"

#ifndef PREParentBaseAppearanceProtocols_h
#define PREParentBaseAppearanceProtocols_h

// REUSABLE PROTOCOL DEFINITION --------------------------------------------------------------------------------------

@protocol PREParentBaseAppearanceProtocol
@required

@property (nonatomic, strong) PREColor* baseColor PRE_APPEARANCE_SELECTOR;

@end

@protocol PREParentBaseTextAppearanceProtocol
@required

@property (nonatomic, strong) PREColor* titleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* principalTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* descriptionTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* emptyTextColor PRE_APPEARANCE_SELECTOR;

@end

@protocol PREParentBaseSupportColorAppearanceProtocol
@required

@property (nonatomic, strong) PREColor* supportDefaultButtonColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* supportDeleteButtonColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* supportInfoButtonColor PRE_APPEARANCE_SELECTOR;

@end

@protocol PREParentBaseNavigationBarAppearanceProtocol
@required

@property (nonatomic, strong) PREColor* navigationBarColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, assign) BOOL navigationBarTransparency PRE_APPEARANCE_SELECTOR;

@end

@protocol PREParentBaseNavigationSearchBarAppearanceProtocol
@required

@property (nonatomic, strong) PREColor* navigationSearchBarBackgroundColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarBorderColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarButtonTintColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* navigationSearchBarTextColor PRE_APPEARANCE_SELECTOR;

@end

@protocol PREParentBaseStatusBarAppearanceProtocol
@required

@property (nonatomic, assign) UIStatusBarStyle customStatusBarStyle PRE_APPEARANCE_SELECTOR;

@end

// PROTOCOL COMPOSITION ----------------------------------------------------------------------------------------------

@protocol PREParentBaseViewControllerAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol, PREParentBaseNavigationBarAppearanceProtocol, PREParentBaseNavigationSearchBarAppearanceProtocol, PREParentBaseStatusBarAppearanceProtocol>
@end


@protocol PREParentBaseTableViewControllerAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol, PREParentBaseNavigationBarAppearanceProtocol, PREParentBaseStatusBarAppearanceProtocol>
@required

@property (nonatomic, strong) PREColor* separatorColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* sectionBackgroundColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* sectionTextColor PRE_APPEARANCE_SELECTOR;

@end


@protocol PREParentBaseSplitViewControllerAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol, PREParentBaseNavigationBarAppearanceProtocol, PREParentBaseStatusBarAppearanceProtocol>
@end

@protocol PREParentBaseAlertViewControllerAppearanceProtocol <PREAppearance>
@required
// Info: changing the background color for the cancel action button is not supported in the xcode library. There are hacks to colour our custom action buttons block, but there is no point to have heterogenous colors there, so that PREParentBaseAppearanceProtocol is not necessary.
@property (nonatomic, strong) PREColor* alertTitleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* alertSubtitleTextColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* defaultActionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* cancelActionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* destructiveActionColor PRE_APPEARANCE_SELECTOR;

@end


@protocol PREParentBaseTableViewCellAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol, PREParentBaseSupportColorAppearanceProtocol>
@required

@property (nonatomic, strong) PREColor* baseSelectionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* accessoryViewColor PRE_APPEARANCE_SELECTOR;

@end


@protocol PREParentBaseCollectionViewCellAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol, PREParentBaseSupportColorAppearanceProtocol>
@required

@property (nonatomic, strong) PREColor* baseSelectionColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* accessoryViewColor PRE_APPEARANCE_SELECTOR;

@end

@protocol PREParentBaseCollectionReusableViewAppearanceProtocol <PREAppearance>
@required

@property (nonatomic, strong) PREColor* headerBackgroundColor PRE_APPEARANCE_SELECTOR;
@property (nonatomic, strong) PREColor* headerTextColor PRE_APPEARANCE_SELECTOR;

@end


@protocol PREParentBaseNavigationControllerAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol>
@end


@protocol PREParentBaseImagePickerControllerAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseStatusBarAppearanceProtocol>
@end


@protocol PREParentBaseTableViewSectionViewAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol>
@required
@property (nonatomic, strong) PREColor* accessoryViewColor PRE_APPEARANCE_SELECTOR;
@end


@protocol PREParentBaseTableViewHeaderViewAppearanceProtocol <PREAppearance, PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol>
@end


@protocol PREParentBaseTableViewFooterViewAppearanceProtocol <PREAppearance,  PREParentBaseAppearanceProtocol, PREParentBaseTextAppearanceProtocol>
@end



#endif /* PREParentBaseAppearanceProtocols_h */
