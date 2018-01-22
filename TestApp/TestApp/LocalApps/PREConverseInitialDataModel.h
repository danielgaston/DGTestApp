//
//  PREConverseInitialDataModel.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

@import Foundation;

#import "PREConverseModel.h"

@protocol PREConverseActionModel;

@interface PREConverseInitialDataModel : PREConverseModel

@property (nonatomic, strong) NSArray<PREConverseActionModel, Optional>* actionsViews;

@end
