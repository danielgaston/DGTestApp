//
//  PREBussinessArchitectureAppManager.m
//  Pre
//

#import "PRELocalAppManager.h"
#import "ApplicationCellDM.h"
#import "PREAlertManager.h"
#import "PREGroup.h"
#import "PRELocalAppRequestManager.h"
#import "PREWebImageManager.h"
#import "PREWorkplaceViewController.h"
#import "UIImage+Resize.h"

#import "PREConverseDefaultNetworkClient_FAKE.h"
#import "PREConverseOperationNetworkTestManager.h"
#import "PREConverseTestNetworkClient.h"

static PRELocalAppManager* baManagerInstance = nil;

@interface PRELocalAppManager ()

@property (nonatomic) PREConverseOperationNetworkTestManager* testManager; // TODO: REMOVE ME WHEN DEV FINISHED!!

@end

@implementation PRELocalAppManager

+ (PRELocalAppManager*)sharedInstance
{
	static dispatch_once_t once;

	dispatch_once(&once, ^{
		baManagerInstance = [[self alloc] init];
	});

	return baManagerInstance;
}

- (BOOL)isEnabledForLocalApp:(LocalAppId)localAppID
{
	switch (localAppID) {
	case bussinessArchitectureLocalApp:
	case CUILocalApp:
#if BUSSINESS_ARCHITECTURE_ENABLED
		return YES;
#else
		return NO;
#endif
	case converseLocalApp:
#if CONVERSE_ENABLED
		return YES;
#else
		return NO;
#endif
	default:
		return NO;
	}
}

- (ApplicationCellDM*)ApplicationCellDMForAppId:(LocalAppId)localAppId
{
	ApplicationCellDM* baApp = [[ApplicationCellDM alloc] init];
	switch (localAppId) {
	case bussinessArchitectureLocalApp:
	case CUILocalApp:
		baApp.name = @"Business Architecture";
		baApp.appID = [NSNumber numberWithInteger:[baApp.name hash]];
		baApp.localAppId = CUILocalApp;
		baApp.icon = [[PREImageManager sharedInstance] localImageNamed:@"ba_app_icon_default" useThemes:YES];
		return baApp;
	case converseLocalApp:
		baApp.name = @"Converse";
		baApp.appID = [NSNumber numberWithInteger:[baApp.name hash]];
		baApp.localAppId = converseLocalApp;
		baApp.icon = [[PREImageManager sharedInstance] localImageNamed:@"converse_app_icon_default" useThemes:YES];
		return baApp;
	default:
		return nil;
	}
}

- (void)executeApp:(LocalAppId)localAppID forSender:(UIViewController*)sender
{
	if (![self isEnabledForLocalApp:localAppID]) {
		return;
	}

	switch ((NSInteger)localAppID) {
	case bussinessArchitectureLocalApp:
	case CUILocalApp:
		[self displayCUIViewControllerForSender:sender];
		break;
	case converseLocalApp:
		[self displayConverseViewControllerForSender:sender];
		break;
	}
}

#pragma mark - private function

- (void)displayCUIViewControllerForSender:(UIViewController*)sender
{
	[[PRELocalAppRequestManager sharedInstance] getInitialDataWithResultBlock:^(ResultRequestStatus status, PREInitialData* initialData) {
		if (status == ResultRequestStatusSuccess) {
			self.initialData = initialData;
			NSArray<PREWorkplace*>* workplaceArray = initialData.workplaces;
			UITabBarController* tabBarController = [UITabBarController new];
			NSMutableArray* viewControllersMutableArray = [NSMutableArray new];
			for (PREWorkplace* workplace in workplaceArray) {
				UIStoryboard* tableViewStoryboard = [UIStoryboard storyboardWithName:@"workplace" bundle:nil];
				PREWorkplaceViewController* workplaceViewController = [tableViewStoryboard instantiateViewControllerWithIdentifier:@"workplaceViewController"];
				workplaceViewController.actionWorkplaceMainActionSortMenu = initialData.actionWorkplaceMainActionSortMenu;
				workplaceViewController.actionWorkplaceOntologyConcepts = initialData.actionWorkplaceOntologyConcepts;
				workplaceViewController.formMenu = initialData.formMenu;
				PREParentBaseNavigationController* navigationController = [[PREParentBaseNavigationController alloc] initWithRootViewController:workplaceViewController];
				workplaceViewController.title = workplace.title;
				navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:workplace.title imageURL:[[PRELocalAppRequestManager sharedInstance] iconForWorkPlace:workplace] placeHolder:[UIImage imageNamed:workplace.title] tag:0];
				workplaceViewController.workplaceId = workplace.id;
				[viewControllersMutableArray addObject:navigationController];
			}
			tabBarController.tabBar.translucent = NO;
			tabBarController.viewControllers = viewControllersMutableArray;
			[sender presentViewController:tabBarController animated:YES completion:nil];

		} else {
			[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
				data.title = NSLocalizedString(@"Error", nil);
				data.message = NSLocalizedString(@"INIT_LICENSE_ERROR_NO_NETWORK_TRANSIENT", nil);
				[data addButtonWithTitle:NSLocalizedString(@"Ok", nil) andAction:nil];
			}];
		}

		NSLog(@"Initial data ontology concepts %@", initialData.actionWorkplaceOntologyConcepts);

		for (PREGroup* group in initialData.actionWorkplaceOntologyConcepts) {
			NSLog(@"Group title %@", group.title);
		}
	}];
}

- (void)displayConverseViewControllerForSender:(UIViewController*)sender
{
	// TEST FAKE NETWORK-REQUEST CLIENT
	id<PREConverseAPINetworkClient, PREConverseDefaultNetworkClient_FAKE> fakeClient = [NSURLSession sharedSession];
	[fakeClient getInitialData_FAKE:^(PREConverseInitialDataResponse_FAKE* response) {
		NSLog(@"\n\n FAKE INITIAL DATA:\n%@ \n\n", response.initialDataModel.description);
	}];

	// TEST NETWORK-REQUEST CLIENT
	id<PREConverseAPINetworkClient, PREConverseTestNetworkClient> testClient = [PREConverseTestNetworkClient sharedURLSession];
	[testClient getTestJSON:^(PREConverseTestJSONResponse* response) {
		NSLog(@"\n\n NETWORK-REQUEST TEST JSON:\n%@ \n\n", response.JSON.description);
	}];

	// TEST NETWORK-OPERATION CLIENT
	self.testManager = [PREConverseOperationNetworkTestManager new];
	[self.testManager getTestJSON:^(PREConverseTestJSONResponse* response) {
		NSLog(@"\n\n NETWORK-OPERATION TEST JSON:\n%@ \n\n", response.JSON.description);
	}];

	[PREAlertManager displayWarningAlertWithData:^(PREAlertManagerData* data) {
		data.title = @"Info";
		data.message = @"Converse App is in development stage";
		[data addButtonWithTitle:NSLocalizedString(@"Ok", nil) andAction:nil];
	}];
}

@end

@implementation UITabBarItem (NSURL)

- (id)initWithTitle:(NSString*)title imageURL:(NSURL*)imageURL placeHolder:(UIImage*)placeholder tag:(NSInteger)tag
{
	self = [self initWithTitle:title image:placeholder tag:tag];
	[PREWebImageManager downloadImageWithURL:imageURL
						 withCompletionBlock:^(UIImage* image, NSError* error, BOOL finished, NSURL* imageURL) {
							 if (!error && image) {
								 self.image = [UIImage image:image scaledToSize:CGSizeMake(30, 30)];
							 }
						 }];
	return self;
}

@end
