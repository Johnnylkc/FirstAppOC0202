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
    self.userImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 50, 50)];
    self.userImage.layer.cornerRadius = 5;
    self.userImage.image = [UIImage imageNamed:@"johnny"];
    [self.view addSubview:self.userImage];
    
    self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-80, 40, 60, 30)];
    [self.exitButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.exitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.exitButton addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    self.exitButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.exitButton.layer.borderWidth = 1;
    [self.view addSubview:self.exitButton];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 350, 300)];
    self.textView.center = CGPointMake(self.view.frame.size.width/2, 250);
    //self.textView.backgroundColor = [UIColor orangeColor];
    self.textView.delegate = self;
    [self.textView setTextColor:[UIColor grayColor]];
    self.textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.textView];
    
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 30)];
    [self.placeholderLabel setTextColor:[UIColor lightGrayColor]];
    self.placeholderLabel.font = [UIFont boldSystemFontOfSize:15];
    self.placeholderLabel.text = @"你想說些什麼嗎?";
    [self.textView addSubview:self.placeholderLabel];
    
}

-(void)exit:(UIButton*)exitButton
{
    NSLog(@"我要退出");
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (![text isEqualToString:@""] )
    {
        self.placeholderLabel.hidden = YES;
    }
    else if ([text isEqualToString:@""] && range.location  ==  0  && range.length  ==  0)
    {
        self.placeholderLabel.hidden = NO;
    }

    return YES;
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
