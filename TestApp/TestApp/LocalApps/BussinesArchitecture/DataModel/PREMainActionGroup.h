//
//  PREMainActionGroup.h
//  Pre
//

#import "PREMainAction.h"
#import <JSONModel/JSONModel.h>

@protocol PREMainAction;

@interface PREMainActionGroup : JSONModel

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSArray<PREMainAction>* mainActions;

@end
