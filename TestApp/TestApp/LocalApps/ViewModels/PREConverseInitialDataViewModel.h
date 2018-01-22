//
//  PREConverseInitialDataViewModel.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataModel.h"
#import "PREConverseViewModel.h"
#import <UIKit/UIKit.h>

@interface PREConverseInitialDataViewModel : PREConverseViewModel <PREConverseViewModel>

@property (nonatomic, strong) PREConverseInitialDataModel* model;
- (instancetype)initWithModel:(PREConverseInitialDataModel*)model;

@property (nonatomic, strong) NSArray<NSString*>* segmentedControlTitles;
@property (nonatomic, strong) NSArray<NSArray<NSString*>*>* tableElements;

@end
