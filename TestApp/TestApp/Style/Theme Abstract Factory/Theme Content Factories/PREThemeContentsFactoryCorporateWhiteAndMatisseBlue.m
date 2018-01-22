//
//  PREThemeContentsFactoryCorporateWhiteAndMatisseBlue.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeContentsFactoryCorporateWhiteAndMatisseBlue.h"
#import "PREThemeMainViewSettingsWhiteAndBlueMatisse.h"
#import "PREThemeCircleViewSettingsBlueMatisse.h"
#import "PREThemeCalendarViewSettingsWhiteAndBlueMatisse.h"
#import "PREThemeToastViewSettingsWhite.h"

@implementation PREThemeContentsFactoryCorporateWhiteAndMatisseBlue

#pragma mark - PREThemeContentsFactory Methods

- (NSString *)name
{
    return @"White and Matisse Blue Theme";
}

- (NSArray<PREThemeViewSettings*> *)prepareViewSettings
{
	return @[[PREThemeMainViewSettingsWhiteAndBlueMatisse new],
             [PREThemeCircleViewSettingsBlueMatisse new],
             [PREThemeCalendarViewSettingsWhiteAndBlueMatisse new],
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
    [[PREThemeMainViewSettingsWhiteAndBlueMatisse new] reset];
    [[PREThemeCircleViewSettingsBlueMatisse new] reset];
    [[PREThemeCalendarViewSettingsWhiteAndBlueMatisse new] reset];
    [[PREThemeToastViewSettingsWhite new]reset];
}

@end
