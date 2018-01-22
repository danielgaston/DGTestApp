//
//  PREMainAction.h
//  Pre
//

#import "PREAction.h"
#import "PREForm.h"
#import "PREGoal.h"
#import "PREMenu.h"
#import <JSONModel/JSONModel.h>

@protocol PREMainAction;
@protocol PREAction;
@protocol PREBACommand;

@interface PREMainAction : JSONModel

@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSString<Optional>* icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSString<Optional>* subtitle;
@property (nonatomic, strong) PREGoal<Optional>* goal;
@property (nonatomic, strong) NSString<Optional>* addTextInfo;
@property (nonatomic, strong) NSString<Optional>* dateTimeInfo;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;
@property (nonatomic, strong) PREForm<Optional>* form;
@property (nonatomic, strong) PREMenu<Optional>* menu;
@property (nonatomic, strong) NSArray<PREAction, Optional>* actions;
@property (nonatomic, strong) NSArray<PREBACommand, Optional>* communicationCommands;
@property (nonatomic, strong) NSArray<PREBACommand, Optional>* utaCommands;

@end
