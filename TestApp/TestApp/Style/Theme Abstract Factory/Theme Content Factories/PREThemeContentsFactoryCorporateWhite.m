//
//  PREThemeContentsFactoryCorporateWhite.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeContentsFactoryCorporateWhite.h"

#import "PREThemeMainViewSettingsWhite.h"
#import "PREThemeCircleViewSettingsGray.h"
#import "PREThemeCalendarViewSettingsWhiteAndGreenVidaLoca.h"
#import "PREThemeToastViewSettingsWhite.h"

@implementation PREThemeContentsFactoryCorporateWhite

#pragma mark - PREThemeContentsFactory Methods

- (NSString *)name
{
    return @"White Theme";
}

- (NSArray<PREThemeViewSettings*> *)prepareViewSettings
{
    return @[[PREThemeMainViewSettingsWhite new],
             [PREThemeCircleViewSettingsGray new],
             [PREThemeCalendarViewSettingsWhiteAndGreenVidaLoca new],
             [PREThemeToastViewSettingsWhite new]];
}

- (NSArray<PREThemeButtonSettings*> *)prepareButtonSettings
{
    return @[];
}

- (NSArray<PREThemeNavigationBarSettings*> *)prepareNavigationBarSettings
{
    return @[];
}

- (NSArray<PREThemeTabBarSettings *> *)prepareTabBarSettings{
    return @[];
}

- (NSArray<PREThemePageControlSettings *> *)preparePageControlSettings{
    return @[];
}

- (NSArray<PREThemeSegmentedControlSettings *> *)prepareSegmentedControlSettings{
    return @[];
}

- (NSArray<PREThemeSwitchSettings *> *)prepareSwitchSettings{
    return @[];
}

- (NSArray<PREThemeExclusiveTargetSettings*> *)prepareExclusiveTargetSettings
{
    return @[];
}

- (void)reset
{
    [[PREThemeMainViewSettingsWhite new] reset];
    [[PREThemeCircleViewSettingsGray new] reset];
    [[PREThemeCalendarViewSettingsWhiteAndGreenVidaLoca new] reset];
    [[PREThemeToastViewSettingsWhite new]reset];
}

@end
