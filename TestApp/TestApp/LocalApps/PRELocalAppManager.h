//
//  PRELocalAppManager.h
//  Pre
//

#import "PREInitialData.h"
#import <Foundation/Foundation.h>

@class ApplicationCellDM;

typedef NS_ENUM(NSUInteger, LocalAppId) {
	nonLocalApp = 0,
	bussinessArchitectureLocalApp,
	CUILocalApp,
	converseLocalApp
};

@interface PRELocalAppManager : NSObject

//The initial data of the application sent by the server, needed in several views
@property (nonatomic, strong) PREInitialData* initialData;

/**
 *  Singleton
 *
 *  @return PREMicrokernelManager singleton instance
 */
+ (PRELocalAppManager*)sharedInstance;

/**
 Indicates if a local application is available

 @param localAppID
 @return YES if the local app with id localAppID is enabled
 */
- (BOOL)isEnabledForLocalApp:(LocalAppId)localAppID;

/**
 Starts Local app execution

 @param localAppID locap app Id
 @param viewController sender view controller
 @return NO in case local app is not enabled
 */
- (void)executeApp:(LocalAppId)localAppID forSender:(UIViewController*)viewController;

- (ApplicationCellDM*)ApplicationCellDMForAppId:(LocalAppId)localAppId;

@end

@interface UITabBarItem (NSURL)

- (id)initWithTitle:(NSString*)title imageURL:(NSURL*)imageURL placeHolder:(UIImage*)placeholder tag:(NSInteger)tag;

@end
