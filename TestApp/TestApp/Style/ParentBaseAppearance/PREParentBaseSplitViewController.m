//
//  PREParentBaseSplitViewController.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseSplitViewController.h"

@interface PREParentBaseSplitViewController ()

@end

@implementation PREParentBaseSplitViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UISplitViewController class]];
	}
	return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UISplitViewController class]];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UISplitViewController class]];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.view setBackgroundColor:self.baseColor];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return self.customStatusBarStyle;
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

#pragma mark - UISplitViewController Delegate Methods

// All delegate methods are optional, no need to implement any in particular.

@end
