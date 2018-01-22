//
//  PREParentBaseTableViewCell.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREParentBaseTableViewCell.h"
#import "DTCustomColoredAccessory.h"

@implementation PREParentBaseTableViewCell

- (void)awakeFromNib
{
	[super awakeFromNib];

	[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewCell class]];

	[self initializeMainUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewCell class]];

		[self initializeMainUI];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewCell class]];

		[self initializeMainUI];
	}
	return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
	self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
	if (self) {
		[[[self class] appearance] applyInvocationRecursivelyTo:self upToSuperClass:[UITableViewCell class]];

		[self initializeMainUI];
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

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
	[super setAccessoryType:accessoryType];

	if (accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
		// needs a custom UITableViewCellAccessoryDisclosureIndicator to be properly colored
		DTCustomColoredAccessory* coloredAccessoryView = [DTCustomColoredAccessory accessoryWithColor:self.accessoryViewColor];
		[coloredAccessoryView setHighlightedColor:self.accessoryViewColor];
		self.accessoryView = coloredAccessoryView;
	}
}

#pragma mark - Helper Methods

- (void)initializeMainUI
{
	// tints the accesory view (excepting UITableViewCellAccessoryDisclosureIndicator case)
	self.tintColor = self.accessoryViewColor;
}

#pragma mark - PREAppearance Delegate Methods

+ (id)appearance
{
	return [PREAppearance appearanceForClass:[self class]];
}

#pragma mark - PREAssignableRemoteImageCell Delegate Methods

- (void)setRemoteImageWithURL:(NSURL*)imageURL
{
	VOCWeakify(self);
	[self.imageView setImageFromURL:imageURL
				   placeholderImage:[UIImage new]
						  applyTint:NO
				withCompletionBlock:^(UIImage* image, NSError* error, NSURL* imageURL) {
					VOCStrongify(self);
					[self setNeedsLayout];
				}];
}

@end
