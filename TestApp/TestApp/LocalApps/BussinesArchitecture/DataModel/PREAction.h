//
//  PREAction.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREForm.h"
#import <JSONModel/JSONModel.h>

@protocol PREMainActionGroup;

@interface PREAction : JSONModel
@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSString<Optional>* icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;
@property (nonatomic, strong) PREForm<Optional>* form;
@property (nonatomic, strong) NSArray<PREMainActionGroup, Optional>* mainActionGroups;
@end
