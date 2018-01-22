//
//  PREThemeCalendarViewSettingsWhiteAndGreenVidaLoca.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCalendarViewSettingsWhiteAndGreenVidaLoca.h"

@implementation PREThemeCalendarViewSettingsWhiteAndGreenVidaLoca

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"White And Green Vida Loca Calendar View Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.activityIndicatorColor = isNullify ? nil : [PREColor gray20Color];
    self.dayTextHeaderColor = isNullify ? nil : [PREColor corporateVidaLocaGreen];
    self.compactWeekViewBackgroundColor = isNullify ? nil : [PREColor whiteColor];
    self.monthViewBackgroundColor = isNullify ? nil : [PREColor clearColor];
    self.weakHeaderColor = isNullify ? nil : [PREColor gray40Color];
    self.dayTextColorToday = isNullify ? nil : [PREColor redColor];
    self.dayTextColorThisMonth = isNullify ? nil : [PREColor gray20Color];
    self.dayTextColorOtherMonth = isNullify ? nil : [PREColor gray40Color];
    self.dayTextColorSelected = isNullify ? nil : [PREColor whiteColor];
    self.dayViewBackgroundColor = isNullify ? nil : [PREColor whiteColor];
    self.dayViewBackgroundColorToday = isNullify ? nil : [PREColor redColor];
    self.dayViewBackgroundColorSelected = isNullify ? nil : [PREColor corporateVidaLocaGreen];
}

@end
