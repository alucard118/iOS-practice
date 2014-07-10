//
//  BIDCCFNewsTableViewCell.m
//  TechNews 3
//
//  Created by MyMac on 14-7-4.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDCCFNewsTableViewCell.h"

@implementation BIDCCFNewsTableViewCell

@synthesize title;
@synthesize summary;
@synthesize imagesName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
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
