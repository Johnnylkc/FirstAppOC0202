//
//  FuntionBarView.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/17.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "FuntionBarView.h"

@implementation FuntionBarView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, 25, 25)];
        [self.cameraButton setBackgroundImage:[UIImage imageNamed:@"009"] forState:UIControlStateNormal];
        [self addSubview:self.cameraButton];
        
        self.albumButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 5, 25, 25)];
        [self.albumButton setBackgroundImage:[UIImage imageNamed:@"012"] forState:UIControlStateNormal];
        [self addSubview:self.albumButton];
        
        self.publishButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 5, 50, 30)];
        self.publishButton.backgroundColor = [UIColor greenColor];
        self.publishButton.layer.cornerRadius = 5;
        self.publishButton.clipsToBounds = YES;
        [self.publishButton setTitle:@"送出" forState:UIControlStateNormal];
        [self addSubview:self.publishButton];
        
    }

    return  self;
}

@end
