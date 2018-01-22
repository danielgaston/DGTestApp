//
//  PREThemeCalendarViewSettings.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCalendarViewSettings.h"

@implementation PREThemeCalendarViewSettings

#pragma mark - Helper Methods

- (void)initializeContentElements
{
    [[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[VOICalendarController class]]] setColor:self.activityIndicatorColor];
    
    [[VOICalendarFilterBarReusableView appearance] setDayTextColorHeader:self.dayTextHeaderColor];
    
    [[VOICalendarCompactWeekView appearance] setBackgroundColor:self.compactWeekViewBackgroundColor];
    
    [[VOICalendarWeekMonthReusableView appearance] setMonthViewBackgroundColor:self.monthViewBackgroundColor];
    
    [[VOICalendarWeekMonthDayNameView appearance] setWeekHeaderColor:self.weakHeaderColor];
    
    [[VOICalendarWeekMonthDayCell appearance] setDayTextColorToday:self.dayTextColorToday];
    [[VOICalendarWeekMonthDayCell appearance] setDayTextColorThisMonth:self.dayTextColorThisMonth];
    [[VOICalendarWeekMonthDayCell appearance] setDayTextColorOtherMonth:self.dayTextColorOtherMonth];
    [[VOICalendarWeekMonthDayCell appearance] setDayTextColorSelected:self.dayTextColorSelected];
    [[VOICalendarWeekMonthDayCell appearance] setDayViewBackgroundColor:self.dayViewBackgroundColor];
    [[VOICalendarWeekMonthDayCell appearance] setDayViewBackgroundColorToday:self.dayViewBackgroundColorToday];
    [[VOICalendarWeekMonthDayCell appearance] setDayViewBackgroundColorSelected:self.dayViewBackgroundColorSelected];
}

@end
