//
//  PREThemeStore.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeStore.h"

@implementation PREThemeStore

#pragma mark - Public Methods

- (PRETheme *)initializeThemeWithMode:(PREThemeMode)themeMode
{
    PRETheme *theme = [self createThemeWithMode:themeMode];
    [theme prepare];
    
    return theme;
}

- (NSArray <PREThemeStoreHelper *> *)availableThemeConfigurations
{
    return @[];
}

- (NSArray<PRETheme *> *)availableThemes
{
    return @[];
}

- (NSArray<PREThemeModeHelper*> *)availableThemeModes
{
    return @[];
}

#pragma mark - Private Methods

- (PRETheme *)createThemeWithMode:(PREThemeMode)themeMode
{
    return [[PRETheme alloc] init];
}

@end
