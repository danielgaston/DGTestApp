//
//  PREWorkplace.h
//  Pre
//
#import "PREWorkplaceCommand.h"
#import <JSONModel/JSONModel.h>

@protocol PREWorkplace;

@interface PREWorkplace : JSONModel

@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) id<Optional> icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;

@property (nonatomic, strong) NSArray<PREWorkplace, Optional>* actionWorkplaces;
@property (nonatomic, strong) PREWorkplaceCommand<Optional>* command;

@end
