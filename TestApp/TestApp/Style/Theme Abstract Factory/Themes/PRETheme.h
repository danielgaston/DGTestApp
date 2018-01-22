//
//  PRETheme.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PREThemeManager.h"
#import "PREThemeViewSettings.h"
#import "PREThemeButtonSettings.h"
#import "PREThemeNavigationBarSettings.h"
#import "PREThemeExclusiveTargetSettings.h"
#import "PREThemeTabBarSettings.h"
#import "PREThemePageControlSettings.h"
#import "PREThemeSegmentedControlSettings.h"
#import "PREThemeSwitchSettings.h"

@interface PRETheme : NSObject

@property PREThemeType *themeType;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray <PREThemeViewSettings *> *viewSettings;
@property (strong, nonatomic) NSArray <PREThemeButtonSettings *> *buttonSettings;
@property (strong, nonatomic) NSArray <PREThemeNavigationBarSettings*> *navigationBarSettings;
@property (strong, nonatomic) NSArray <PREThemeTabBarSettings*> *tabBarSettings;
@property (strong, nonatomic) NSArray <PREThemePageControlSettings*> *pageControlSettings;
@property (strong, nonatomic) NSArray <PREThemeSegmentedControlSettings*> *segmentedControlSettings;
@property (strong, nonatomic) NSArray <PREThemeSwitchSettings*> *switchSettings;
@property (strong, nonatomic) NSArray <PREThemeExclusiveTargetSettings*> *exclusiveTargetSettings;

- (instancetype)createTheme:(PREThemeType)themeType;

- (void)prepare;
- (void)reset;

@end
