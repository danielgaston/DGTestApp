//
//  PREThemeStoreDowJones.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeStoreDowJones.h"
#import "PREThemeDowJones.h"
#import "PREThemeContentsFactoryDowJonesBlack.h"
#import "PREThemeContentsFactoryDowJonesWhiteAndFireflyBlue.h"

@interface  PREThemeStoreDowJones ()

@property (strong, nonatomic) id<PREThemeContentsFactory> themeContentsFactory;

@end

@implementation PREThemeStoreDowJones

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Dow Jones Theme Store";
    }
    return self;
}

#pragma mark - Overriden Methods

- (PRETheme *)initializeThemeWithMode:(PREThemeMode)themeMode
{
    self.themeContentsFactory = [self obtainContentsFactoryForMode:themeMode];
    PRETheme *theme = theme = [[PREThemeDowJones alloc] initWithThemeContentsFactory:self.themeContentsFactory];
    [theme prepare];
    
    return theme;
}

- (NSArray <PREThemeStoreHelper *> *)availableThemeConfigurations
{
    __block NSMutableArray *themeConfigurations = @[].mutableCopy;
    
    [[self availableThemes] enumerateObjectsUsingBlock:^(PRETheme*  _Nonnull theme, NSUInteger idx, BOOL * _Nonnull stop) {
        [[self availableThemeModes] enumerateObjectsUsingBlock:^(PREThemeModeHelper* _Nonnull modeHelper, NSUInteger idx, BOOL * _Nonnull stop) {
            
            PREThemeStoreHelper *helper = [PREThemeStoreHelper new];
            helper.theme = theme;
            helper.themeMode = modeHelper;
            helper.themeContent = [self obtainContentsFactoryForMode:modeHelper.mode];
            [themeConfigurations addObject:helper];
        }];
    }];
    
    return themeConfigurations;
}

- (NSArray<PRETheme *> *)availableThemes
{
    return @[[[PREThemeDowJones alloc] init]];
}

- (NSArray<PREThemeModeHelper*> *)availableThemeModes
{
    return @[[[PREThemeModeHelper alloc] initWithMode:kPREThemeModeBlack],
             [[PREThemeModeHelper alloc] initWithMode:kPREThemeModeWhiteAndFireflyBlue]];
}


#pragma mark - Helper Methods

- (id<PREThemeContentsFactory>)obtainContentsFactoryForMode:(PREThemeMode)themeMode
{
    id<PREThemeContentsFactory> contentsFactory;
    
    switch (themeMode) {
        case kPREThemeModeBlack:
            contentsFactory = [[PREThemeContentsFactoryDowJonesBlack alloc] init];
            break;
        default:
            contentsFactory = [[PREThemeContentsFactoryDowJonesWhiteAndFireflyBlue alloc] init];
            break;
    }
    
    return contentsFactory;
}

@end
