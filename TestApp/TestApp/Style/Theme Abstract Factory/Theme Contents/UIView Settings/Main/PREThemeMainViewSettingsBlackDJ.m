//
//  PREThemeMainViewSettingsBlackDJ.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeMainViewSettingsBlackDJ.h"

@interface PREThemeMainViewSettingsBlackDJ()

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

@implementation PREThemeMainViewSettingsBlackDJ

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Black DJ Views Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.baseColor = isNullify ? nil : [PREColor dowJonesCodGray];
    self.baseSelectionColor = isNullify ? nil : [PREColor gray30Color];
    self.titleTextColor = isNullify ? nil : [PREColor dowJonesSeashellWhite];
    self.principalTextColor = isNullify ? nil : [PREColor dowJonesSeashellWhite];
    self.descriptionTextColor = isNullify ? nil : [PREColor corporateSilverChaliceGray];
    self.emptyTextColor = isNullify ? nil : [PREColor gray40Color];
    self.supportDefaultButtonColor = isNullify ? nil : [PREColor corporateCheninYellow];
    self.supportDeleteButtonColor = isNullify ? nil : [PREColor corporateNewYorkPink];
    self.supportInfoButtonColor = isNullify ? nil : [PREColor corporateDanubeBlue];
    self.clearColor = isNullify ? nil : [PREColor clearColor];
    self.separatorColor = isNullify ? nil : [PREColor dowJonesTundoraGray];
    self.actionColor = isNullify ? nil : [PREColor corporateCeruleanBlue];
    self.statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationBarTintColor = [PREColor blackColor];
    self.accessoryViewColor = [PREColor dowJonesDoveGray];
    
    self.DEFAULT_COLOR = [PREColor whiteColor];
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
    [[PRERoundedButton appearance] setTitleColor:self.principalTextColor forState:UIControlStateNormal];

    // ---------------------------
    [[UIRefreshControl appearance] setTintColor:self.descriptionTextColor];
    // attributed title must be defined here to set the proper color
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"refresh_control_title", nil)             attributes:@{NSForegroundColorAttributeName:self.descriptionTextColor?:self.DEFAULT_COLOR}];
    [[UIRefreshControl appearance] setAttributedTitle:[[NSAttributedString alloc]initWithAttributedString:title]];
    
    // ---------------------------
    // Affects to UIBarButtonItems in top navigation bar
    [[UINavigationBar appearance] setTintColor:self.actionColor]; // navBar items tint color
    // UINavigationBar --> ´traslucency' defined by each PREParentView_XX_Controller
	// This is needed for view controllers that does not inherit from ours (photo gallery, and email composer basically)
	[[UINavigationBar appearance] setBarTintColor:self.navigationBarTintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.principalTextColor?:self.DEFAULT_COLOR}];
    if (@available(iOS 11.0, *))
        [[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName:self.principalTextColor?:self.DEFAULT_COLOR}];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UITableView appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[UICollectionView appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[UIScrollView appearance] setBackgroundColor:self.clearColor];
    
    // ---------------------------
    [[UIActivityIndicatorView appearance] setColor:self.principalTextColor];
    [[CustomActivityIndicator appearance] setBackgroundColor:[[PREColor blackColor] colorWithAlphaComponent:0.1]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setTextColor:self.principalTextColor];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setBackgroundColor:self.clearColor];
    
    // ---------------------------
    [[UIToolbar appearance] setTintColor:self.actionColor];
    [[UIToolbar appearance] setBarTintColor:[PREColor blackColor]];
    [[UIToolbar appearance] setTranslucent:NO];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.actionColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTintColor:self.actionColor];
    
    // ---------------------------
    // FIXME : SetTintColor Applies luminosity, not the color itself. A particular color cannot be applied
    [[UISearchBar appearance] setTintColor:self.principalTextColor]; // cursor + search bar buttons.
    [[UISearchBar appearance] setBarTintColor:self.baseColor]; // bg color
    [[UISearchBar appearance] setSearchTextPositionAdjustment:UIOffsetMake(10, 0)];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setDefaultTextAttributes:@{NSForegroundColorAttributeName : self.principalTextColor?:self.DEFAULT_COLOR}];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName : self.descriptionTextColor?:self.DEFAULT_COLOR}]];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
    [[UITabBar appearance] setBarTintColor:[PREColor blackColor]];
    [[UITabBar appearance] setTintColor:self.actionColor];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.principalTextColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.actionColor?:self.DEFAULT_COLOR} forState:UIControlStateSelected];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
    [[UIPageControl appearance] setPageIndicatorTintColor:self.principalTextColor];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:self.actionColor];
    [[UIPageControl appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[UISegmentedControl appearance] setTintColor:self.actionColor];
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.actionColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.baseColor?:self.DEFAULT_COLOR} forState:UIControlStateSelected];
    [[UISegmentedControl appearance] setBackgroundColor:self.baseColor];
    [[PRESegmentedControl appearance] setTintColor:self.actionColor];
    [[PRESegmentedControl appearance] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[PRESwitch appearance] setThumbTintColor:[PREColor dowJonesCodGray]];
    [[PRESwitch appearance] setTintColor:[PREColor dowJonesDoveGray]];
    [[PRESwitch appearance] setOnTintColor:[PREColor corporateCeruleanBlue]];
    [[PRESwitch appearance] setBackgroundColor:[PREColor dowJonesTundoraGray]];
    
    // ********************************** BLACK THEME EXCLUSIVE **********************************
    // REMOTE IMAGES HACK: Following tints should be avoided in PRODUCTION!! as the server should serve the right icon for each theme.
    
    // This global tintColor is necessary to make the following exception work. UIImageView+WebView checks for UIImageView gobal tintColor; if it exists, the system later on applies the particular class tintColor for each container.
    [[UIImageView appearance] setTintColor:self.actionColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UIButton class],
                                                                [UIToolbar class]]] setTintColor:self.actionColor];
    
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTintColor:self.actionColor];
    
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[CalendarHeaderViewController class]]] setTintColor:self.descriptionTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PRETicketOverviewHeader class]]] setTintColor:self.descriptionTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PRENameValuePairStackView class]]] setTintColor:self.descriptionTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PRETicketViewCell class]]] setTintColor:self.descriptionTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[PREContactCell class]]] setTintColor:self.descriptionTextColor];
    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[NextStepCell class]]] setTintColor:self.actionColor];
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
    [[PREParentBaseCollectionReusableView appearance] setHeaderBackgroundColor:[PREColor gray40Color]];
    [[PREParentBaseCollectionReusableView appearance] setHeaderTextColor:self.principalTextColor];
    
    // ---------------------------
    [[BaseTextViewCell appearance] setEditModePlaceholderColor:self.principalTextColor];
    [[BaseTextViewCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[BaseTextViewCell appearance] setEditModeEditableTextColor:self.principalTextColor];
    [[BaseTextViewCell appearance] setEditModeNotEditableTextColor:[PREColor gray60Color]];
    [[BaseTextViewCell appearance] setReadModePlaceholderColor:[PREColor gray40Color]];
    [[BaseTextViewCell appearance] setReadModeTitleColor:self.titleTextColor];
    [[BaseTextViewCell appearance] setReadModeTextColor:[PREColor gray60Color]];
    
    // ---------------------------
    [[PREDynamicBaseTextViewCell appearance] setEditModePlaceholderColor:self.principalTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeActiveTitleColor:self.titleTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeInactiveTitleColor:self.principalTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeEditableTextColor:self.principalTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeNotEditableTextColor:[PREColor gray60Color]];
    [[PREDynamicBaseTextViewCell appearance] setReadModePlaceholderColor:[PREColor gray40Color]];
    [[PREDynamicBaseTextViewCell appearance] setReadModeActiveTitleColor:self.titleTextColor];
    [[PREDynamicBaseTextViewCell appearance] setReadModeTextColor:[PREColor gray60Color]];
    
    // ---------------------------
    [[ConnectionEntityTableViewCell appearance] setReachableColor:self.principalTextColor];
    [[ConnectionEntityTableViewCell appearance] setNotReachableColor:[PREColor corporateNewYorkPink]];
    [[ConnectionEntityTableViewCell appearance] setUnauthorizedColor:[PREColor corporateNewYorkPink]];
    [[ConnectionEntityTableViewCell appearance] setUnknownColor:self.descriptionTextColor];
    [[ConnectionEntityTableViewCell appearance] setWrongPortColor:[PREColor corporateNewYorkPink]];
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[ConnectionEntityTableViewCell class]]] setColor:self.principalTextColor];
    
    // ---------------------------
    [[NewEventCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[NewEventCell appearance] setEditModeTextColor:self.descriptionTextColor];
    [[NewEventCell appearance] setEditModeBookmarkedTextColor:self.actionColor];
    [[NewEventCell appearance] setEditModeNotBookmarkedTextColor:self.descriptionTextColor];
    
    // ---------------------------
    [[EventSessionCell appearance] setEditModeBookmarkedTextColor:self.principalTextColor];
    [[EventSessionCell appearance] setEditModeNotBookmarkedTextColor:[PREColor gray60Color]];
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
//    [[ApplicationCell appearance] setBaseSelectionColor:[PREColor clearColor]]; // TODO: Is necessary?? Apply also to Black
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[MultiCheckCell class]]] setTitleColor:self.principalTextColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[CommentCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[SingleMethodCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[SearchResultCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[VisualListCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[PaginationTableViewCell class]]] setColor:self.principalTextColor];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[TokenInputCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UITableView appearanceWhenContainedInInstancesOfClasses:@[[InlineMultiCheckCell class]]] setBackgroundColor:self.baseColor];
    [[UITableViewCell appearanceWhenContainedInInstancesOfClasses:@[[InlineMultiCheckCell class]]] setBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[PREChatSessionCell appearance] setExceptionalTextColor:self.principalTextColor];
    
    // ---------------------------
    [[MagazineCell appearance] setImageBorderColor:[PREColor gray50Color]];
    
    //  ---------------------------
    [[CellImage appearance] setImageBorderColor:self.principalTextColor];
    [[CellImage appearance] setImageShadowColor:[PREColor blackColor]];
