//
//  PREThemeContentsFactory.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PREThemeViewSettings.h"
#import "PREThemeButtonSettings.h"
#import "PREThemeNavigationBarSettings.h"
#import "PREThemeTabBarSettings.h"
#import "PREThemePageControlSettings.h"
#import "PREThemeSegmentedControlSettings.h"
#import "PREThemeExclusiveTargetSettings.h"
#import "PREThemeSwitchSettings.h"

@protocol PREThemeContentsFactory <NSObject>

@property (nonatomic, strong) NSString *name;

- (NSArray <PREThemeViewSettings*>*)prepareViewSettings;
- (NSArray <PREThemeButtonSettings*>*)prepareButtonSettings;
- (NSArray <PREThemeNavigationBarSettings*>*)prepareNavigationBarSettings;
- (NSArray <PREThemeTabBarSettings*>*)prepareTabBarSettings;
- (NSArray <PREThemePageControlSettings*>*)preparePageControlSettings;
- (NSArray <PREThemeSegmentedControlSettings*>*)prepareSegmentedControlSettings;
- (NSArray <PREThemeSwitchSettings*>*)prepareSwitchSettings;
- (NSArray <PREThemeExclusiveTargetSettings*>*)prepareExclusiveTargetSettings;

- (void)reset;

@end
