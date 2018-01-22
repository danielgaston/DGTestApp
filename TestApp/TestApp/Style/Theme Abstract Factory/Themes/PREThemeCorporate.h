//
//  PREThemeCorporate.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRETheme.h"
#import "PREThemeContentsFactory.h"

@interface PREThemeCorporate : PRETheme

- (id)initWithThemeContentsFactory:(id<PREThemeContentsFactory>)themeContentsFactory;

@end
