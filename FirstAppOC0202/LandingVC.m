//
//  LandingVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "LandingVC.h"

#import "SignUpVC.h"
#import "LoginVC.h"

@interface LandingVC ()

@property(strong,nonatomic)UIButton *signUpButton;
@property(strong,nonatomic)UIButton *logInButton;

@end

@implementation LandingVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self allUI];
    
}

-(void)allUI
{
    ////signUpButton
    self.signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.signUpButton.center = CGPointMake(self.view.frame.size.width/2, 500);
    self.signUpButton.backgroundColor = [UIColor redColor];
    [self.signUpButton setTitle:@"註冊" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.signUpButton addTarget:self action:@selector(signUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signUpButton];
    
    self.logInButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.logInButton.center = CGPointMake(self.view.frame.size.width/2, 550);
    self.logInButton.backgroundColor = [UIColor blueColor];
    [self.logInButton setTitle:@"登入" forState:UIControlStateNormal];
    [self.logInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logInButton addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.logInButton];
    
}

-(void)signUp:(UIButton*)signUpButton
{
    SignUpVC *controller = [SignUpVC new];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)logIn:(UIButton*)logInButton
{
    LoginVC *controller = [LoginVC new];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];
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
