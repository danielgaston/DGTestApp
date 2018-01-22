//
//  PREAttribute.h
//  Pre
//

#import <JSONModel/JSONModel.h>

@interface PREAttribute : JSONModel

@property (nonatomic, strong) NSString* attributeId;
@property (nonatomic, strong) NSString<Optional>* objectId;
@property (nonatomic, strong) NSString<Optional>* name;
@property (nonatomic, strong) NSString<Optional>* internalName;
@property (nonatomic, strong) NSString<Optional>* description;
@property (nonatomic, strong) NSNumber<Optional>* type;
@property (nonatomic, strong) id<Optional> value;
@property (nonatomic, strong) id<Optional> calculatedValue;
@property (nonatomic, strong) NSArray<NSValue*><Optional>* substitutions;
@property (nonatomic, strong) NSArray<NSValue*><Optional>* calculatedSubstitutions;

@property (nonatomic, strong) NSString<Optional>* editMode;
@property (nonatomic, assign) NSNumber<Optional>* editable;
@property (nonatomic, strong) NSString<Optional>* typeProperty;
@property (nonatomic, strong) NSString<Optional>* testId;
@property (nonatomic, strong) NSString<Optional>* path;
@property (nonatomic, strong) NSString<Optional>* group;

@end
