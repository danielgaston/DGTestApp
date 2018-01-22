//
//  PREThemeManager.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeManagerDefines.h"
#import "PREThemeStoreHelper.h"
#import <Foundation/Foundation.h>

@interface PREThemeManager : NSObject

+ (PREThemeManager*)sharedInstance;

- (void)initWithMode:(PREThemeMode)mode;
- (void)reset;
- (NSArray<PREThemeStoreHelper*>*)availableStoreConfigurations;

- (PREThemeType)currentThemeType;
- (PREThemeMode)currentThemeMode;
- (NSString*)suffixStringForDefaultThemeMode;
- (NSString*)suffixStringForThemeMode:(PREThemeMode)themeMode;

// Debug purposes only
- (void)debugFlipTheme;

@end
