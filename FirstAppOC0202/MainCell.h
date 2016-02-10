//
//  MainCell.h
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell : UITableViewCell

@property(strong,nonatomic)UIView *basicView;
@property(strong,nonatomic)UIImageView *userHeadImage;
@property(strong,nonatomic)UILabel *userNameLabel;
@property(strong,nonatomic)UILabel *countryLabel;
@property(strong,nonatomic)UIButton *postedImageButton;

@end
