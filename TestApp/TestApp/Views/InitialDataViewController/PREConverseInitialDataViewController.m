//
//  PREConverseInitialDataViewController.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseInitialDataViewController.h"

@interface PREConverseInitialDataViewController ()
@property (nonatomic, weak) IBOutlet UISegmentedControl* segmentedControl;
@property (nonatomic, weak) IBOutlet UITableView* tableView;
@end

@implementation PREConverseInitialDataViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.viewModel.segmentedControlTitles enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
		[self.segmentedControl setTitle:obj forSegmentAtIndex:idx];
	}];
}

- (IBAction)didChangeSegmentedControlValue:(id)sender
{

	//will nedd to update the table based on the index selected, basically showing a new list of actions
}

@end
