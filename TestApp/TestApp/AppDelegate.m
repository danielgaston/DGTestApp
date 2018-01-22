//
//  AppDelegate.m
//  TestApp
//
//  Copyright © 2018 DG. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initializeThemeManager];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Initialization Methods

- (void)initializeThemeManager
{
    [PREThemeManager sharedInstance];
}

#pragma mark - Helper Methods (Setup)

- (void)setupUI
{
    self.window = [[VOIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.tintColor = [VOCXColor primaryColor];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    // setup navigation bar Appearance
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBarTintColor:[VOCXColor titleBarColor]];
    [navigationBarAppearance setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"OpenSans" size:0]}];
    [navigationBarAppearance setBarStyle:UIBarStyleBlack];
    [navigationBarAppearance setTintColor:[UIColor whiteColor]];
    [navigationBarAppearance setTranslucent:NO];
    
    UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearance];
    [barButtonItemAppearance setTitleTextAttributes: @{NSFontAttributeName: [VOCXFont vipBarButtonFontLight]} forState:UIControlStateNormal];
    [barButtonItemAppearance setTintColor:[UIColor whiteColor]];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSFontAttributeName: [VOCXFont vipRegularFontWithSize:12]} forState:UIControlStateNormal];
    
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTextColor:[UIColor darkGrayColor]];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[VOIBasicSearchBar class]]] setTextColor:[UIColor darkGrayColor]];
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[VOIOrbitDashboardNavigationBarSearchBar class]]] setBackgroundColor:[UIColor colorWithRed:212./255. green:211./255. blue:233./255. alpha:1.]];
    
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [[UIColor whiteColor] colorWithAlphaComponent:0.6],NSForegroundColorAttributeName : [VOCXFont vipRegularFontWithSize:16]} forState:UIControlStateNormal];
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
}

- (void)setupUIForUse:(BOOL)firstTime
{
    if ([NSManagedObjectContext defaultContext] == nil)
        return;
    
    [self setupCrashLoggerUserName];
    
    if (self.window.rootViewController)
        [self.window.rootViewController dismissViewControllerAnimated:firstTime completion:nil];
    
    if (self.isiPad) {
        VOIMainIpadContainerController *container = [VOIMainIpadContainerController viewController];
        [container setupMainViewController:[UINavigationController.alloc initWithRootViewController:[VOIMainIpadViewController viewController]]];
        
        self.window.rootViewController = container;
        [self.window makeKeyAndVisible];
    } else {
        VOIMainIphoneViewController *compactDashboard = [VOIMainIphoneViewController viewController];
        self.window.rootViewController = compactDashboard;
        [self.window makeKeyAndVisible];
    }
}

- (void)cleanMainAppWindow
{
    [self.window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    self.window.rootViewController = nil;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TestApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
