//
//  LeftTableViewCell.m
//  MTA-Demo
//
//  Created by xiangchen on 20/08/14.
//  Copyright (c) 2014 developer. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.bounds;
    [self.imageView setFrame:CGRectMake(bounds.size.width - self.imageView.frame.origin.x*2, 0, self.imageView.frame.size.width , self.imageView.frame.size.height)];
    [self.textLabel setFrame:CGRectMake(bounds.size.width - self.textLabel.frame.origin.x*2 - self.imageView.frame.size.width, 0, self.textLabel.frame.size.width , self.textLabel.frame.size.height)];
    [self.detailTextLabel setFrame:CGRectMake(bounds.size.width - self.detailTextLabel.frame.origin.x*2 - self.imageView.frame.size.width, self.detailTextLabel.frame.origin.y, self.detailTextLabel.frame.size.width , self.detailTextLabel.frame.size.height)];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
