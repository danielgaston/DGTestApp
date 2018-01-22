//
//  PREThemeModeHelper.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PREThemeManagerDefines.h"

@interface PREThemeModeHelper : NSObject

- (instancetype)initWithMode:(PREThemeMode)mode;
- (void)setMode:(PREThemeMode)mode;
- (PREThemeMode)mode;

@end
