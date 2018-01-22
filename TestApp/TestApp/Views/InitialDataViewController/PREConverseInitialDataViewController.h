//
//  PREConverseInitialDataViewController.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataViewController.h"
#import "PREConverseInitialDataViewModel.h"
#import "PREConverseViewController.h"

@interface PREConverseInitialDataViewController : PREConverseViewController <PREConverseViewController>

@property (nonatomic, strong) PREConverseInitialDataViewModel* viewModel;

@end
