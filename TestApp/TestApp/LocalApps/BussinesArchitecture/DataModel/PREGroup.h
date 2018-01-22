//
//  PREGroup.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol PREBAObject;

@interface PREGroup : JSONModel
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* items;
@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSString<Optional>* icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;
@end
