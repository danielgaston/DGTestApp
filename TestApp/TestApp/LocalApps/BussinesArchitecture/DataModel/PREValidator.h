//
//  PREValidator.h
//  Pre
//

#import <JSONModel/JSONModel.h>

@interface PREValidator : JSONModel

@property (nonatomic, strong) NSString<Optional>* valueValidationRegExp;
@property (nonatomic, strong) NSString<Optional>* invalidInputMessage;

@end
