//
//  PREThemeCircleViewSettingsBlueMatisse.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCircleViewSettingsBlueMatisse.h"

@implementation PREThemeCircleViewSettingsBlueMatisse

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Matisse Blue PRECircleView Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.baseSelectionColor = isNullify ? nil : [PREColor clearColor];
    self.circleBgSelectedColor = isNullify ? nil : [PREColor corporateMatisseBlue];
    self.circleBgUnselectedColor = isNullify ? nil : [PREColor gray90Color];
    self.circleBorderSelectedColor = isNullify ? nil : [PREColor whiteColor];
    self.circleBorderUnselectedColor = isNullify ? nil : [PREColor grayColor];
    self.circleTitleLabelSelectedColor = isNullify ? nil : [PREColor grayColor];
    self.circleTitleLabelUnselectedColor = isNullify ? nil : [PREColor grayColor];
    self.circleNumberLabelSelectedColor = isNullify ? nil : [PREColor whiteColor];
    self.circleNumberLabelUnselectedColor = isNullify ? nil : [PREColor grayColor];
}

@end
