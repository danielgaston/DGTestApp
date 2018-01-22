//
//  PREThemeToastViewSettings.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeViewSettings.h"
#import "PREToastVC.h"

@interface PREThemeToastViewSettings : PREThemeViewSettings

@property(nonatomic, strong) PREColor *backgroundColorInfo;
@property(nonatomic, strong) PREColor *textColorInfo;
@property(nonatomic, strong) PREColor *backgroundColorError;
@property(nonatomic, strong) PREColor *textColorError;
@property(nonatomic, strong) PREColor *backgroundColorWarning;
@property(nonatomic, strong) PREColor *textColorWarning;
@property(nonatomic, strong) PREColor *backgroundColorSuccess;
@property(nonatomic, strong) PREColor *textColorSuccess;

@end