//    [[CellImage appearance] setBaseSelectionColor:(PREColor*)[[PREColor gray20Color]colorWithAlphaComponent:0.5]]; // TODO: Is necessary?? Apply also to Black
    
    // ---------------------------
    [[PRESimpleCell appearance] setSearchHighlightedTextColor:self.titleTextColor];
    
    // ---------------------------
    [[PRESettingsSimpleCell appearance] setBaseColor:PREColor.gray20Color];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[PRESettingsSimpleCell class]]] setTextColor:self.principalTextColor];
    
    // ---------------------------
    [[PRESettingsDetailThemeTableViewCell appearance] setBaseColor:PREColor.gray20Color];
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
    [[PREParentBaseViewController appearance] setNavigationSearchBarBorderColor:[PREColor gray40Color]];
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
    [[PREParentBaseTableViewController appearance] setSectionBackgroundColor:self.principalTextColor];
    [[PREParentBaseTableViewController appearance] setSectionTextColor:self.titleTextColor];
    [[PREParentBaseTableViewController appearance] setNavigationBarColor:self.navigationBarTintColor];
    [[PREParentBaseTableViewController appearance] setNavigationBarTransparency:NO];
    
    // ---------------------------
    [[PREParentBaseSplitViewController appearance] setBaseColor:[PREColor gray30Color]]; // needed to show splitView separator line color
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
    [[PREParentBaseAlertViewController appearance] setDefaultActionColor:self.actionColor];
    [[PREParentBaseAlertViewController appearance] setCancelActionColor:self.actionColor];
    [[PREParentBaseAlertViewController appearance] setDestructiveActionColor:self.supportDeleteButtonColor];
    
    // ---------------------------
    [[RichTextEditorVC appearance] setBaseColor:self.baseColor];
    [[RichTextEditorVC appearance] setCustomStatusBarStyle:self.statusBarStyle];
    [[RichTextEditorVC appearance] setTitleTextColor:self.titleTextColor];
    [[RichTextEditorVC appearance] setPrincipalTextColor:self.principalTextColor];
    [[RichTextEditorVC appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[RichTextEditorVC appearance] setEmptyTextColor:self.emptyTextColor];
    
    // ---------------------------
    [[BaseTableVC appearance] setSeparatorColor:self.separatorColor];
    [[BaseTableVC appearance] setSectionBackgroundColor:self.principalTextColor];
    [[BaseTableVC appearance] setSectionTextColor:self.titleTextColor];
    
    // ---------------------------
    [[ConnectionEntitiesVC appearance] setSecondaryViewTextColor:[PREColor gray10Color]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewDeleteColor:[PREColor corporateNewYorkPink]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewEditColor:[PREColor corporateCalicoOrange]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewDuplicateColor:[PREColor corporateCheninYellow]];
    
    // ---------------------------
    [[LoginScreenVC appearance] setBaseColor:[PREColor blackColor]];
    [[LoginScreenVC appearance] setPlaceholderColor:[PREColor dowJonesDoveGray]];
    [[LoginScreenVC appearance] setLoginButtonBackgroundColor:self.actionColor];
    [[LoginScreenVC appearance] setLoginWithGoogleButtonBackgroundColor:[PREColor gray30Color]];
	[[LoginScreenVC appearance] setGoogleSignBackgroundColor:[PREColor gray80Color]];
	[[LoginScreenVC appearance] setGoogleSignOKButtonBackgroundColor:[PREColor dowJonesTundoraGray]];
    [[LoginScreenVC appearance] setCredentialsBorderColor:[PREColor dowJonesDoveGray]];
    [[LoginScreenVC appearance] setCredentialsSeparatorColor:[PREColor dowJonesDoveGray]];
    [[LoginScreenVC appearance] setOrSeparatorColor:[PREColor dowJonesDoveGray]];
    
    //  ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[EventDetailsVC class]]] setTitleColor:[PREColor lighterColorForColor:self.actionColor withPercentage:50] forState:UIControlStateNormal];
    
    //  ---------------------------
    [[UICollectionView appearanceWhenContainedInInstancesOfClasses:@[[SingleEntryPointMenuVC class]]] setBackgroundColor:[PREColor blackColor]];
    
    //  ---------------------------
    [[ChartVC appearance] setChartBackgroundColor:self.baseColor];
    [[ChartVC appearance] setChartTextColor:self.principalTextColor];
    [ChartFactory setChartViewTextColor:[PREColor blackColor]]; // static class
    [ChartFactory setChartViewBackgroundColor:self.baseColor]; // static class
  
    //  ---------------------------
    [[CalendarVC appearance] setToolbarButtonTintColor:self.principalTextColor];
    
    //  ---------------------------
    [[FullTextVC appearance] setEditModeTextColor:self.principalTextColor];
    [[FullTextVC appearance] setReadModeTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PREContentSelectorViewController appearance] setHeaderContainerBackgroundColor:self.baseColor];
    [[PREContentSelectorViewController appearance] setSegmentContainerBackgroundColor:self.baseColor];
    [[PREContentSelectorViewController appearance] setContentContainerBackgroundColor:self.baseColor];
    
    //  ---------------------------
    [[NewCredentialEditor appearance] setBorderDefaultColor:[PREColor dowJonesTundoraGray]];
    [[NewCredentialEditor appearance] setBorderSelectedColor:[PREColor dowJonesTundoraGray]];
    [[NewCredentialEditor appearance] setBorderErrorColor:[PREColor corporateNewYorkPink]];
    // if both buttons would have same color, we could use the appearance proxy of UIButton contained in NewCredentialEditor
    [[NewCredentialEditor appearance] setSaveAndLaunchButtonBgColor:self.actionColor];
    [[NewCredentialEditor appearance] setSaveButtonBgColor:[PREColor gray30Color]];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[NewCredentialEditor class]]] setTitleColor:self.principalTextColor forState:UIControlStateNormal];
    
    //  ---------------------------
    [[ListWithHeaderVC appearance] setTablePageControlColor:[PREColor gray60Color]];
    
    //  ---------------------------
    [[FormWithImageHeaderVC appearance] setHeaderImageBlurColor:(PREColor *)[[PREColor blackColor] colorWithAlphaComponent:0.4]];
    [[FormWithImageHeaderVC appearance] setHeaderImageBorderColor:self.principalTextColor];
    [[FormWithImageHeaderVC appearance] setHeaderTitleTextColor:self.titleTextColor];
    [[FormWithImageHeaderVC appearance] setHeaderPrincipalTextColor:self.principalTextColor];
    
    //  ---------------------------
    [[GridImagePickerVC appearance] setGridColor:self.principalTextColor];
    // image is drag and when moved, the selected grid cell gets highlighted in green in this case
    [[GridImagePickerVC appearance] setGridImagePlacementBackgroundColor:(PREColor *)[[PREColor corporateSpringLeavesGreenColor] colorWithAlphaComponent:0.4]];
    [[GridImagePickerVC appearance] setLoadedGridImageBorderColor:self.principalTextColor];
    [[GridImagePickerVC appearance] setUploadedGridImageBorderColor:[PREColor corporateSpringLeavesGreenColor]];
    [[GridImagePickerVC appearance] setExceptionGridImageBorderColor:[PREColor corporateAuChicoRed]];
    
    //  ---------------------------
    [[LibraryCollectionVC appearance] setSeparatorColor:self.separatorColor];
    
    //  ---------------------------
    [[BrochureDetailsVC appearance] setBrochureBorderColor:[PREColor gray40Color]];
    
    //  ---------------------------
    [[EventSessionVC appearance] setActiveBookmarkTextColor:self.actionColor];
    [[EventSessionVC appearance] setInactiveBookmarkTextColor:self.principalTextColor];
    [[EventSessionVC appearance] setNowTextColor:self.supportDeleteButtonColor];
    
    //  ---------------------------
    [[PREAlertContainerViewController appearance] setBaseColor:(PREColor*)[[PREColor gray20Color] colorWithAlphaComponent:0.2]];
    
    //  ---------------------------
    [[PREToastVC appearance] setBaseColor:(PREColor*)[[PREColor blackColor] colorWithAlphaComponent:0.7]];
    
    //  ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[InformationVC class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
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
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableBackgroundColor:[PREColor gray30Color]];
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableBorderColor:self.descriptionTextColor];
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PRETextField appearance] setEnabledBackgroundColor:self.clearColor];
    [[PRETextField appearance] setDisabledBackgroundColor:[PREColor gray30Color]];
    [[PRETextField appearance] setPrincipalTextColor:self.principalTextColor];
    [[PRETextField appearance] setPlaceholderTextColor:[PREColor gray50Color]];
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
    [[PREMoneyHeader appearance] setBaseColor:[PREColor gray30Color]];
    [[PREMoneyHeader appearance] setPrincipalTextColor:[PREColor whiteColor]];
    
    //  ---------------------------
    [[PRETicketOverviewHeader appearance] setStatusTopBackgroundColor:[PREColor corporateNewYorkPink]];
    [[PRETicketOverviewHeader appearance] setStatusMiddleBackgroundColor:[PREColor corporateCalicoOrange]];
    [[PRETicketOverviewHeader appearance] setStatusBottomBackgroundColor:[PREColor corporateCheninYellow]];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[PRETicketOverviewHeader class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
#pragma mark - TABLE VIEW SECTION
    //A reusable view that can be placed at the top or bottom of a table SECTION
    
    // ---------------------------
    [[PREParentBaseTableViewHeaderView appearance] setBaseColor:self.baseColor];
    [[PREParentBaseTableViewHeaderView appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewHeaderView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewHeaderView appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewHeaderView appearance] setEmptyTextColor:self.descriptionTextColor];
    
    // ---------------------------
    [[PREParentBaseTableViewFooterView appearance] setBaseColor:self.baseColor];
    [[PREParentBaseTableViewFooterView appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewFooterView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewFooterView appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewFooterView appearance] setEmptyTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PREParentBaseTableViewSectionView appearance] setBaseColor:self.baseColor];
    [[PREParentBaseTableViewSectionView appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseTableViewSectionView appearance] setPrincipalTextColor:[PREColor gray40Color]];
    [[PREParentBaseTableViewSectionView appearance] setDescriptionTextColor:[PREColor gray40Color]];
    [[PREParentBaseTableViewSectionView appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    //  ---------------------------
    [[BaseTableSection appearance] setBorderColor:[PREColor gray40Color]];
    
    //  ---------------------------
    [[PREMoneySection appearance] setBaseColor:[PREColor gray20Color]];
    [[PREMoneySection appearance] setTopSeparatorColor:[PREColor gray30Color]];
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
    [[PREInfoSummarySection appearance] setCircleBackgroundColor:[PREColor gray30Color]];
    [[PREInfoSummarySection appearance] setCircleBorderColor:self.principalTextColor];
    
    // ---------------------------
    [[PREResultsFooter appearance] setBaseColor:self.actionColor];
    [[PREResultsFooter appearance] setPrincipalTextColor:self.principalTextColor];
}

@end

