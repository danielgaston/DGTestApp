//
//  PREThemeViewSettings.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PREThemeContentProtocol.h"

@interface PREThemeViewSettings : NSObject <PREThemeContentColorProtocol>

@property (strong, nonatomic) NSString *name;

- (void)initializeContentElements;

@end
