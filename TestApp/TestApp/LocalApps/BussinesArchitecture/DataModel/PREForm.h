//
//  PREForm.h
//  Pre
//

#import "PREAttribute.h"
#import "PREField.h"
#import "PREItemTemplate.h"
#import <JSONModel/JSONModel.h>

@protocol PREAttribute;
@protocol PREField;

@interface PREForm : JSONModel

@property (nonatomic, strong) NSString* formId;
@property (nonatomic, strong) NSString<Optional>* currentMode;
@property (nonatomic, strong) NSArray<PREAttribute, Optional>* attributes;
@property (nonatomic, strong) NSArray<PREField, Optional>* fields;
@property (nonatomic, strong) PREItemTemplate<Optional>* itemTemplate;

@end
