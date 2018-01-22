//
//  PREThemeToastViewSettingsWhite.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeToastViewSettingsWhite.h"

@implementation PREThemeToastViewSettingsWhite

- (id)init
{
	self = [super init];
	if (self) {
		self.name = @"Clear White PREToastView Settings";
	}
	return self;
}

#pragma mark - PREThemeContentColorProtocol Delegate Methods

- (void)initializeColorsWithNullify:(BOOL)isNullify
{
    self.backgroundColorInfo = isNullify ? nil : [PREColor systemInfoBlue];
    self.textColorInfo = isNullify ? nil : [PREColor whiteColor];
    self.backgroundColorError = isNullify ? nil : [PREColor systemError];
    self.textColorError = isNullify ? nil : [PREColor whiteColor];
    self.backgroundColorWarning = isNullify ? nil : [PREColor systemWarning];
    self.textColorWarning = isNullify ? nil : [PREColor gray20Color];
    self.backgroundColorSuccess = isNullify ? nil : [PREColor systemSuccess];
    self.textColorSuccess = isNullify ? nil : [PREColor gray20Color];
}

@end
