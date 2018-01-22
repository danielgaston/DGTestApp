//
//  PREBACommand.h
//  Pre
//

#import "PREMainAction.h"
#import <JSONModel/JSONModel.h>

@interface PREBACommand : JSONModel

@property (nonatomic, strong) PREMainAction<Optional>* mainAction;
@property (nonatomic, strong) NSString<Optional>* ontologyConceptId;
@property (nonatomic, strong) NSString<Optional>* ontologyActionId;
@property (nonatomic, strong) NSString<Optional>* ontologyInstanceId;
@property (nonatomic, strong) NSString<Optional>* context;
@property (nonatomic, strong) NSString<Optional>* id;
@property (nonatomic, strong) NSString<Optional>* icon;
@property (nonatomic, strong) NSString<Optional>* title;
@property (nonatomic, strong) NSNumber<Optional>* modifyCount;

@end
