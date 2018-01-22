//
//  PREActionWorkplace.h
//  Pre
//

#import "PREItem.h"
#import "PREMainActionGroup.h"
#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@protocol PREItem;
@protocol PREMainActionGroup;

@interface PREActionWorkplace : JSONModel

@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) id<Optional> icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, assign) NSNumber<Optional>* isMainActionSearch;
@property (nonatomic, strong) NSArray<PREItem, Optional>* mainActionSort;
@property (nonatomic, strong) NSArray<PREItem, Optional>* mainActionMenu;
@property (nonatomic, strong) NSArray<PREMainActionGroup, Optional>* mainActionGroups;

@end
