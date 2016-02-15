//
//  PublishVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/14.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PublishVC.h"

@interface PublishVC ()

@end

@implementation PublishVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self allUI];

}


-(void)allUI
{
    self.userImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    self.userImage.layer.cornerRadius = 5;
    self.userImage.image = [UIImage imageNamed:@"johnny"];
    [self.view addSubview:self.userImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
