//
//  PREThemeViewSettingsBlack.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeMainViewSettingsBlack.h"

@interface PREThemeMainViewSettingsBlack()

@property(nonatomic, strong) PREColor *palette0Color;
@property(nonatomic, strong) PREColor *palette10Color;
@property(nonatomic, strong) PREColor *palette20Color;
@property(nonatomic, strong) PREColor *palette30Color;
@property(nonatomic, strong) PREColor *palette40Color;
@property(nonatomic, strong) PREColor *palette50Color;
@property(nonatomic, strong) PREColor *palette60Color;
@property(nonatomic, strong) PREColor *palette70Color;
@property(nonatomic, strong) PREColor *palette80Color;
@property(nonatomic, strong) PREColor *palette90Color;
@property(nonatomic, strong) PREColor *palette100Color;
@property(nonatomic, strong) PREColor *baseColor;
@property(nonatomic, strong) PREColor *baseSelectionColor;
@property(nonatomic, strong) PREColor *titleTextColor;
@property(nonatomic, strong) PREColor *principalTextColor;
@property(nonatomic, strong) PREColor *descriptionTextColor;
@property(nonatomic, strong) PREColor *emptyTextColor;
@property(nonatomic, strong) PREColor *supportDefaultButtonColor;
@property(nonatomic, strong) PREColor *supportDeleteButtonColor;
@property(nonatomic, strong) PREColor *supportInfoButtonColor;
@property(nonatomic, strong) PREColor *clearColor;
@property(nonatomic, strong) PREColor *separatorColor;
@property(nonatomic, strong) PREColor *actionColor;
@property(nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property(nonatomic, strong) PREColor *navigationBarTintColor;
@property(nonatomic, strong) PREColor *accessoryViewColor;

@property(nonatomic, strong) PREColor *DEFAULT_COLOR;

@end

@implementation PREThemeMainViewSettingsBlack

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Black Views Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    // Dark Themes Palette -> Dark (0) to Light (100)  (CURRENT THEME)
    // Light Themes Palette -> Light (0) to Dark (100)
    self.palette0Color = isNullify ? nil : [PREColor blackColor];
    self.palette10Color = isNullify ? nil : [PREColor gray10Color];
    self.palette20Color = isNullify ? nil : [PREColor gray20Color];
    self.palette30Color = isNullify ? nil : [PREColor gray30Color];
    self.palette40Color = isNullify ? nil : [PREColor gray40Color];
    self.palette50Color = isNullify ? nil : [PREColor gray50Color];
    self.palette60Color = isNullify ? nil : [PREColor gray60Color];
    self.palette70Color = isNullify ? nil : [PREColor gray70Color];
    self.palette80Color = isNullify ? nil : [PREColor gray80Color];
    self.palette90Color = isNullify ? nil : [PREColor gray90Color];
    self.palette100Color = isNullify ? nil : [PREColor whiteColor];
    self.baseColor = isNullify ? nil : self.palette10Color;
    self.baseSelectionColor = isNullify ? nil : self.palette30Color;
    self.titleTextColor = isNullify ? nil : [PREColor corporateVikingBlue];
    self.principalTextColor = isNullify ? nil : self.palette80Color;
    self.descriptionTextColor = isNullify ? nil : self.palette70Color;
    self.emptyTextColor = isNullify ? nil : self.palette40Color;
    self.supportDefaultButtonColor = isNullify ? nil : [PREColor corporateCheninYellow];
    self.supportDeleteButtonColor = isNullify ? nil : [PREColor corporateNewYorkPink];
    self.supportInfoButtonColor = isNullify ? nil : [PREColor corporateDanubeBlue];
    self.clearColor = isNullify ? nil : [PREColor clearColor];
    self.separatorColor = isNullify ? nil : self.palette20Color;
    self.actionColor = isNullify ? nil : [PREColor corporateVikingBlue];
    self.statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationBarTintColor = self.palette0Color;
    self.accessoryViewColor = [PREColor gray50Color];

    self.DEFAULT_COLOR = [PREColor blackColor];
}


#pragma mark - Helper Methods

