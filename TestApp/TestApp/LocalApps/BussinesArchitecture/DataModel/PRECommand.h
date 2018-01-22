//
//  PRECommand.h
//  Pre
//
#import <JSONModel/JSONModel.h>

@interface PRECommand : JSONModel

@property (nonatomic, strong) NSString* actionId;
@property (nonatomic, strong) NSString* command;
@property (nonatomic, strong) NSArray<NSDictionary*><Optional>* commandArguments;
@property (nonatomic, strong) NSString<Optional>* text;
@property (nonatomic, strong) NSString<Optional>* title;

@end
