//
//  PREThemeButtonSettings.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeButtonSettings.h"

@implementation PREThemeButtonSettings

- (id)init
{
    self = [super init];
    if (self) {
        [self initializeContent];
    }
    return self;
}

#pragma mark - Helper Methods

- (void)initializeContentElements
{
    // left blank intenionally
}


#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeContent
{
    [self initializeColorsWithNullify:NO];
    [self initializeContentElements];
}

- (void)reset
{
    [self initializeColorsWithNullify:YES];
    [self initializeContentElements];
}

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    // left blank intenionally
}

@end