- (void)initializeContentElements
{
#pragma mark - BASIC UIKIT VIEWS
    
    // ---------------------------
    [[UIButton appearance] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    [[PRETextButton appearance] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[PREImageButton appearance] setTintColor:self.actionColor];
    [[PREUserDataButton appearance] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[PRERoundedButton appearance] setBackgroundColor:self.actionColor];
    [[PRERoundedButton appearance] setTitleColor:self.baseColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIRefreshControl appearance] setTintColor:self.descriptionTextColor];
    // attributed title must be defined here to set the proper color
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"refresh_control_title", nil)             attributes:@{NSForegroundColorAttributeName:self.descriptionTextColor?:self.DEFAULT_COLOR}];
    [[UIRefreshControl appearance] setAttributedTitle:[[NSAttributedString alloc]initWithAttributedString:title]];
    
    // ---------------------------
    // Affects to UIBarButtonItems in top navigation bar
    [[UINavigationBar appearance] setTintColor:self.palette100Color]; // navBar items tint color
    // UINavigationBar --> ´traslucency' defined by each PREParentView_XX_Controller
	// This is needed for view controllers that does not inherit from ours (photo gallery, and email composer basically)
	[[UINavigationBar appearance] setBarTintColor:self.navigationBarTintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.palette100Color?:self.DEFAULT_COLOR}];
    if (@available(iOS 11.0, *))
        [[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName:self.palette100Color?:self.DEFAULT_COLOR}];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setTitleColor:self.palette100Color forState:UIControlStateNormal];

    // ---------------------------
    [[UITableView appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[UICollectionView appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[UIScrollView appearance] setBackgroundColor:self.clearColor];
    
    // ---------------------------
    [[UIActivityIndicatorView appearance] setColor:self.palette90Color];
    [[CustomActivityIndicator appearance] setBackgroundColor:[self.palette0Color colorWithAlphaComponent:0.1]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setTextColor:self.palette90Color];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setBackgroundColor:self.clearColor];
    
    // ---------------------------
	[[UIToolbar appearance] setTintColor:self.palette90Color];
    [[UIToolbar appearance] setBarTintColor:self.palette20Color];
    [[UIToolbar appearance] setTranslucent:NO];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTitleColor:self.palette90Color forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.principalTextColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
    // FIXME : SetTintColor Applies luminosity, not the color itself. A particular color cannot be applied
    [[UISearchBar appearance] setTintColor:self.principalTextColor]; // cursor + search bar buttons.
    [[UISearchBar appearance] setBarTintColor:self.palette20Color]; // bg color
    [[UISearchBar appearance] setSearchTextPositionAdjustment:UIOffsetMake(10, 0)];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setDefaultTextAttributes:@{NSForegroundColorAttributeName : self.principalTextColor?:self.DEFAULT_COLOR}];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName : self.descriptionTextColor?:self.DEFAULT_COLOR}]];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
	[[UITabBar appearance] setBarTintColor:self.palette20Color];
	[[UITabBar appearance] setTintColor:self.actionColor];
	[[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
	[[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.principalTextColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
	[[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.actionColor?:self.DEFAULT_COLOR} forState:UIControlStateSelected];
	[[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
    [[UIPageControl appearance] setPageIndicatorTintColor:self.principalTextColor];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:self.titleTextColor];
    [[UIPageControl appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[UISegmentedControl appearance] setTintColor:self.titleTextColor];
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.palette90Color?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.baseColor?:self.DEFAULT_COLOR} forState:UIControlStateSelected];
    [[UISegmentedControl appearance] setBackgroundColor:self.palette40Color];
    [[PRESegmentedControl appearance] setTintColor:self.actionColor];
    [[PRESegmentedControl appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[PRESwitch appearance] setThumbTintColor:self.descriptionTextColor];
    [[PRESwitch appearance] setTintColor:self.principalTextColor];
    [[PRESwitch appearance] setOnTintColor:self.actionColor];
    [[PRESwitch appearance] setBackgroundColor:[PREColor gray40Color]];
    
    // ********************************** DARK THEME EXCLUSIVE **********************************
    // REMOTE IMAGES HACK: Following tints should be avoided in PRODUCTION!! as the server should serve the right icon for each theme.
    
    // This global tintColor is necessary to make the following exception work. UIImageView+WebView checks for UIImageView gobal tintColor; if it exists, the system later on applies the particular class tintColor for each container.
    [[UIImageView appearance] setTintColor:self.titleTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UIButton class],
                                                                [UIToolbar class]]] setTintColor:self.palette100Color];
    
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTintColor:self.palette100Color];
    
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[CalendarHeaderViewController class]]] setTintColor:self.principalTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PRETicketOverviewHeader class]]] setTintColor:self.principalTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PRENameValuePairStackView class]]] setTintColor:self.principalTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PRETicketViewCell class]]] setTintColor:self.principalTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PREContactCell class]]] setTintColor:self.principalTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[NextStepCell class]]] setTintColor:self.titleTextColor];
    // ******************************************************************************************
    
