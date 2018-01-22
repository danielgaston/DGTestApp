//
//  AppDelegate.h
//  TestApp
//
//  Created by Daniel Iglesias on 22/01/2018.
//  Copyright © 2018 DG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

