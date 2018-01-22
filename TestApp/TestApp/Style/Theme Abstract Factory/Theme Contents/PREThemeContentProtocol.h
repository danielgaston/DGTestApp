//
//  PREThemeContentsProtocol.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PREThemeContentProtocol <NSObject>
@required
- (void)initializeContent;
- (void)reset;
@end

@protocol PREThemeContentColorProtocol <PREThemeContentProtocol>
@required
- (void)initializeColorsWithNullify:(BOOL)isNullify;
@end
