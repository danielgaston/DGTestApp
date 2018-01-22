//
//  PREBAObject.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface PREBAObject : JSONModel
@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSString<Optional>* icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;
@end
