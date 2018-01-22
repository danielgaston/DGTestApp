//
//  PREThemeToastViewSettings.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeToastViewSettings.h"

@implementation PREThemeToastViewSettings

#pragma mark - Helper Methods

- (void)initializeContentElements
{
    [[PREToastView appearance] setBackgroundAlpha:1];
    [[PREToastView appearance] setTextAlpha:1.0];
    [[PREToastView appearance] setCornerRadius:5.0];
    [[PREToastView appearance] setBackgroundColorInfo:self.backgroundColorInfo];
    [[PREToastView appearance] setTextColorInfo:self.textColorInfo];
    [[PREToastView appearance] setBackgroundColorError:self.backgroundColorError];
    [[PREToastView appearance] setTextColorError:self.textColorError];
    [[PREToastView appearance] setBackgroundColorWarning:self.backgroundColorWarning];
    [[PREToastView appearance] setTextColorWarning:self.textColorWarning];
    [[PREToastView appearance] setBackgroundColorSuccess:self.backgroundColorSuccess];
    [[PREToastView appearance] setTextColorSuccess:self.textColorSuccess];
}


@end
