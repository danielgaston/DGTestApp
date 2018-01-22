//
//  PREThemeCorporateStore.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeStoreCorporate.h"
#import "PREThemeCorporate.h"
#import "PREThemeContentsFactoryCorporateWhite.h"
#import "PREThemeContentsFactoryCorporateBlack.h"
#import "PREThemeContentsFactoryCorporateWhiteAndMatisseBlue.h"

@interface  PREThemeStoreCorporate ()

@property (strong, nonatomic) id<PREThemeContentsFactory> themeContentsFactory;

@end

@implementation PREThemeStoreCorporate

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Corporate Theme Store";
    }
    return self;
}

#pragma mark - Overriden Methods

- (PRETheme *)initializeThemeWithMode:(PREThemeMode)themeMode
{
    self.themeContentsFactory = [self obtainContentsFactoryForMode:themeMode];
    PRETheme *theme = theme = [[PREThemeCorporate alloc] initWithThemeContentsFactory:self.themeContentsFactory];
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
    return @[[[PREThemeCorporate alloc] init]];
}

- (NSArray<PREThemeModeHelper*> *)availableThemeModes
{
    return @[[[PREThemeModeHelper alloc] initWithMode:kPREThemeModeWhite],
             [[PREThemeModeHelper alloc] initWithMode:kPREThemeModeBlack],
             [[PREThemeModeHelper alloc] initWithMode:kPREThemeModeWhiteAndMatisseBlue]];
}


#pragma mark - Helper Methods

- (id<PREThemeContentsFactory>)obtainContentsFactoryForMode:(PREThemeMode)themeMode
{
    id<PREThemeContentsFactory> contentsFactory;
    
    switch (themeMode) {
        case kPREThemeModeWhite:
            contentsFactory = [[PREThemeContentsFactoryCorporateWhite alloc] init];
            break;
        case kPREThemeModeBlack:
            contentsFactory = [[PREThemeContentsFactoryCorporateBlack alloc] init];
            break;
        default:
            contentsFactory = [[PREThemeContentsFactoryCorporateWhiteAndMatisseBlue alloc] init];
            break;
    }
    
    return contentsFactory;
}

@end
