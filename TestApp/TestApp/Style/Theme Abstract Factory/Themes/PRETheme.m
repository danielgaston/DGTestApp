//
//  PRETheme.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PRETheme.h"

@implementation PRETheme

- (instancetype)createTheme:(PREThemeType)themeType
{
    NSLog(@"Creating theme...");
	return self;
}

- (void)prepare
{
    [self prepareViews];
    [self prepareButtons];
    [self prepareNavigationBar];
    [self prepareExclusiveTarget];
}

- (void)prepareViews
{
    NSLog(@"Preparing theme views...");
}

- (void)prepareButtons
{
    NSLog(@"Preparing theme buttons...");
}

- (void)prepareNavigationBar
{
    NSLog(@"Preparing theme navigation bar...");
}

- (void)prepareExclusiveTarget
{
    NSLog(@"Preparing exclusive content...");
}

- (void)reset
{
    NSLog(@"Reseting theme...");
    [PREAppearance resetAll];
}

@end
