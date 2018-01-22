//
//  PREThemeViewSettingsWhiteAndBlueFirefly.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeMainViewSettingsWhiteAndBlueFirefly.h"

@interface PREThemeMainViewSettingsWhiteAndBlueFirefly()

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

@implementation PREThemeMainViewSettingsWhiteAndBlueFirefly

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"WhiteAndBlueFirefly Views Settings";
    }
    return self;
}


#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.baseColor = isNullify ? nil : [PREColor whiteColor];
    self.baseSelectionColor = isNullify ? nil : [PREColor gray80Color];
    self.titleTextColor = isNullify ? nil : [PREColor corporateFireflyBlue];
    self.principalTextColor = isNullify ? nil : [PREColor corporateFireflyBlue];
    self.descriptionTextColor = isNullify ? nil : [PREColor gray30Color];
    self.emptyTextColor = isNullify ? nil : [PREColor gray40Color];
    self.supportDefaultButtonColor = isNullify ? nil : [PREColor corporateChristiGreen];
    self.supportDeleteButtonColor = isNullify ? nil : [PREColor corporateShirazRed];
    self.supportInfoButtonColor = isNullify ? nil : [PREColor corporateCeruleanBlue];
    self.clearColor = isNullify ? nil : [PREColor clearColor];
    self.separatorColor = isNullify ? nil : [PREColor gray50Color];
    self.actionColor = isNullify ? nil : [PREColor corporateCeruleanBlue];
    self.statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationBarTintColor = [PREColor corporateFireflyBlue];
    self.accessoryViewColor = [PREColor gray50Color];
    
    self.DEFAULT_COLOR = [PREColor blackColor];
}

#pragma mark - Helper Methods

- (void)initializeContentElements
{
#pragma mark - NATIVE UIKIT VIEWS
    
    // ---------------------------
    [[UIButton appearance] setTintColor:self.actionColor];
    
    [[PRETextButton appearance] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[PREImageButton appearance] setTintColor:self.actionColor];
    [[PREUserDataButton appearance] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[PRERoundedButton appearance] setBackgroundColor:self.actionColor];
    [[PRERoundedButton appearance] setTitleColor:[PREColor whiteColor] forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIRefreshControl appearance] setTintColor:self.descriptionTextColor];
    // attributed title must be defined here to set the proper color
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"refresh_control_title", nil)             attributes:@{NSForegroundColorAttributeName:self.descriptionTextColor?:self.DEFAULT_COLOR}];
    [[UIRefreshControl appearance] setAttributedTitle:[[NSAttributedString alloc]initWithAttributedString:title]];
    
    // ---------------------------
    // Affects to UIBarButtonItems in top navigation bar
    [[UINavigationBar appearance] setTintColor:[PREColor whiteColor]];
    // UINavigationBar --> ´traslucency' defined by each PREParentView_XX_Controller
	// This is needed for view controllers that does not inherit from ours (photo gallery, and email composer basically)
	[[UINavigationBar appearance] setBarTintColor:self.navigationBarTintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[PREColor whiteColor]?:self.DEFAULT_COLOR}];
    if (@available(iOS 11.0, *))
        [[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName:[PREColor whiteColor]?:self.DEFAULT_COLOR}];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]] setTintColor:[PREColor whiteColor]];
    
    // ---------------------------
    [[UITableView appearance] setBackgroundColor:[PREColor whiteColor]];
    
    // ---------------------------
    [[UICollectionView appearance] setBackgroundColor:[PREColor whiteColor]];
    
    // ---------------------------
    [[UIScrollView appearance] setBackgroundColor:self.clearColor];
    
    // ---------------------------
    [[UIActivityIndicatorView appearance] setColor:[PREColor gray20Color]];
    [[CustomActivityIndicator appearance] setBackgroundColor:[[PREColor blackColor] colorWithAlphaComponent:0.4]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setTextColor:[PREColor gray20Color]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[UIActivityIndicatorView class]]] setBackgroundColor:self.clearColor];
    
    // ---------------------------
    [[UIToolbar appearance] setTintColor:self.actionColor];
    [[UIToolbar appearance] setBarTintColor:self.baseColor];
    [[UIToolbar appearance] setTranslucent:YES];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.actionColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIToolbar class]]] setTintColor:self.actionColor];
    
    // ---------------------------
    [[UISearchBar appearance] setTintColor:self.principalTextColor]; // cursor + search bar buttons.
    [[UISearchBar appearance] setBarTintColor:self.baseColor]; // bg color
    [[UISearchBar appearance] setSearchTextPositionAdjustment:UIOffsetMake(10, 0)];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setDefaultTextAttributes:@{NSForegroundColorAttributeName : self.principalTextColor?:self.DEFAULT_COLOR}];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName : self.descriptionTextColor?:self.DEFAULT_COLOR}]];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
    //    [[UITabBar appearance] setBarTintColor:[PREColor gray70Color]];
    //    [[UITabBar appearance] setTintColor:self.actionColor];
    //    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    //    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.principalTextColor?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    //    [[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: self.actionColor?:self.DEFAULT_COLOR} forState:UIControlStateSelected];
    //    [[UIImageView appearanceWhenContainedInInstancesOfClasses:@[[UITabBar class]]] setTintColor:self.principalTextColor];
    
    // ---------------------------
    //    [[UIPageControl appearance] setPageIndicatorTintColor:self.titleTextColor];
    //    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:self.principalTextColor];
    //    [[UIPageControl appearance] setBackgroundColor:self.baseColor];
    
    
    // ---------------------------
    [[UISegmentedControl appearance] setTintColor:self.actionColor];
    [[PRESegmentedControl appearance] setTintColor:self.actionColor];
    [[PRESegmentedControl appearance] setBackgroundColor:self.baseColor];
    //    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[PREColor gray90Color]?:self.DEFAULT_COLOR} forState:UIControlStateNormal];
    //    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:self.baseColor?:self.DEFAULT_COLOR} forState:UIControlStateSelected];
    //    [[UISegmentedControl appearance] setBackgroundColor:[PREColor gray40Color]];
    
    // ---------------------------
    [[PRESwitch appearance] setThumbTintColor:[PREColor gray70Color]];
    [[PRESwitch appearance] setTintColor:[PREColor gray80Color]];
    [[PRESwitch appearance] setOnTintColor:self.actionColor];
    [[PRESwitch appearance] setBackgroundColor:[PREColor gray90Color]];
    
    
