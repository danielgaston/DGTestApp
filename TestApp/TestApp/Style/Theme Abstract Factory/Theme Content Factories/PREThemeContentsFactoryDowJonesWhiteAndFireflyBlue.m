//
//  PREThemeContentsFactoryDowJonesWhiteAndFireflyBlue.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeContentsFactoryDowJonesWhiteAndFireflyBlue.h"

#import "PREThemeMainViewSettingsWhiteAndBlueFirefly.h"
#import "PREThemeCircleViewSettingsBlueCerulean.h"
#import "PREThemeCalendarViewSettingsWhiteAndBlueCerulean.h"
#import "PREThemeToastViewSettingsWhite.h"
#import "PREThemeExclusiveTargetSettingsDowJones.h"

@implementation PREThemeContentsFactoryDowJonesWhiteAndFireflyBlue

- (NSString *)name
{
    return @"White and Firefly Blue Theme";
}

- (NSArray<PREThemeViewSettings*> *)prepareViewSettings
{
    return @[[PREThemeMainViewSettingsWhiteAndBlueFirefly new],
             [PREThemeCircleViewSettingsBlueCerulean new],
             [PREThemeCalendarViewSettingsWhiteAndBlueCerulean new],
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
    [[PREThemeMainViewSettingsWhiteAndBlueFirefly new] reset];
    [[PREThemeCircleViewSettingsBlueCerulean new] reset];
    [[PREThemeCalendarViewSettingsWhiteAndBlueCerulean new] reset];
    [[PREThemeToastViewSettingsWhite new]reset];
}

@end
