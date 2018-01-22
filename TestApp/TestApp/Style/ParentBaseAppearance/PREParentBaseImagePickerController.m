//
//  PREParentBaseImagePickerController.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseImagePickerController.h"

@interface PREParentBaseImagePickerController ()

@end

@implementation PREParentBaseImagePickerController

- (instancetype)initWithRootViewController:(UIViewController*)rootViewController
{
	self = [super initWithRootViewController:rootViewController];
	if (self)
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIImagePickerController class]];
	return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIImagePickerController class]];
	return self;
}

- (instancetype)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIImagePickerController class]];
	return self;
}

- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
	self = [super initWithNavigationBarClass:navigationBarClass toolbarClass:toolbarClass];
	if (self)
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIImagePickerController class]];
	return self;
}

- (id)init
{
	self = [super init];
	if (self)
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIImagePickerController class]];
	return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return self.customStatusBarStyle;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.view.backgroundColor = self.baseColor;
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

@end
