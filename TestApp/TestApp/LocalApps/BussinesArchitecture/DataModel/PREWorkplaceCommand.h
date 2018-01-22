//
//  PREWorkplaceCommand.h
//  Pre
//

#import <JSONModel/JSONModel.h>

@interface PREWorkplaceCommand : JSONModel

@property (nonatomic, strong) NSArray<NSString*>* suggestions;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSDictionary* mainActionVerbs;
@property (nonatomic, strong) NSDictionary* actionConcepts;
@property (nonatomic, strong) NSDictionary* actionVerbs;

@end
