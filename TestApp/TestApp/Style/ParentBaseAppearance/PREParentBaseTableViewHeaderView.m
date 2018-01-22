//
//  PREParentBaseTableViewHeaderView.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseTableViewHeaderView.h"

@implementation PREParentBaseTableViewHeaderView

- (void)awakeFromNib
{
	[super awakeFromNib];

	[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIView class]];
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIView class]];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIView class]];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UIView class]];
	}
	return self;
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

@end
