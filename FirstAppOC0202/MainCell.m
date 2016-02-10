//
//  MainCell.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.basicView = [[UIView alloc] init];
        self.basicView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.basicView];
        
        self.userHeadImage = [[UIImageView alloc] init];
        self.userHeadImage.backgroundColor = [UIColor grayColor];
        self.userHeadImage.layer.cornerRadius = self.userHeadImage.frame.size.width/2;
        self.userHeadImage.contentMode = UIViewContentModeScaleToFill;
        [self.basicView addSubview:self.userHeadImage];
        
        self.userNameLabel = [[UILabel alloc] init];
        [self.basicView addSubview:self.userNameLabel];
        
        self.countryLabel = [[UILabel alloc] init];
        self.countryLabel.textColor = [UIColor grayColor];
        [self.basicView addSubview:self.countryLabel];
        
        self.postedImageButton = [[UIButton alloc] init];
        [self.basicView addSubview:self.postedImageButton];
        
        
        
        
    }

    return self;
}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