#pragma mark - TABLE & COLLECTION VIEW CELLS
    
    // ---------------------------
    [[PREParentBaseTableViewCell appearance] setBaseColor:self.baseColor];
    [[PREParentBaseTableViewCell appearance] setBaseSelectionColor:self.baseSelectionColor];
    [[PREParentBaseTableViewCell appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewCell appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewCell appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewCell appearance] setSupportDefaultButtonColor:self.supportDefaultButtonColor];
    [[PREParentBaseTableViewCell appearance] setSupportDeleteButtonColor:self.supportDeleteButtonColor];
    [[PREParentBaseTableViewCell appearance] setSupportInfoButtonColor:self.supportInfoButtonColor];
    [[PREParentBaseTableViewCell appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    // ---------------------------
    [[BaseTableCell appearance] setBaseColor:self.baseColor];
    [[BaseTableCell appearance] setBaseSelectionColor:self.baseSelectionColor];
    [[BaseTableCell appearance] setTitleTextColor:self.titleTextColor];
    [[BaseTableCell appearance] setPrincipalTextColor:self.principalTextColor];
    [[BaseTableCell appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[BaseTableCell appearance] setSupportDefaultButtonColor:self.supportDefaultButtonColor];
    [[BaseTableCell appearance] setSupportDeleteButtonColor:self.supportDeleteButtonColor];
    [[BaseTableCell appearance] setSupportInfoButtonColor:self.supportInfoButtonColor];
    [[BaseTableCell appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    // ---------------------------
    [[PREParentBaseCollectionViewCell appearance] setBaseColor:self.baseColor];
    [[PREParentBaseCollectionViewCell appearance] setBaseSelectionColor:self.baseSelectionColor];
    [[PREParentBaseCollectionViewCell appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseCollectionViewCell appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseCollectionViewCell appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseCollectionViewCell appearance] setSupportDefaultButtonColor:self.supportDefaultButtonColor];
    [[PREParentBaseCollectionViewCell appearance] setSupportDeleteButtonColor:self.supportDeleteButtonColor];
    [[PREParentBaseCollectionViewCell appearance] setSupportInfoButtonColor:self.supportInfoButtonColor];
    [[PREParentBaseCollectionViewCell appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    //  ---------------------------
    [[PREParentBaseCollectionReusableView appearance] setHeaderBackgroundColor:self.palette40Color];
    [[PREParentBaseCollectionReusableView appearance] setHeaderTextColor:self.palette90Color];
    
    // ---------------------------
    [[BaseTextViewCell appearance] setEditModePlaceholderColor:self.principalTextColor];
    [[BaseTextViewCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[BaseTextViewCell appearance] setEditModeEditableTextColor:self.palette100Color];
    [[BaseTextViewCell appearance] setEditModeNotEditableTextColor:self.palette60Color];
    [[BaseTextViewCell appearance] setReadModePlaceholderColor:self.palette40Color];
    [[BaseTextViewCell appearance] setReadModeTitleColor:self.titleTextColor];
    [[BaseTextViewCell appearance] setReadModeTextColor:self.palette60Color];
    
    // ---------------------------
    [[PREDynamicBaseTextViewCell appearance] setEditModePlaceholderColor:self.principalTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeActiveTitleColor:self.titleTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeInactiveTitleColor:self.palette60Color];
    [[PREDynamicBaseTextViewCell appearance] setEditModeEditableTextColor:self.palette100Color];
    [[PREDynamicBaseTextViewCell appearance] setEditModeNotEditableTextColor:self.palette60Color];
    [[PREDynamicBaseTextViewCell appearance] setReadModePlaceholderColor:self.palette40Color];
    [[PREDynamicBaseTextViewCell appearance] setReadModeActiveTitleColor:self.titleTextColor];
    [[PREDynamicBaseTextViewCell appearance] setReadModeTextColor:self.palette60Color];
    
    // ---------------------------
    [[ConnectionEntityTableViewCell appearance] setReachableColor:self.palette90Color];
    [[ConnectionEntityTableViewCell appearance] setNotReachableColor:[PREColor corporateNewYorkPink]];
    [[ConnectionEntityTableViewCell appearance] setUnauthorizedColor:[PREColor corporateNewYorkPink]];
    [[ConnectionEntityTableViewCell appearance] setUnknownColor:self.palette60Color];
    [[ConnectionEntityTableViewCell appearance] setWrongPortColor:[PREColor corporateNewYorkPink]];
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[ConnectionEntityTableViewCell class]]] setColor:self.palette90Color];
    
    // ---------------------------
    [[NewEventCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[NewEventCell appearance] setEditModeTextColor:self.descriptionTextColor];
    [[NewEventCell appearance] setEditModeBookmarkedTextColor:self.actionColor];
    [[NewEventCell appearance] setEditModeNotBookmarkedTextColor:self.descriptionTextColor];
    
    // ---------------------------
    [[EventSessionCell appearance] setEditModeBookmarkedTextColor:self.principalTextColor];
    [[EventSessionCell appearance] setEditModeNotBookmarkedTextColor:self.palette60Color];
    [[EventSessionCell appearance] setEditModeNowTextColor:self.supportDeleteButtonColor];
    
    // ---------------------------
    [[EditComboBoxCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[EditComboBoxCell appearance] setEditModeTextColor:self.principalTextColor];
    [[EditComboBoxCell appearance] setReadModeTitleColor:self.titleTextColor];
    [[EditComboBoxCell appearance] setReadModeTextColor:self.principalTextColor];

    // ---------------------------
    [[PREMoneyCell appearance] setPositiveAmountTextColor:self.principalTextColor];
    [[PREMoneyCell appearance] setNegativeAmountTextColor:[PREColor corporateNewYorkPink]];
    
    // ---------------------------
    [[PRETicketViewCell appearance] setStatusTopBackgroundColor:[PREColor corporateNewYorkPink]];
    [[PRETicketViewCell appearance] setStatusMiddleBackgroundColor:[PREColor corporateCalicoOrange]];
    [[PRETicketViewCell appearance] setStatusBottomBackgroundColor:[PREColor corporateCheninYellow]];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[MultiCheckCell class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[CommentCell class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[SingleMethodCell class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[SearchResultCell class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[VisualListCell class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[PaginationTableViewCell class]]] setColor:self.palette90Color];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[TokenInputCell class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UITableView appearanceWhenContainedInInstancesOfClasses:@[[InlineMultiCheckCell class]]] setBackgroundColor:self.palette10Color];
    [[UITableViewCell appearanceWhenContainedInInstancesOfClasses:@[[InlineMultiCheckCell class]]] setBackgroundColor:self.palette10Color];
    
    // ---------------------------
    [[PREChatSessionCell appearance] setExceptionalTextColor:self.palette100Color];
    
    // ---------------------------
    [[MagazineCell appearance] setImageBorderColor:self.palette50Color];
    
    //  ---------------------------
    [[CellImage appearance] setImageBorderColor:self.palette100Color];
    [[CellImage appearance] setImageShadowColor:self.palette0Color];
    
    // ---------------------------
    [[PRESimpleCell appearance] setSearchHighlightedTextColor:self.titleTextColor];
    
    // ---------------------------
    [[PRESettingsSimpleCell appearance] setBaseColor:self.palette20Color];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[PRESettingsSimpleCell class]]] setTextColor:self.principalTextColor];
    
    // ---------------------------
    [[PRESettingsDetailThemeTableViewCell appearance] setBaseColor:self.palette20Color];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[PRESettingsDetailThemeTableViewCell class]]] setTextColor:self.principalTextColor];
    
    
#pragma mark - VIEW CONTROLLERS
    
    // ---------------------------
    [[PREParentBaseNavigationController appearance] setBaseColor:self.baseColor];
    
    // ---------------------------
    [[PREParentBaseViewController appearance] setBaseColor:self.baseColor];
    [[PREParentBaseViewController appearance] setCustomStatusBarStyle:self.statusBarStyle];
    [[PREParentBaseViewController appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseViewController appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseViewController appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseViewController appearance] setEmptyTextColor:self.emptyTextColor];
	[[PREParentBaseViewController appearance] setNavigationBarColor:self.navigationBarTintColor];
	[[PREParentBaseViewController appearance] setNavigationBarTransparency:NO];
    [[PREParentBaseViewController appearance] setNavigationSearchBarBackgroundColor:self.baseColor];
    [[PREParentBaseViewController appearance] setNavigationSearchBarBorderColor:self.palette40Color];
    [[PREParentBaseViewController appearance] setNavigationSearchBarButtonTintColor:self.actionColor];
    [[PREParentBaseViewController appearance] setNavigationSearchBarTextColor:self.principalTextColor];

	// ---------------------------
	[[PREParentBaseImagePickerController appearance] setCustomStatusBarStyle:self.statusBarStyle];
    
    // ---------------------------
    [[PREParentBaseTableViewController appearance] setBaseColor:self.baseColor];
    [[PREParentBaseTableViewController appearance] setCustomStatusBarStyle:self.statusBarStyle];
    [[PREParentBaseTableViewController appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewController appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewController appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewController appearance] setSeparatorColor:self.separatorColor];
    [[PREParentBaseTableViewController appearance] setEmptyTextColor:self.emptyTextColor];
    [[PREParentBaseTableViewController appearance] setSectionBackgroundColor:self.palette90Color];
    [[PREParentBaseTableViewController appearance] setSectionTextColor:self.titleTextColor];
	[[PREParentBaseTableViewController appearance] setNavigationBarColor:self.navigationBarTintColor];
	[[PREParentBaseTableViewController appearance] setNavigationBarTransparency:NO];
    
    // ---------------------------
    [[PREParentBaseSplitViewController appearance] setBaseColor:self.palette30Color]; // needed to show splitView separator line color
    [[PREParentBaseSplitViewController appearance] setCustomStatusBarStyle:self.statusBarStyle];
    [[PREParentBaseSplitViewController appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseSplitViewController appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseSplitViewController appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseSplitViewController appearance] setEmptyTextColor:self.emptyTextColor];
    
    // ---------------------------
    // Info: changing the background color for the cancel action button is not supported.
    // There are hacks to colour our custom action buttons block, but there is no point to have heterogenous colors there, so that PREParentBaseAppearanceProtocol (baseColor) is not necessary.
    [[PREParentBaseAlertViewController appearance] setAlertTitleTextColor:self.baseColor];
    [[PREParentBaseAlertViewController appearance] setAlertSubtitleTextColor:[PREColor lighterColorForColor:self.baseColor]];
    [[PREParentBaseAlertViewController appearance] setDefaultActionColor:[PREColor darkerColorForColor:self.actionColor withPercentage:40]];
    [[PREParentBaseAlertViewController appearance] setCancelActionColor:[PREColor darkerColorForColor:self.actionColor withPercentage:40]];
    [[PREParentBaseAlertViewController appearance] setDestructiveActionColor:[PREColor darkerColorForColor:self.supportDeleteButtonColor withPercentage:40]];
    
    // ---------------------------
    [[RichTextEditorVC appearance] setBaseColor:self.baseColor];
    [[RichTextEditorVC appearance] setCustomStatusBarStyle:self.statusBarStyle];
    [[RichTextEditorVC appearance] setTitleTextColor:self.titleTextColor];
    [[RichTextEditorVC appearance] setPrincipalTextColor:self.principalTextColor];
    [[RichTextEditorVC appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[RichTextEditorVC appearance] setEmptyTextColor:self.emptyTextColor];
    
    // ---------------------------
    [[BaseTableVC appearance] setSeparatorColor:self.separatorColor];
    [[BaseTableVC appearance] setSectionBackgroundColor:self.palette90Color];
    [[BaseTableVC appearance] setSectionTextColor:self.titleTextColor];
    
    // ---------------------------
    [[ConnectionEntitiesVC appearance] setSecondaryViewTextColor:self.palette10Color];
    [[ConnectionEntitiesVC appearance] setSecondaryViewDeleteColor:[PREColor corporateNewYorkPink]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewEditColor:[PREColor corporateCalicoOrange]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewDuplicateColor:[PREColor corporateCheninYellow]];
    
    // ---------------------------
    [[LoginScreenVC appearance] setBaseColor:self.palette0Color];
    [[LoginScreenVC appearance] setPlaceholderColor:self.palette60Color];
    [[LoginScreenVC appearance] setLoginButtonBackgroundColor:[PREColor corporateAquamarineGreen]];
    [[LoginScreenVC appearance] setLoginWithGoogleButtonBackgroundColor:[PREColor corporateCarnationPink]];
	[[LoginScreenVC appearance] setGoogleSignBackgroundColor:[PREColor gray80Color]];
	[[LoginScreenVC appearance] setGoogleSignOKButtonBackgroundColor:[PREColor corporateCarnationPink]];
    [[LoginScreenVC appearance] setCredentialsBorderColor:self.palette60Color];
    [[LoginScreenVC appearance] setCredentialsSeparatorColor:self.palette60Color];
    [[LoginScreenVC appearance] setOrSeparatorColor:self.palette60Color];

    //  ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[EventDetailsVC class]]] setTitleColor:[PREColor lighterColorForColor:self.titleTextColor withPercentage:50] forState:UIControlStateNormal];
    
    //  ---------------------------
    [[UICollectionView appearanceWhenContainedInInstancesOfClasses:@[[SingleEntryPointMenuVC class]]] setBackgroundColor:self.palette0Color];
    
    //  ---------------------------
    [[ChartVC appearance] setChartBackgroundColor:self.palette20Color];
    [[ChartVC appearance] setChartTextColor:self.principalTextColor];
    [ChartFactory setChartViewTextColor:self.palette0Color]; // static class
    [ChartFactory setChartViewBackgroundColor:self.palette20Color]; // static class
    
    //  ---------------------------
    [[CalendarVC appearance] setToolbarButtonTintColor:self.palette100Color];
    
    //  ---------------------------
    [[FullTextVC appearance] setEditModeTextColor:self.palette100Color];
    [[FullTextVC appearance] setReadModeTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PREContentSelectorViewController appearance] setHeaderContainerBackgroundColor:self.palette20Color];
    [[PREContentSelectorViewController appearance] setSegmentContainerBackgroundColor:self.palette20Color];
    [[PREContentSelectorViewController appearance] setContentContainerBackgroundColor:self.palette20Color];
    
    //  ---------------------------
    [[NewCredentialEditor appearance] setBorderDefaultColor:self.palette60Color];
    [[NewCredentialEditor appearance] setBorderSelectedColor:self.palette90Color];
    [[NewCredentialEditor appearance] setBorderErrorColor:[PREColor corporateNewYorkPink]];
    // if both buttons would have same color, we could use the appearance proxy of UIButton contained in NewCredentialEditor
    [[NewCredentialEditor appearance] setSaveAndLaunchButtonBgColor:self.titleTextColor];
    [[NewCredentialEditor appearance] setSaveButtonBgColor:self.titleTextColor];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[NewCredentialEditor class]]] setTitleColor:self.palette20Color forState:UIControlStateNormal];
    
    //  ---------------------------
    [[ListWithHeaderVC appearance] setTablePageControlColor:self.palette60Color];
    
    //  ---------------------------
    [[FormWithImageHeaderVC appearance] setHeaderImageBlurColor:(PREColor *)[self.palette0Color colorWithAlphaComponent:0.4]];
    [[FormWithImageHeaderVC appearance] setHeaderImageBorderColor:self.palette100Color];
    [[FormWithImageHeaderVC appearance] setHeaderTitleTextColor:self.titleTextColor];
    [[FormWithImageHeaderVC appearance] setHeaderPrincipalTextColor:self.principalTextColor];
    
    //  ---------------------------
    [[GridImagePickerVC appearance] setGridColor:self.palette90Color];
    // image is drag and when moved, the selected grid cell gets highlighted in green in this case
    [[GridImagePickerVC appearance] setGridImagePlacementBackgroundColor:(PREColor *)[[PREColor corporateSpringLeavesGreenColor] colorWithAlphaComponent:0.4]];
    [[GridImagePickerVC appearance] setLoadedGridImageBorderColor:self.palette100Color];
    [[GridImagePickerVC appearance] setUploadedGridImageBorderColor:[PREColor corporateSpringLeavesGreenColor]];
    [[GridImagePickerVC appearance] setExceptionGridImageBorderColor:[PREColor corporateAuChicoRed]];
    
    //  ---------------------------
    [[LibraryCollectionVC appearance] setSeparatorColor:self.separatorColor];
    
    //  ---------------------------
    [[BrochureDetailsVC appearance] setBrochureBorderColor:self.palette40Color];
    
    //  ---------------------------
    [[EventSessionVC appearance] setActiveBookmarkTextColor:self.actionColor];
    [[EventSessionVC appearance] setInactiveBookmarkTextColor:self.principalTextColor];
    [[EventSessionVC appearance] setNowTextColor:self.supportDeleteButtonColor];
    
    //  ---------------------------
    [[PREAlertContainerViewController appearance] setBaseColor:(PREColor*)[self.palette20Color colorWithAlphaComponent:0.2]];
    
    //  ---------------------------
    [[PREToastVC appearance] setBaseColor:(PREColor*)[self.palette0Color colorWithAlphaComponent:0.7]];
    
    //  ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[InformationVC class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
	// ---------------------------
	[[FormWithImageHeaderVC appearance] setNavigationBarTransparency:YES];
	
    // ---------------------------
    [[EventDetailsVC appearance] setCustomTitleColor:[PREColor whiteColor]];
    [[EventDetailsVC appearance] setCustomTextColor:[PREColor whiteColor]];
    [[EventDetailsVC appearance] setCustomBookmarkedTextColor:self.actionColor];
    [[EventDetailsVC appearance] setCustomNotBookmarkedTextColor:[PREColor whiteColor]];
    [[EventDetailsVC appearance] setNavigationBarTransparency:YES];
    
    // ---------------------------
    [[PRESettingsMasterTableViewController appearance] setBaseColor:self.baseColor]; // needed to show splitView separator line color
    
    // ---------------------------
    [[PRESettingsDetailServerViewController appearance] setBaseColor:self.baseColor]; // needed to show splitView separator line color
    [[PRESettingsDetailServerViewController appearance] setSeparatorColor:self.baseColor]; // exceptional case due to cell bg color
    [[PRESettingsDetailServerViewController appearance] setEditButtonBackgroundColor:self.supportDefaultButtonColor];
    [[PRESettingsDetailServerViewController appearance] setDeleteButtonBackgroundColor:self.supportDeleteButtonColor];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[PRESettingsDetailServerViewController class]]] setTitleColor:self.baseColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[PRESettingsDetailXMPPViewController appearance] setBaseColor:self.baseColor];
    
    // ---------------------------
    [[PRESettingsDetailThemeTableViewController appearance] setBaseColor:self.baseColor];
    [[PRESettingsDetailThemeTableViewController appearance] setSeparatorColor:self.baseColor];
    
