//
//  SectionHeaderView.m
//  Pre
//
//  Created by Emilio on 18/04/2017.
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView

- (instancetype)init
{
	self = [[[NSBundle mainBundle] loadNibNamed:@"SectionHeaderView" owner:self options:nil] objectAtIndex:0];

	if (self) {
		self.titleLabel.layer.cornerRadius = 5;
		self.titleLabel.clipsToBounds = YES;
	}

	return self;
}

@end
