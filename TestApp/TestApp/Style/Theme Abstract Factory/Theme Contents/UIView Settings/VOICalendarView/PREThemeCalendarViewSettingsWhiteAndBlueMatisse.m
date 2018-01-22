//
//  PREThemeCalendarViewSettingsWhiteAndBlueMatisse.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCalendarViewSettingsWhiteAndBlueMatisse.h"

@implementation PREThemeCalendarViewSettingsWhiteAndBlueMatisse

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"White And Blue Matisse Calendar View Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.activityIndicatorColor = isNullify ? nil : [PREColor gray20Color];
    self.dayTextHeaderColor = isNullify ? nil : [PREColor corporateMatisseBlue];
    self.compactWeekViewBackgroundColor = isNullify ? nil : [PREColor whiteColor];
    self.monthViewBackgroundColor = isNullify ? nil : [PREColor clearColor];
    self.weakHeaderColor = isNullify ? nil : [PREColor gray40Color];
    self.dayTextColorToday = isNullify ? nil : [PREColor redColor];
    self.dayTextColorThisMonth = isNullify ? nil : [PREColor gray20Color];
    self.dayTextColorOtherMonth = isNullify ? nil : [PREColor gray40Color];
    self.dayTextColorSelected = isNullify ? nil : [PREColor whiteColor];
    self.dayViewBackgroundColor = isNullify ? nil : [PREColor whiteColor];
    self.dayViewBackgroundColorToday = isNullify ? nil : [PREColor redColor];
    self.dayViewBackgroundColorSelected = isNullify ? nil : [PREColor corporateMatisseBlue];
}

@end
