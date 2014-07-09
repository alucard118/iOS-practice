//
//  BIDNewsTableViewCell.m
//  XML Parse
//
//  Created by MyMac on 14-7-8.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDNewsTableViewCell.h"

#define kTitleValueTag 1
#define kLinkValueTag 2
#define kDescriptionValueTag 3

@implementation BIDNewsTableViewCell

@synthesize title;
@synthesize description;
@synthesize link;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect titleLabelRect=CGRectMake(100, 5, self.bounds.size.width-120, 18);
        UILabel *titleLabel=[[UILabel alloc]initWithFrame:titleLabelRect];
        titleLabel.textAlignment=NSTextAlignmentLeft;
        titleLabel.font=[UIFont boldSystemFontOfSize:14];
        titleLabel.tag=kTitleValueTag;
        [self.contentView addSubview:titleLabel];
        
        CGRect descriptionLabelRect=CGRectMake(100, 25, self.bounds.size.width-120, 40);
        UILabel *descritionLabel=[[UILabel alloc]initWithFrame:descriptionLabelRect];
        descritionLabel.textAlignment=NSTextAlignmentLeft;
        descritionLabel.font=[UIFont systemFontOfSize:11];
        descritionLabel.numberOfLines=2;
        descritionLabel.tag=kDescriptionValueTag;
        [self.contentView addSubview:descritionLabel];
        // Initialization code
    }
    return self;
}
-(void)setTitle:(NSString *)t{
    if(![t isEqual:title]){
        title=[t copy];
        UILabel *titleLabel=(UILabel *)[self.contentView viewWithTag:kTitleValueTag];
        titleLabel.text=title;
    }
}

-(void)setDescription:(NSString *)d{
    if (![d isEqual:description]) {
        description=[d copy];
        UILabel *descriptionLabel=(UILabel *)[self.contentView viewWithTag:kDescriptionValueTag];
        descriptionLabel.text=description;
    }
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
