//
//  PREThemeCorporate.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREThemeCorporate.h"

@interface PREThemeCorporate ()

@property (strong, nonatomic) id<PREThemeContentsFactory> themeContentsFactory;

@end


@implementation PREThemeCorporate

#pragma mark - View LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Corporate Color Theme";
    }
    return self;
}

#pragma mark - Public Methods

- (id)initWithThemeContentsFactory:(id<PREThemeContentsFactory>)themeContentsFactory
{
    self = [self init];
    if (self) {
        self.themeContentsFactory = themeContentsFactory;
    }
    return self;
}

#pragma mark - PRETheme Methods

- (void)prepare
{
    self.viewSettings = [self.themeContentsFactory prepareViewSettings];
    self.buttonSettings = [self.themeContentsFactory prepareButtonSettings];
    self.navigationBarSettings = [self.themeContentsFactory prepareNavigationBarSettings];
	self.tabBarSettings = [self.themeContentsFactory prepareTabBarSettings];
	self.pageControlSettings = [self.themeContentsFactory preparePageControlSettings];
	self.segmentedControlSettings = [self.themeContentsFactory prepareSegmentedControlSettings];
	self.switchSettings = [self.themeContentsFactory prepareSwitchSettings];
}

- (void)reset
{
    [super reset];
    [self.themeContentsFactory reset];
}

@end
