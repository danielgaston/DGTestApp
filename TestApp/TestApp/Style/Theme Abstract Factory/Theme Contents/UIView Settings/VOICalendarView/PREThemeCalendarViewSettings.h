//
//  PREThemeCalendarViewSettings.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeViewSettings.h"
#import "VOICalendarController.h"
#import "VOICalendarCompactWeekView.h"
#import "VOICalendarFilterBarReusableView.h"
#import "VOICalendarWeekMonthReusableView.h"
#import "VOICalendarWeekMonthDayCell.h"

@interface PREThemeCalendarViewSettings : PREThemeViewSettings

@property(nonatomic, strong) PREColor *activityIndicatorColor;
@property(nonatomic, strong) PREColor *dayTextHeaderColor;
@property(nonatomic, strong) PREColor *compactWeekViewBackgroundColor;
@property(nonatomic, strong) PREColor *monthViewBackgroundColor;
@property(nonatomic, strong) PREColor *weakHeaderColor;
@property(nonatomic, strong) PREColor *dayTextColorToday;
@property(nonatomic, strong) PREColor *dayTextColorThisMonth;
@property(nonatomic, strong) PREColor *dayTextColorOtherMonth;
@property(nonatomic, strong) PREColor *dayTextColorSelected;
@property(nonatomic, strong) PREColor *dayViewBackgroundColor;
@property(nonatomic, strong) PREColor *dayViewBackgroundColorToday;
@property(nonatomic, strong) PREColor *dayViewBackgroundColorSelected;

@end