#pragma mark - CUSTOM UIKIT VIEWS
    
    // TODO: Since There is no way to unify UIViews (UIView, UITextField, UITextView, UIStackView...) into a PREParentBaseView, each particular view implements PREAppearance protocol on its own
    //  ---------------------------
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableBackgroundColor:self.baseColor];
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableBorderColor:[PREColor gray90Color]];
    [[PRESuggestionsTextFieldView appearance] setSuggestionTableTextColor:self.principalTextColor];
    
    // ---------------------------
    [[PRETextField appearance] setEnabledBackgroundColor:self.clearColor];
    [[PRETextField appearance] setDisabledBackgroundColor:self.clearColor];
    [[PRETextField appearance] setPrincipalTextColor:self.principalTextColor];
    [[PRETextField appearance] setPlaceholderTextColor:[PREColor gray60Color]];
    [[PRETextField appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    //  ---------------------------
    //TODO: CLTokenInputView (POD) should be reimplemented to expose the necessary UI properties. TokenInputCell uses it but cannot set it up
    
    //  ---------------------------
    [[PREAvatarImageView appearance] setBackgroundColor:[PREColor gray30Color]];
    
    //  ---------------------------
    [[PRENameValuePairStackView appearance] setTitleTextColor:self.titleTextColor];
    [[PRENameValuePairStackView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PRENameValuePairStackView appearance] setDescriptionTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[ListWithHeaderButtonsContainerView class]]] setBackgroundColor:self.actionColor];
    
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
    [[PREParentBaseCollectionReusableView appearance] setHeaderBackgroundColor:self.baseColor];
    [[PREParentBaseCollectionReusableView appearance] setHeaderTextColor:self.principalTextColor];
    
    // ---------------------------
    [[BaseTextViewCell appearance] setEditModePlaceholderColor:[PREColor gray40Color]];
    [[BaseTextViewCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[BaseTextViewCell appearance] setEditModeEditableTextColor:self.principalTextColor];
    [[BaseTextViewCell appearance] setEditModeNotEditableTextColor:self.descriptionTextColor];
    [[BaseTextViewCell appearance] setReadModePlaceholderColor:[PREColor gray40Color]];
    [[BaseTextViewCell appearance] setReadModeTitleColor:self.titleTextColor];
    [[BaseTextViewCell appearance] setReadModeTextColor:self.descriptionTextColor];

    // ---------------------------
    [[PREDynamicBaseTextViewCell appearance] setEditModePlaceholderColor:[PREColor gray40Color]];
    [[PREDynamicBaseTextViewCell appearance] setEditModeActiveTitleColor:self.titleTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeInactiveTitleColor:self.descriptionTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeEditableTextColor:self.principalTextColor];
    [[PREDynamicBaseTextViewCell appearance] setEditModeNotEditableTextColor:self.descriptionTextColor];
    [[PREDynamicBaseTextViewCell appearance] setReadModePlaceholderColor:[PREColor gray40Color]];
    [[PREDynamicBaseTextViewCell appearance] setReadModeActiveTitleColor:self.titleTextColor];
    [[PREDynamicBaseTextViewCell appearance] setReadModeTextColor:self.descriptionTextColor];

    // ---------------------------
    [[ConnectionEntityTableViewCell appearance] setReachableColor:self.principalTextColor];
    [[ConnectionEntityTableViewCell appearance] setNotReachableColor:[PREColor gray50Color]];
    [[ConnectionEntityTableViewCell appearance] setUnauthorizedColor:self.supportDeleteButtonColor];
    [[ConnectionEntityTableViewCell appearance] setUnknownColor:[PREColor gray50Color]];
    [[ConnectionEntityTableViewCell appearance] setWrongPortColor:self.supportDeleteButtonColor];
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[ConnectionEntityTableViewCell class]]] setColor:[PREColor gray50Color]];
    
    // ---------------------------
    [[NewEventCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[NewEventCell appearance] setEditModeTextColor:self.descriptionTextColor];
    [[NewEventCell appearance] setEditModeBookmarkedTextColor:self.actionColor];
    [[NewEventCell appearance] setEditModeNotBookmarkedTextColor:self.descriptionTextColor];
    
    // ---------------------------
    [[EventSessionCell appearance] setEditModeBookmarkedTextColor:[PREColor corporateDodgerBlue]];
    [[EventSessionCell appearance] setEditModeNotBookmarkedTextColor:[PREColor gray20Color]];
    [[EventSessionCell appearance] setEditModeNowTextColor:self.supportDeleteButtonColor];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[MGSwipeTableCell class]]] setTitleColor:[PREColor whiteColor] forState:UIControlStateNormal];
    
    // ---------------------------
    [[EditComboBoxCell appearance] setEditModeTitleColor:self.titleTextColor];
    [[EditComboBoxCell appearance] setEditModeTextColor:self.principalTextColor];
    [[EditComboBoxCell appearance] setReadModeTitleColor:self.titleTextColor];
    [[EditComboBoxCell appearance] setReadModeTextColor:self.principalTextColor];

    // ---------------------------
    [[PREMoneyCell appearance] setPositiveAmountTextColor:[PREColor gray10Color]];
    [[PREMoneyCell appearance] setNegativeAmountTextColor:[PREColor corporateShirazRed]];
    
    // ---------------------------
    [[PRETicketViewCell appearance] setStatusTopBackgroundColor:[PREColor corporateNewYorkPink]];
    [[PRETicketViewCell appearance] setStatusMiddleBackgroundColor:[PREColor corporateCalicoOrange]];
    [[PRETicketViewCell appearance] setStatusBottomBackgroundColor:[PREColor corporateCheninYellow]];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[MultiCheckCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];

    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[CommentCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[SingleMethodCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[SearchResultCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[VisualListCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[PaginationTableViewCell class]]] setColor:[PREColor gray90Color]];
    
    // ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[TokenInputCell class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[UITableView appearanceWhenContainedInInstancesOfClasses:@[[InlineMultiCheckCell class]]] setBackgroundColor:self.principalTextColor];
    [[UITableViewCell appearanceWhenContainedInInstancesOfClasses:@[[InlineMultiCheckCell class]]] setBackgroundColor:self.principalTextColor];
    
    // ---------------------------
    [[PREChatSessionCell appearance] setExceptionalTextColor:self.descriptionTextColor];
    
    // ---------------------------
    [[MagazineCell appearance] setImageBorderColor:[PREColor gray50Color]];
    
    //  ---------------------------
    [[CellImage appearance] setImageBorderColor:[PREColor gray10Color]];
    [[CellImage appearance] setImageShadowColor:[PREColor blackColor]];
    
    // ---------------------------
    [[PRESimpleCell appearance] setSearchHighlightedTextColor:[PREColor corporateShirazRed]];
    
    // ---------------------------
    [[PRESettingsSimpleCell appearance] setBaseColor:[PREColor whiteColor]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[[PRESettingsSimpleCell class]]] setTextColor:self.principalTextColor];
    
    // ---------------------------
    [[PRESettingsDetailThemeTableViewCell appearance] setBaseColor:[PREColor whiteColor]];
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
    [[PREParentBaseViewController appearance] setNavigationSearchBarBackgroundColor:[PREColor gray90Color]];
    [[PREParentBaseViewController appearance] setNavigationSearchBarBorderColor:[PREColor gray40Color]];
    [[PREParentBaseViewController appearance] setNavigationSearchBarButtonTintColor:[PREColor whiteColor]];
    [[PREParentBaseViewController appearance] setNavigationSearchBarTextColor:[PREColor lightGrayColor]];

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
    [[PREParentBaseTableViewController appearance] setSectionBackgroundColor:[PREColor gray80Color]];
    [[PREParentBaseTableViewController appearance] setSectionTextColor:self.titleTextColor];
	[[PREParentBaseTableViewController appearance] setNavigationBarColor:self.navigationBarTintColor];
	[[PREParentBaseTableViewController appearance] setNavigationBarTransparency:NO];
    
    // ---------------------------
    [[PREParentBaseSplitViewController appearance] setBaseColor:[PREColor gray80Color]]; // needed to show splitView separator line color
    [[PREParentBaseSplitViewController appearance] setCustomStatusBarStyle:self.statusBarStyle];
    [[PREParentBaseSplitViewController appearance] setTitleTextColor:self.titleTextColor];
    [[PREParentBaseSplitViewController appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseSplitViewController appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseSplitViewController appearance] setEmptyTextColor:self.emptyTextColor];
    
    // ---------------------------
    // Info: changing the background color for the cancel action button is not supported.
    // There are hacks to colour our custom action buttons block, but there is no point to have heterogenous colors there, so that PREParentBaseAppearanceProtocol (baseColor) is not necessary.
    [[PREParentBaseAlertViewController appearance] setAlertTitleTextColor:self.principalTextColor];
    [[PREParentBaseAlertViewController appearance] setAlertSubtitleTextColor:self.descriptionTextColor];
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
    [[BaseTableVC appearance] setSectionBackgroundColor:[PREColor gray90Color]];
    [[BaseTableVC appearance] setSectionTextColor:[PREColor corporateCeruleanBlue]];
    
    // ---------------------------
    [[ConnectionEntitiesVC appearance] setSecondaryViewTextColor:self.principalTextColor];
    [[ConnectionEntitiesVC appearance] setSecondaryViewDeleteColor:[PREColor corporateCinnabarRed]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewEditColor:[PREColor corporateJaffaOrange]];
    [[ConnectionEntitiesVC appearance] setSecondaryViewDuplicateColor:[PREColor corporateWattleYellow]];
    
    // ---------------------------
    [[LoginScreenVC appearance] setCustomStatusBarStyle:UIStatusBarStyleDefault];
    [[LoginScreenVC appearance] setPlaceholderColor:[PREColor gray70Color]];
    [[LoginScreenVC appearance] setLoginButtonBackgroundColor:self.actionColor];
    [[LoginScreenVC appearance] setLoginWithGoogleButtonBackgroundColor:[PREColor corporateRegentGray]];
	[[LoginScreenVC appearance] setGoogleSignBackgroundColor:[PREColor gray10Color]];
	[[LoginScreenVC appearance] setGoogleSignOKButtonBackgroundColor:[PREColor corporateWellReadRed]];
    [[LoginScreenVC appearance] setCredentialsBorderColor:[PREColor corporateRegentGray]];
    [[LoginScreenVC appearance] setCredentialsSeparatorColor:[PREColor corporateRegentGray]];
    [[LoginScreenVC appearance] setOrSeparatorColor:[PREColor corporateRegentGray]];
 
    //  ---------------------------
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[EventDetailsVC class]]] setTitleColor:[PREColor whiteColor] forState:UIControlStateNormal];
    
    //  ---------------------------
    [[UICollectionView appearanceWhenContainedInInstancesOfClasses:@[[SingleEntryPointMenuVC class]]] setBackgroundColor:[PREColor whiteColor]];
    
    //  ---------------------------
    [[ChartVC appearance] setChartBackgroundColor:self.baseColor];
    [[ChartVC appearance] setChartTextColor:self.principalTextColor];
    [ChartFactory setChartViewTextColor:self.principalTextColor]; // static class
    [ChartFactory setChartViewBackgroundColor:self.baseColor]; // static class
    
    // ---------------------------
    [[CalendarVC appearance] setToolbarButtonTintColor:[PREColor whiteColor]];
    
    //  ---------------------------
    [[FullTextVC appearance] setEditModeTextColor:self.principalTextColor];
    [[FullTextVC appearance] setReadModeTextColor:self.descriptionTextColor];
    
    //  ---------------------------
    [[PREContentSelectorViewController appearance] setHeaderContainerBackgroundColor:self.baseColor];
    [[PREContentSelectorViewController appearance] setSegmentContainerBackgroundColor:self.baseColor];
    [[PREContentSelectorViewController appearance] setContentContainerBackgroundColor:self.baseColor];
    
    // ---------------------------
    [[NewCredentialEditor appearance] setBorderDefaultColor:[PREColor gray90Color]];
    [[NewCredentialEditor appearance] setBorderSelectedColor:[PREColor gray60Color]];
    [[NewCredentialEditor appearance] setBorderErrorColor:[PREColor corporateShirazRed]];
    [[NewCredentialEditor appearance] setSaveAndLaunchButtonBgColor:[PREColor corporateCeruleanBlue]];
    [[NewCredentialEditor appearance] setSaveButtonBgColor:[PREColor corporateCeruleanBlue]];
    
    //  ---------------------------
    [[ListWithHeaderVC appearance] setTablePageControlColor:[PREColor gray60Color]];
    
    //  ---------------------------
    [[FormWithImageHeaderVC appearance] setHeaderImageBlurColor:(PREColor *)[[PREColor blackColor] colorWithAlphaComponent:0.4]];
    [[FormWithImageHeaderVC appearance] setHeaderImageBorderColor:[PREColor gray10Color]];
    [[FormWithImageHeaderVC appearance] setHeaderTitleTextColor:self.titleTextColor];
    [[FormWithImageHeaderVC appearance] setHeaderPrincipalTextColor:self.principalTextColor];
    
    //  ---------------------------
    [[GridImagePickerVC appearance] setGridColor:[PREColor gray10Color]];
    // image is drag and when moved, the selected grid cell gets highlighted in green in this case
    [[GridImagePickerVC appearance] setGridImagePlacementBackgroundColor:(PREColor *)[[PREColor corporateSpringLeavesGreenColor] colorWithAlphaComponent:0.4]];
    [[GridImagePickerVC appearance] setLoadedGridImageBorderColor:[PREColor gray10Color]];
    [[GridImagePickerVC appearance] setUploadedGridImageBorderColor:[PREColor corporateSpringLeavesGreenColor]];
    [[GridImagePickerVC appearance] setExceptionGridImageBorderColor:[PREColor corporateAuChicoRed]];
    
    //  ---------------------------
    [[LibraryCollectionVC appearance] setSeparatorColor:self.separatorColor];
    
    //  ---------------------------
    [[BrochureDetailsVC appearance] setBrochureBorderColor:[PREColor gray40Color]];
    [[UIWebView appearanceWhenContainedInInstancesOfClasses:@[[BrochureDetailsVC class]]] setBackgroundColor:[PREColor whiteColor]];
    
    // ---------------------------
    [[EventSessionVC appearance] setActiveBookmarkTextColor:self.actionColor];
    [[EventSessionVC appearance] setInactiveBookmarkTextColor:self.principalTextColor];
    [[EventSessionVC appearance] setNowTextColor:self.supportDeleteButtonColor];
  
    // ---------------------------
    [[PREAlertContainerViewController appearance] setBaseColor:(PREColor*)[[PREColor gray20Color] colorWithAlphaComponent:0.2]];
    
    //  ---------------------------
    [[PREToastVC appearance] setBaseColor:(PREColor*)[self.baseColor colorWithAlphaComponent:0.7]];
    
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
    [[PRESettingsMasterTableViewController appearance] setBaseColor:[PREColor gray90Color]]; // needed to show splitView separator line color
    
    // ---------------------------
    [[PRESettingsDetailServerViewController appearance] setBaseColor:[PREColor gray90Color]]; // needed to show splitView separator line color
    [[PRESettingsDetailServerViewController appearance] setSeparatorColor:[PREColor gray90Color]]; // exceptional case due to cell bg color
    [[PRESettingsDetailServerViewController appearance] setEditButtonBackgroundColor:self.supportDefaultButtonColor];
    [[PRESettingsDetailServerViewController appearance] setDeleteButtonBackgroundColor:self.supportDeleteButtonColor];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[PRESettingsDetailServerViewController class]]] setTitleColor:self.baseColor forState:UIControlStateNormal];
    
    // ---------------------------
    [[PRESettingsDetailXMPPViewController appearance] setBaseColor:[PREColor gray90Color]];
    
    // ---------------------------
    [[PRESettingsDetailThemeTableViewController appearance] setBaseColor:[PREColor gray90Color]];
    [[PRESettingsDetailThemeTableViewController appearance] setSeparatorColor:[PREColor gray90Color]];
    
