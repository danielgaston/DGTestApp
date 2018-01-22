//
//  PREConverseActionModel.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseModel.h"
#import <Foundation/Foundation.h>

@interface PREConverseActionModel : PREConverseModel

@property (nonatomic, strong) NSString<Optional>* ID;
@property (nonatomic, strong) NSString<Optional>* title;

// FIXME: Check Types!!
@property (nonatomic, strong) NSArray</* XXX */ Optional>* attributes;
@property (nonatomic, strong) NSArray</* XXX */ Optional>* fields;

@end
