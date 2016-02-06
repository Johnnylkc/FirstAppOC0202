//
//  PersonalView.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/5.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PersonalView.h" 

@implementation PersonalView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 250)];
        self.headerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headerView];
        
        self.backImage =
        [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.headerView.frame.size.width, 200)];
        self.backImage.image = [UIImage imageNamed:@"back"];
        [self.headerView addSubview:self.backImage];
        
        self.userImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 160, 90, 90)];
        self.userImage.image = [UIImage imageNamed:@"johnny"];
        self.userImage.layer.cornerRadius = 5;
        self.userImage.layer.borderWidth = 2;
        self.userImage.layer.borderColor = [UIColor whiteColor].CGColor;
        self.userImage.clipsToBounds = YES;
        [self.backImage addSubview:self.userImage];
        
        NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
        self.userName = [[UILabel alloc] initWithFrame:CGRectMake(120, 220, 200, 30)];
        self.userName.backgroundColor = [UIColor greenColor];
        self.userName.text = [userInfo valueForKey:@"userName"];
        [self.headerView addSubview:self.userName];
        
        self.uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 150, 100, 30)];
        self.uploadButton.backgroundColor = [UIColor blackColor];
        [self.uploadButton setTitle:@"上傳照片" forState:UIControlStateNormal];
        [self.uploadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.headerView addSubview:self.uploadButton];
        
        
    }

    return self;
}





@end
