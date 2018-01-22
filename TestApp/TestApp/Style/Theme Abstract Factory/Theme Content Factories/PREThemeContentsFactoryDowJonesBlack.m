//
//  PREThemeContentsFactoryDowJonesBlack.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeContentsFactoryDowJonesBlack.h"

#import "PREThemeMainViewSettingsBlackDJ.h"
#import "PREThemeCircleViewSettingsBlueCerulean.h"
#import "PREThemeCalendarViewSettingsBlackAndBlueCerulean.h"
#import "PREThemeToastViewSettingsWhite.h"
#import "PREThemeExclusiveTargetSettingsDowJones.h"

@implementation PREThemeContentsFactoryDowJonesBlack

- (NSString *)name
{
    return @"Black Theme";
}

- (NSArray<PREThemeViewSettings*> *)prepareViewSettings
{
    return @[[PREThemeMainViewSettingsBlackDJ new],
             [PREThemeCircleViewSettingsBlueCerulean new],
             [PREThemeCalendarViewSettingsBlackAndBlueCerulean new],
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
    [[PREThemeMainViewSettingsBlackDJ new] reset];
    [[PREThemeCircleViewSettingsBlueCerulean new] reset];
    [[PREThemeCalendarViewSettingsBlackAndBlueCerulean new] reset];
    [[PREThemeToastViewSettingsWhite new]reset];
}

@synthesize name;

@end

