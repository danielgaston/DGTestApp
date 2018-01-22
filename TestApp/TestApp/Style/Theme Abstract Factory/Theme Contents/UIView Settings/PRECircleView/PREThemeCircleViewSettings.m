//
//  PREThemeCircleViewSettings.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCircleViewSettings.h"

@implementation PREThemeCircleViewSettings

#pragma mark - Helper Methods

- (void)initializeContentElements
{
    [[PRECircleView appearance] setBaseSelectionColor:self.baseSelectionColor];
    [[PRECircleView appearance] setCircleBgSelectedColor:self.circleBgSelectedColor];
    [[PRECircleView appearance] setCircleBgUnselectedColor:self.circleBgUnselectedColor];
    [[PRECircleView appearance] setCircleBorderSelectedColor:self.circleBorderSelectedColor];
    [[PRECircleView appearance] setCircleBorderUnselectedColor:self.circleBorderUnselectedColor];
    [[PRECircleView appearance] setCircleTitleLabelSelectedColor:self.circleTitleLabelSelectedColor];
    [[PRECircleView appearance] setCircleTitleLabelUnselectedColor:self.circleTitleLabelUnselectedColor];
    [[PRECircleView appearance] setCircleNumberLabelSelectedColor:self.circleNumberLabelSelectedColor];
    [[PRECircleView appearance] setCircleNumberLabelUnselectedColor:self.circleNumberLabelUnselectedColor];
    [[PRECircleView appearance] setCircleBorderSelectedWidth:2];
    [[PRECircleView appearance] setCircleBorderUnselectedWidth:2];
}

@end
