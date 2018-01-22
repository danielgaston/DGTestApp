//
//  PREParentBaseAlertViewController.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseAlertViewController.h"

@implementation PREParentBaseAlertViewController

+ (instancetype)alertControllerWithTitle:(NSString*)title
								 message:(NSString*)message
						  preferredStyle:(UIAlertControllerStyle)preferredStyle
{
	PREParentBaseAlertViewController* alertController = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
	if (alertController) {
		[[[alertController class] appearance] applyInvocationRecursivelyTo:alertController upToSuperClass:[UIAlertController class]];
	}
	return alertController;
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIAlertController class]];
	}
	return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIAlertController class]];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIAlertController class]];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	if (self.title) {
		NSMutableAttributedString* mTitle = [[NSMutableAttributedString alloc] initWithString:self.title];
		[mTitle addAttribute:NSForegroundColorAttributeName value:self.alertTitleTextColor range:NSMakeRange(0, mTitle.length)];
		[self setValue:mTitle forKey:@"attributedTitle"];
	}

	if (self.message) {
		NSMutableAttributedString* mMessage = [[NSMutableAttributedString alloc] initWithString:self.message];
		[mMessage addAttribute:NSForegroundColorAttributeName value:self.alertSubtitleTextColor range:NSMakeRange(0, mMessage.length)];
		[self setValue:mMessage forKey:@"attributedMessage"];
	}
}

- (void)addAction:(UIAlertAction*)action
{
	switch (action.style) {
	case UIAlertActionStyleCancel:
		[action setValue:self.cancelActionColor forKey:@"titleTextColor"];
		break;
	case UIAlertActionStyleDestructive:
		[action setValue:self.destructiveActionColor forKey:@"titleTextColor"];
		break;
	default:
		[action setValue:self.defaultActionColor forKey:@"titleTextColor"];
		break;
	}

	[super addAction:action];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

@end
