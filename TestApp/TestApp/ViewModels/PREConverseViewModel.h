//
//  PREConverseViewModel.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//
// This class is the glue between the Model and the View (View + ViewController)
// here we can perform network calls, data mapping, data formatting...

#import "PREConverseModel.h"
#import <Foundation/Foundation.h>

@protocol PREConverseViewModel
@required
@property (nonatomic, strong) PREConverseModel* model; //TODO: do we need this in the protocol?
- (instancetype)initWithModel:(PREConverseModel*)model;
@end

@interface PREConverseViewModel : NSObject

@end
