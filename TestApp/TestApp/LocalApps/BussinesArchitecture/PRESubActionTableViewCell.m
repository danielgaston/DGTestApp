//
//  SubActionTableViewCell.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PRESubActionTableViewCell.h"

@interface PRESubActionTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation PRESubActionTableViewCell

- (void)setAction:(PREAction*)action
{
	_action = action;
	self.titleLabel.text = action.title;
	self.separatorInset = UIEdgeInsetsMake(0, self.titleLabel.frame.origin.x, 0, 0);
}

@end
