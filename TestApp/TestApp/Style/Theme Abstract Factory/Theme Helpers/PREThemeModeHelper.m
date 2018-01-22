//
//  PREThemeModeHelper.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeModeHelper.h"

@interface PREThemeModeHelper ()

@property (nonatomic, strong) NSNumber *numberMode;

@end

@implementation PREThemeModeHelper

- (instancetype)initWithMode:(PREThemeMode)mode
{
    self = [self init];
    if (self) {
        [self setMode:mode];
    }
    return self;
}

- (void)setMode:(PREThemeMode)mode
{
    _numberMode = [NSNumber numberWithInteger:mode];
}

- (PREThemeMode)mode
{
    return [_numberMode integerValue];
}

@end

