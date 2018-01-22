//
//  PREThemeContentsFactoryCorporateBlack.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeContentsFactoryCorporateBlack.h"

#import "PREThemeMainViewSettingsBlack.h"
#import "PREThemeCircleViewSettingsGray.h"
#import "PREThemeCalendarViewSettingsBlackAndBlueViking.h"
#import "PREThemeToastViewSettingsWhite.h"


@implementation PREThemeContentsFactoryCorporateBlack

#pragma mark - PREThemeContentsFactory Methods

- (NSString *)name
{
    return @"Black Theme";
}

- (NSArray<PREThemeViewSettings*> *)prepareViewSettings
{
    return @[[PREThemeMainViewSettingsBlack new],
             [PREThemeCircleViewSettingsGray new],
             [PREThemeCalendarViewSettingsBlackAndBlueViking new],
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
    [[PREThemeMainViewSettingsBlack new] reset];
    [[PREThemeCircleViewSettingsGray new] reset];
    [[PREThemeCalendarViewSettingsBlackAndBlueViking new] reset];
    [[PREThemeToastViewSettingsWhite new]reset];
}

@end
