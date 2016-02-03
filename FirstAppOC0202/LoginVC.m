//
//  LoginVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "LoginVC.h"
#import "MainTVC.h"

#import "Backendless.h"

@interface LoginVC ()

@property(strong,nonatomic)UITextField *emailTextField;
@property(strong,nonatomic)UITextField *passwordTextField;
@property(strong,nonatomic)UIButton *loginButton;


@end

@implementation LoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self allUI];


}

-(void)allUI
{
    self.emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.emailTextField.center = CGPointMake(self.view.frame.size.width/2, 200);
    self.emailTextField.borderStyle = UITextBorderStyleBezel;
    self.emailTextField.placeholder = @"email";
    [self.view addSubview:self.emailTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.passwordTextField.center = CGPointMake(self.view.frame.size.width/2, 250);
    self.passwordTextField.borderStyle = UITextBorderStyleBezel;
    self.passwordTextField.placeholder = @"password";
    [self.view addSubview:self.passwordTextField];
    
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.loginButton.center = CGPointMake(self.view.frame.size.width/2, 300);
    self.loginButton.backgroundColor = [UIColor orangeColor];
    [self.loginButton setTitle:@"登入" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    
    
}

-(void)login:(UIButton*)loginButton
{
    
    [self userLogin];
    
    MainTVC *controller = [MainTVC new];
    UINavigationController *controllerNav = [[UINavigationController alloc] initWithRootViewController:controller];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controllerNav animated:YES completion:nil];
    
}

-(void)userLogin
{
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
    [backendless.userService login:self.emailTextField.text password:self.passwordTextField.text responder:responder];
    

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
