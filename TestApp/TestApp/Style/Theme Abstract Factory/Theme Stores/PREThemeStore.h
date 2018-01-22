//
//  PREThemeStore.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PREThemeManager.h"
#import "PRETheme.h"
#import "PREThemeModeHelper.h"
#import "PREThemeStoreHelper.h"

@interface PREThemeStore : NSObject

@property (strong, nonatomic) NSString *name;

- (PRETheme *)initializeThemeWithMode:(PREThemeMode)themeMode;
- (NSArray<PREThemeStoreHelper *> *)availableThemeConfigurations;
- (NSArray<PRETheme *> *)availableThemes;
- (NSArray<PREThemeModeHelper*> *)availableThemeModes;

@end
