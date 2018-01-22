//
//  PREThemeManagerDefines.h
//  Pre
//
//  Created by Daniel Iglesias on 16/11/2017.
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#ifndef PREThemeManagerDefines_h
#define PREThemeManagerDefines_h

#define kSuffixDefault @"default"

/*****************************************************************************************
 IMPORTANT
 Asset Images MUST follow the same suffix (also case sensitive) to be properly obtained.
 ******************************************************************************************/
#define kSuffixWhite @"th_white"
#define kSuffixWhiteAndMatisseBlue @"th_white_and_matisse_blue"
#define kSuffixWhiteAndFireflyBlue @"th_white_and_firefly_blue"
#define kSuffixBlack @"th_black"

typedef NS_ENUM(NSInteger, PREThemeType) {
    kPREThemeTypeCorporate = 1,
    kPREThemeTypeDowJones,
};

typedef NS_ENUM(NSInteger, PREThemeMode) {
    kPREThemeModeWhite = 1,
    kPREThemeModeWhiteAndMatisseBlue,
    kPREThemeModeWhiteAndFireflyBlue,
    kPREThemeModeBlack
};

#endif /* PREThemeManagerDefines_h */
