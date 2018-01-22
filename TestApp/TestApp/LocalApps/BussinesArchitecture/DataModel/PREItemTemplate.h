//
//  PREItemTemplate.h
//  Pre
//

#import "PRECommand.h"
#import <JSONModel/JSONModel.h>

@protocol PRECommand;

@interface PREItemTemplate : JSONModel

@property (nonatomic, strong) NSArray<PRECommand>* commands;

@end
