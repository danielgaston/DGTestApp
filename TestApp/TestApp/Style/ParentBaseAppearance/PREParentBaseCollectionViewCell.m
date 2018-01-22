//
//  PREParentBaseCollectionViewCell.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseCollectionViewCell.h"

@implementation PREParentBaseCollectionViewCell

- (void)awakeFromNib
{
	[super awakeFromNib];

	[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionViewCell class]];
}

- (id)init
{
	self = [super init];

	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionViewCell class]];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionViewCell class]];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UICollectionViewCell class]];
	}
	return self;
}

- (void)setBaseSelectionColor:(PREColor*)baseSelectionColor
{
	_baseSelectionColor = baseSelectionColor;

	UIView* selectedBackgroundView = [[UIView alloc] init];
	[selectedBackgroundView setBackgroundColor:self.baseSelectionColor];
	[self setSelectedBackgroundView:selectedBackgroundView];
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

@end