#pragma mark - VIEWS
    // TODO: Since There is no way to unify UIViews (UIView, UITextField, UITextView, UIStackView...) into a PREParentBaseView, each particular view implements PREAppearance protocol on its own
    //  ---------------------------
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableBackgroundColor:self.palette40Color];
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableBorderColor:self.descriptionTextColor];
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PRETextField appearance] setEnabledBackgroundColor:self.clearColor];
    [[PRETextField appearance] setDisabledBackgroundColor:self.palette30Color];
    [[PRETextField appearance] setPrincipalTextColor:self.principalTextColor];
    [[PRETextField appearance] setPlaceholderTextColor:self.palette50Color];
    [[PRETextField appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    //  ---------------------------
    //TODO: CLTokenInputView (POD) should be reimplemented to expose the necessary UI properties. TokenInputCell uses it but cannot set it up
    
    //  ---------------------------
    [[PREAvatarImageView appearance] setBackgroundColor:self.titleTextColor];
    
    //  ---------------------------
    [[PRENameValuePairStackView appearance] setTitleTextColor:self.titleTextColor];
    [[PRENameValuePairStackView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PRENameValuePairStackView appearance] setDescriptionTextColor:self.descriptionTextColor];
    
    //  ---------------------------
//    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[ListWithHeaderButtonsContainerView class]]] setBackgroundColor:self.actionColor]; // TODO: Necessary? check  in rest of themes
    
#pragma mark - TABLE VIEW HEADERS
    
    // ---------------------------
    [[PREMoneyHeader appearance] setBaseColor:self.palette30Color];
    [[PREMoneyHeader appearance] setPrincipalTextColor:[PREColor whiteColor]];
    
    //  ---------------------------
    [[PRETicketOverviewHeader appearance] setStatusTopBackgroundColor:[PREColor corporateNewYorkPink]];
    [[PRETicketOverviewHeader appearance] setStatusMiddleBackgroundColor:[PREColor corporateCalicoOrange]];
    [[PRETicketOverviewHeader appearance] setStatusBottomBackgroundColor:[PREColor corporateCheninYellow]];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[PRETicketOverviewHeader class]]] setTitleColor:self.titleTextColor forState:UIControlStateNormal];
    
