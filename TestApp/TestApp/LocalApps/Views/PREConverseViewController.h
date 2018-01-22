//
//  PREConverseViewController.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//
// This is the View (View + View Controller) only presentation logic here

#import "PREConverseViewModel.h"
#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>

@protocol PREConverseViewController
@required
@property (nonatomic, strong) PREConverseViewModel* viewModel;
@end

@interface PREConverseViewController : PREParentBaseViewController

@end
