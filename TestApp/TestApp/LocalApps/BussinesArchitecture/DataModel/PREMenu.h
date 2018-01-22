//
//  PREMenu.h
//  Pre
//

#import "PREItem.h"
#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@protocol PREItem;

@interface PREMenu : JSONModel

@property (nonatomic, strong) NSArray<PREItem>* items;

@end