#pragma mark - TABLE VIEW SECTION
    
    // ---------------------------
    [[PREParentBaseTableViewHeaderView appearance] setBaseColor:self.palette20Color];
    [[PREParentBaseTableViewHeaderView appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewHeaderView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewHeaderView appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewHeaderView appearance] setEmptyTextColor:self.descriptionTextColor];
    
    // ---------------------------
    [[PREParentBaseTableViewFooterView appearance] setBaseColor:self.palette20Color];
    [[PREParentBaseTableViewFooterView appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewFooterView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewFooterView appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewFooterView appearance] setEmptyTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PREParentBaseTableViewSectionView appearance] setBaseColor:self.palette20Color];
    [[PREParentBaseTableViewSectionView appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewSectionView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewSectionView appearance] setDescriptionTextColor:self.principalTextColor];
    [[PREParentBaseTableViewSectionView appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    //  ---------------------------
    [[BaseTableSection appearance] setBorderColor:self.palette40Color];
    
    //  ---------------------------
    [[PREMoneySection appearance] setBaseColor:self.palette20Color];
    [[PREMoneySection appearance] setTopSeparatorColor:self.palette30Color];
    [[PREMoneySection appearance] setTitleTextColor:self.titleTextColor];
    [[PREMoneySection appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREMoneySection appearance] setPositiveAmountTextColor:self.principalTextColor];
    [[PREMoneySection appearance] setNegativeAmountTextColor:[PREColor corporateNewYorkPink]];
    
    // ----------------------------
    [[PREAccordionSection appearance] setBaseColor:self.baseColor];
    [[PREAccordionSection appearance] setTitleTextColor:self.titleTextColor];
    [[PREAccordionSection appearance] setPrincipalTextColor:self.baseColor];
    [[PREAccordionSection appearance] setDescriptionTextColor:self.descriptionTextColor];
	[[PREAccordionSection appearance] setBorderColor:self.clearColor];

    // ---------------------------
    [[PREInfoSummarySection appearance] setCircleBackgroundColor:self.palette30Color];
    [[PREInfoSummarySection appearance] setCircleBorderColor:self.principalTextColor];
    
    // ---------------------------
    [[PREResultsFooter appearance] setBaseColor:self.actionColor];
    [[PREResultsFooter appearance] setPrincipalTextColor:self.baseColor];
}

@end
