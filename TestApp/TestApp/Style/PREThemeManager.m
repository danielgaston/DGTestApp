//
//  PREThemeManager.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeManager.h"
#import "PRETheme.h"
#import "PREThemeStoreCorporate.h"
#import "PREThemeStoreDowJones.h"
#import "PREUserDefaults.h"

@interface PREThemeManager ()

@property PREThemeStore* themeStore;
@property PRETheme* theme;
@property PREThemeType themeType;
@property PREThemeMode themeMode;

@end

static PREThemeManager* themeManagerInstance = nil;

@implementation PREThemeManager

#pragma mark - Class Methods

+ (PREThemeManager*)sharedInstance
{
	static dispatch_once_t once;

	dispatch_once(&once, ^{
		themeManagerInstance = [[self alloc] init];
	});

	return themeManagerInstance;
}

#pragma mark - Life Cycle Methods

- (instancetype)init
{
	self = [super init];
	if (self) {
		_themeType = [self obtainThemeType];
		_themeMode = [self obtainThemeMode];
		_themeStore = [self obtainThemeStore];
		_theme = [_themeStore initializeThemeWithMode:_themeMode];

		[[NSNotificationCenter defaultCenter] postNotificationName:kVOCGlobalThemeUpdate object:[NSNumber numberWithInteger:_themeMode]];
	}
	return self;
}

#pragma mark - Initialization Methods

- (void)initWithMode:(PREThemeMode)mode
{
	_themeType = _themeType ?: [self obtainThemeType];
	_themeMode = mode;
	_themeStore = _themeStore ?: [self obtainThemeStore];
	_theme = [_themeStore initializeThemeWithMode:_themeMode];

	[[NSNotificationCenter defaultCenter] postNotificationName:kVOCGlobalThemeUpdate object:nil];
}

#pragma mark - Helper Methods

- (PREThemeType)currentThemeType
{
	return self.themeType;
}

- (PREThemeMode)currentThemeMode
{
	return self.themeMode;
}

- (void)reset
{
	[self.theme reset];
}

- (NSArray<PREThemeStoreHelper*>*)availableStoreConfigurations
{
	return [self.themeStore availableThemeConfigurations];
}

- (PREThemeType)obtainThemeType
{
	PREThemeType themeType = kPREThemeTypeCorporate;
#if DOWJONES
	themeType = kPREThemeTypeDowJones;
#endif
	return themeType;
}

- (PREThemeMode)obtainThemeMode
{
	if ([[PREUserDefaults sharedManager] themeModeValue]) {
		return [[PREUserDefaults sharedManager] themeModeValue];
	} else {
		switch (_themeType) {
		case kPREThemeTypeDowJones:
			return kPREThemeModeBlack;
			break;
		case kPREThemeTypeCorporate:
			return kPREThemeModeWhiteAndMatisseBlue;
			break;
		default:
			NSAssert(false, @"This case should never be reached. Please implement the missing theme type");
		}
	}
}

- (PREThemeStore*)obtainThemeStore
{
	PREThemeStore* themeStore;

	switch (_themeType) {
	case kPREThemeTypeDowJones:
		themeStore = [[PREThemeStoreDowJones alloc] init];
		break;
	case kPREThemeTypeCorporate:
		themeStore = [[PREThemeStoreCorporate alloc] init];
		break;
	default:
		NSAssert(false, @"This case should never be reached. Please implement the missing theme type");
	}
	return themeStore;
}

- (NSString*)suffixStringForThemeMode:(PREThemeMode)themeMode
{
	NSString* suffix;
	switch (themeMode) {
	case kPREThemeModeWhite:
		suffix = kSuffixWhite;
		break;
	case kPREThemeModeWhiteAndMatisseBlue:
		suffix = kSuffixWhiteAndMatisseBlue;
		break;
	case kPREThemeModeWhiteAndFireflyBlue:
		suffix = kSuffixWhiteAndFireflyBlue;
		break;
	case kPREThemeModeBlack:
		suffix = kSuffixBlack;
		break;
	default:
		NSAssert(false, @"This case should never be reached. Please implement the missing theme mode");
	}
	return suffix;
}

- (NSString*)suffixStringForDefaultThemeMode
{
	return kSuffixDefault;
}

#pragma mark - DEBUG ONLY METHODS

- (void)debugFlipTheme
{
	PREThemeMode newMode;

	switch (_themeMode) {
	case kPREThemeModeWhite:
		newMode = kPREThemeModeWhiteAndMatisseBlue;
		break;
	case kPREThemeModeWhiteAndMatisseBlue:
		newMode = kPREThemeModeBlack;
		break;
	case kPREThemeModeBlack:
		newMode = kPREThemeModeWhite;
		break;
	}

	[self reset];
	[self initWithMode:newMode];
}

@end
