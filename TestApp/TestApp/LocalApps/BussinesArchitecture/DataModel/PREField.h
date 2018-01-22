//
//  PREField.h
//  Pre
//

#import "PREValidator.h"
#import <JSONModel/JSONModel.h>

@protocol PREValidator;

@interface PREField : JSONModel

@property (nonatomic, strong) NSString* formFieldId;
@property (nonatomic, strong) NSString<Optional>* group;
@property (nonatomic, strong) NSArray<PREValidator, Optional>* validators;

@end
