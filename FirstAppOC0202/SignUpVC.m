//
//  SignUpVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "SignUpVC.h"
#import "MainTVC.h"
#import "LoginVC.h"

#import "Backendless.h"

@interface SignUpVC ()

@property(strong,nonatomic)UITextField *emailTextField;
@property(strong,nonatomic)UITextField *passwordTextField;
@property(strong,nonatomic)UITextField *userNameTextField;
@property(strong,nonatomic)UIButton *signUpButton;

@property(strong,nonatomic)UITabBarController *tabBarController;
@property(strong,nonatomic)UIImage *tabBarIcon;
@property(strong,nonatomic)UIImage *selectedIcon;

@end

@implementation SignUpVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self allUI];

}



-(void)allUI
{
    ////emailTextField
    self.emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.emailTextField.center = CGPointMake(self.view.frame.size.width/2, 200);
    self.emailTextField.borderStyle = UITextBorderStyleBezel;
    self.emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.emailTextField.placeholder = @"email";
    [self.view addSubview:self.emailTextField];
    
    ////passwordTextField
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.passwordTextField.center = CGPointMake(self.view.frame.size.width/2, 250);
    self.passwordTextField.borderStyle = UITextBorderStyleBezel;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.placeholder = @"password";
    [self.view addSubview:self.passwordTextField];
    
    ////userNameTextField
    self.userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.userNameTextField.center = CGPointMake(self.view.frame.size.width/2, 300);
    self.userNameTextField.borderStyle = UITextBorderStyleBezel;
    self.userNameTextField.placeholder = @"username";
    [self.view addSubview:self.userNameTextField];
    
    ////signUpButton
    self.signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.signUpButton.center = CGPointMake(self.view.frame.size.width/2, 350);
    self.signUpButton.backgroundColor = [UIColor redColor];
    [self.signUpButton setTitle:@"註冊" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.signUpButton addTarget:self action:@selector(signUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signUpButton];
    
    }

-(void)signUp:(UIButton*)signUpButton
{
    
    BackendlessUser *user = [BackendlessUser new];
    user.email = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    user.name = self.userNameTextField.text;
    
    Responder *signUpResponder = [Responder responder:self selResponseHandler:@selector(responderHandler:) selErrorHandler:@selector(errorHandler:)];
    
    [backendless.userService registering:user responder:signUpResponder];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.emailTextField.text forKey:@"userEmail"];
    [defaults setObject:self.passwordTextField.text forKey:@"userPassword"];
    [defaults setObject:self.userNameTextField.text forKey:@"userName"];
    [defaults setObject:@"YES" forKey:@"loggedIn"];
    [defaults synchronize];
        
    
    MainTVC *controller = [MainTVC new];
    UINavigationController *controllerNav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    self.tabBarIcon = [UIImage imageNamed:@"001"];
    self.selectedIcon = [UIImage imageNamed:@"001"];
    controller.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"第一頁" image:self.tabBarIcon selectedImage:self.selectedIcon];
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:controllerNav, nil];
    self.tabBarController = [UITabBarController new];
    self.tabBarController.viewControllers = controllers;
    self.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    
    [self presentViewController:self.tabBarController animated:YES completion:nil];
    
}

-(void)responderHandler:(id)responder
{
    BackendlessUser *user = (BackendlessUser*)responder;
    NSLog(@"註冊成功%@",user);
   
}

-(void)errorHandler:(Fault*)fault
{
    NSLog(@"註冊失敗%@ , %@", fault.message, fault.detail);
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
