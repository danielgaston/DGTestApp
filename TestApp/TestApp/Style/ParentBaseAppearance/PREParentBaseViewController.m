//
//  PREParentBaseViewController.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseViewController.h"

@interface PREParentBaseViewController ()

@end

@implementation PREParentBaseViewController

#pragma mark - View LifeCycle Methods

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIViewController class]];
	}
	return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIViewController class]];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIViewController class]];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.view setBackgroundColor:self.baseColor];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self setUpNavigationBarTransparencyAndColor];
}

- (void)setUpNavigationBarTransparencyAndColor
{
	self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
	if (self.navigationBarTransparency) {
		[self.navigationController.navigationBar setTranslucent:YES];
		[self.navigationController.navigationBar setBackgroundImage:[UIImage new]
													  forBarMetrics:UIBarMetricsDefault];
		self.navigationController.navigationBar.shadowImage = [UIImage new];
	} else {
		[self.navigationController.navigationBar setTranslucent:NO];
		[self.navigationController.navigationBar setBackgroundImage:nil
													  forBarMetrics:UIBarMetricsDefault];
		self.navigationController.navigationBar.shadowImage = nil;
	}
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

@end
