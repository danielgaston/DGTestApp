//
//  PREParentBaseTableViewSectionView.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseTableViewSectionView.h"

@implementation PREParentBaseTableViewSectionView

- (void)awakeFromNib
{
	[super awakeFromNib];

	[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewHeaderFooterView class]];
}

- (instancetype)initWithReuseIdentifier:(NSString*)reuseIdentifier
{
	self = [super initWithReuseIdentifier:reuseIdentifier];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewHeaderFooterView class]];
	}
	return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewHeaderFooterView class]];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewHeaderFooterView class]];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewHeaderFooterView class]];
	}
	return self;
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

@end
