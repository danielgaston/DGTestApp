//
//  PREThemeCircleViewSettings.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeViewSettings.h"
#import "PRECircleView.h"

@interface PREThemeCircleViewSettings : PREThemeViewSettings

@property(nonatomic, strong) PREColor *baseSelectionColor;
@property(nonatomic, strong) PREColor *circleBgSelectedColor;
@property(nonatomic, strong) PREColor *circleBgUnselectedColor;
@property(nonatomic, strong) PREColor *circleBorderSelectedColor;
@property(nonatomic, strong) PREColor *circleBorderUnselectedColor;
@property(nonatomic, strong) PREColor *circleTitleLabelSelectedColor;
@property(nonatomic, strong) PREColor *circleTitleLabelUnselectedColor;
@property(nonatomic, strong) PREColor *circleNumberLabelSelectedColor;
@property(nonatomic, strong) PREColor *circleNumberLabelUnselectedColor;

@end
