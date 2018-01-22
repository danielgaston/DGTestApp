//
//  PREThemeCircleViewSettingsGray.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCircleViewSettingsGray.h"

@implementation PREThemeCircleViewSettingsGray

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Gray PRECircleView Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    [super initializeColorsWithNullify:isNullify];
    
    self.baseSelectionColor = isNullify ? nil : [PREColor clearColor];
    self.circleBgSelectedColor = isNullify ? nil : [PREColor corporateVikingBlue];
    self.circleBgUnselectedColor = isNullify ? nil : [PREColor gray80Color];
    self.circleBorderSelectedColor = isNullify ? nil : [PREColor gray60Color];
    self.circleBorderUnselectedColor = isNullify ? nil : [PREColor gray60Color];
    self.circleTitleLabelSelectedColor = isNullify ? nil : [PREColor gray90Color];
    self.circleTitleLabelUnselectedColor = isNullify ? nil : [PREColor gray90Color];
    self.circleNumberLabelSelectedColor = isNullify ? nil : [PREColor gray30Color];
    self.circleNumberLabelUnselectedColor = isNullify ? nil : [PREColor gray40Color];
}

@end
