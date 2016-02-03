//
//  LoginVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "LoginVC.h"
#import "MainTVC.h"
#import "PersonalTVC.h"

#import "Backendless.h"



@interface LoginVC ()

@property(strong,nonatomic)UITextField *emailTextField;
@property(strong,nonatomic)UITextField *passwordTextField;
@property(strong,nonatomic)UIButton *loginButton;

@property(strong,nonatomic)UITabBarController *tabBarController;
@property(strong,nonatomic)UIImage *tabBarIcon;
@property(strong,nonatomic)UIImage *selectedIcon;
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
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.placeholder = @"password";
    [self.view addSubview:self.passwordTextField];
    
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.loginButton.center = CGPointMake(self.view.frame.size.width/2, 300);
    self.loginButton.backgroundColor = [UIColor orangeColor];
    [self.loginButton setTitle:@"登入" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.emailTextField.text = [defaults objectForKey:@"userEmail"];
    self.passwordTextField.text = [defaults objectForKey:@"userPassword"];
    
}

-(void)login:(UIButton*)loginButton
{
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
    [backendless.userService login:self.emailTextField.text password:self.passwordTextField.text responder:responder];
    
}

-(id)responseHandler:(Responder*)responder
{
    BackendlessUser *user = (BackendlessUser*)responder;
    NSLog(@"成功登入%@",user);
    
    [backendless.userService setStayLoggedIn:YES];
    
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:@"YES" forKey:@"loggedIn"];
        [userDefault synchronize];
    
    
        MainTVC *onePage = [MainTVC new];
        UINavigationController *onePageNav = [[UINavigationController alloc] initWithRootViewController:onePage];
        self.tabBarIcon = [UIImage imageNamed:@"001"];
        self.selectedIcon = [UIImage imageNamed:@"001"];
        onePage.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"第一頁" image:self.tabBarIcon selectedImage:self.selectedIcon];
    
        PersonalTVC *twoPage = [PersonalTVC new];
        UINavigationController *twoPageNav = [[UINavigationController alloc] initWithRootViewController:twoPage];
        self.tabBarIcon = [UIImage imageNamed:@"002"];
        self.selectedIcon = [UIImage imageNamed:@"002"];
        twoPage.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"個人檔案" image:self.tabBarIcon selectedImage:self.selectedIcon];
    
    
        NSArray *controllers = [[NSArray alloc] initWithObjects:onePageNav,twoPageNav, nil];
        self.tabBarController = [UITabBarController new];
        self.tabBarController.viewControllers = controllers;
        self.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:self.tabBarController animated:YES completion:nil];
    
    
    return responder;
}

-(void)errorHandler:(Fault*)fault
{
    NSLog(@"登入失敗%@ , %@" , fault.message , fault.detail);
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
