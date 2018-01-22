//
//  PREParentBaseCollectionReusableView.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseCollectionReusableView.h"

@implementation PREParentBaseCollectionReusableView

- (void)awakeFromNib
{
	[super awakeFromNib];

	[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionReusableView class]];
}

- (id)init
{
	self = [super init];

	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionReusableView class]];
	}
	return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionReusableView class]];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionReusableView class]];
	}
	return self;
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}
@end
