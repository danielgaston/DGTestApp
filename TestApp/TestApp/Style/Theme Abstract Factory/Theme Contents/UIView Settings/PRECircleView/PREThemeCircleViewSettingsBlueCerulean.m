//
//  PREThemeCircleViewSettingsBlueCerulean.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCircleViewSettingsBlueCerulean.h"

@implementation PREThemeCircleViewSettingsBlueCerulean

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Cerulean Blue PRECircleView Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.baseSelectionColor = isNullify ? nil : [PREColor clearColor];
    self.circleBgSelectedColor = isNullify ? nil : [PREColor corporateCeruleanBlue];
    self.circleBgUnselectedColor = isNullify ? nil : (PREColor *)[PREColor groupTableViewBackgroundColor];
    self.circleBorderSelectedColor = isNullify ? nil : [PREColor whiteColor];
    self.circleBorderUnselectedColor = isNullify ? nil : [PREColor grayColor];
    self.circleTitleLabelSelectedColor = isNullify ? nil : [PREColor grayColor];
    self.circleTitleLabelUnselectedColor = isNullify ? nil : [PREColor grayColor];
    self.circleNumberLabelSelectedColor = isNullify ? nil : [PREColor whiteColor];
    self.circleNumberLabelUnselectedColor = isNullify ? nil : [PREColor grayColor];
}

@end
