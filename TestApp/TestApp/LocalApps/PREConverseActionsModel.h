//
//  PREConverseActions.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

@import Foundation;

#import "PREConverseModel.h"

@protocol PREConverseActionModel;

@interface PREConverseActionsModel : PREConverseModel

// FIXME: Check Types!!
@property (nonatomic, strong) NSArray</*?*/ Optional>* data;
@property (nonatomic, strong) NSArray</*?*/ Optional>* attributes;

@end
