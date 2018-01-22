//
//  PREThemeStoreHelper.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRETheme.h"
#import "PREThemeModeHelper.h"
#import "PREThemeContentsFactory.h"

@interface PREThemeStoreHelper : NSObject

@property (nonatomic, strong) PRETheme *theme;
@property (nonatomic, strong) PREThemeModeHelper *themeMode;
@property (nonatomic, strong) id<PREThemeContentsFactory> themeContent;

@end
