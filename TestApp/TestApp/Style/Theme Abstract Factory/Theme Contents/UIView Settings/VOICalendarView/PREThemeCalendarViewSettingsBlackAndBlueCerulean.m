//
//  PREThemeCalendarViewSettingsBlackAndBlueCerulean.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCalendarViewSettingsBlackAndBlueCerulean.h"

@implementation PREThemeCalendarViewSettingsBlackAndBlueCerulean

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Black and Blue Cerulean Calendar View Settings";
    }
    return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.activityIndicatorColor = isNullify ? nil : [PREColor corporateSeashellWhite];
    self.dayTextHeaderColor = isNullify ? nil : [PREColor corporateCeruleanBlue];
    self.compactWeekViewBackgroundColor = isNullify ? nil : [PREColor gray10Color];
    self.monthViewBackgroundColor = isNullify ? nil : [PREColor clearColor];
    self.weakHeaderColor = isNullify ? nil : [PREColor gray50Color];
    self.dayTextColorToday = isNullify ? nil : [PREColor gray20Color];
    self.dayTextColorThisMonth = isNullify ? nil : [PREColor corporatePolarWhite];
    self.dayTextColorOtherMonth = isNullify ? nil : [PREColor gray70Color];
    self.dayTextColorSelected = isNullify ? nil : [PREColor gray20Color];
    self.dayViewBackgroundColor = isNullify ? nil : [PREColor gray20Color];
    self.dayViewBackgroundColorToday = isNullify ? nil : [PREColor corporateMatrixRed];
    self.dayViewBackgroundColorSelected = isNullify ? nil : [PREColor corporateIcebergBlue];
}

@end