#pragma mark - TABLE VIEW HEADERS

    // ---------------------------
    [[PREMoneyHeader appearance] setBaseColor:[PREColor corporateFireflyBlue]];
    [[PREMoneyHeader appearance] setPrincipalTextColor:[PREColor whiteColor]];
    
    //  ---------------------------
    [[PRETicketOverviewHeader appearance] setStatusTopBackgroundColor:[PREColor corporateShirazRed]];
    [[PRETicketOverviewHeader appearance] setStatusMiddleBackgroundColor:[PREColor corporateCalicoOrange]];
    [[PRETicketOverviewHeader appearance] setStatusBottomBackgroundColor:[PREColor corporateCheninYellow]];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[PRETicketOverviewHeader class]]] setTitleColor:self.actionColor forState:UIControlStateNormal];
    
    
#pragma mark - TABLE VIEW SECTIONS
    
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
    [[PREParentBaseTableViewSectionView appearance] setPrincipalTextColor:self.principalTextColor];
    [[PREParentBaseTableViewSectionView appearance] setDescriptionTextColor:self.descriptionTextColor];
    [[PREParentBaseTableViewSectionView appearance] setAccessoryViewColor:self.accessoryViewColor];
    
    //  ---------------------------
    [[BaseTableSection appearance] setBorderColor:[PREColor gray40Color]];
    
    //  ---------------------------
    [[PREMoneySection appearance] setBaseColor:[PREColor corporateNileBlue]];
    [[PREMoneySection appearance] setTopSeparatorColor:[PREColor corporateFireflyBlue]];
    [[PREMoneySection appearance] setTitleTextColor:[PREColor whiteColor]];
    [[PREMoneySection appearance] setPrincipalTextColor:[PREColor whiteColor]];
    [[PREMoneySection appearance] setPositiveAmountTextColor:[PREColor whiteColor]];
    [[PREMoneySection appearance] setNegativeAmountTextColor:[PREColor corporateCarnationPink]];

    // ----------------------------
    [[PREAccordionSection appearance] setBaseColor:self.baseColor];
    [[PREAccordionSection appearance] setTitleTextColor:self.titleTextColor];
    [[PREAccordionSection appearance] setPrincipalTextColor:self.baseColor];
    [[PREAccordionSection appearance] setDescriptionTextColor:self.descriptionTextColor];
	[[PREAccordionSection appearance] setBorderColor:self.clearColor];
    
    // ---------------------------
    [[PREInfoSummarySection appearance] setCircleBackgroundColor:[PREColor gray90Color]];
    [[PREInfoSummarySection appearance] setCircleBorderColor:[PREColor gray10Color]];

    // ---------------------------
    [[PREResultsFooter appearance] setBaseColor:[PREColor corporateFireflyBlue]];
    [[PREResultsFooter appearance] setPrincipalTextColor:[PREColor whiteColor]];
}

@end


