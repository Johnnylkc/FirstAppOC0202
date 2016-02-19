//
//  MainTVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "MainTVC.h"


@interface MainTVC ()


@end

@implementation MainTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[MainCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    UIBarButtonItem *logout = [[UIBarButtonItem alloc] initWithTitle:@"登出" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    self.navigationItem.leftBarButtonItem = logout;
    
    UIBarButtonItem *publish = [[UIBarButtonItem alloc] initWithTitle:@"post" style:UIBarButtonItemStylePlain target:self action:@selector(publish:)];
    self.navigationItem.rightBarButtonItem = publish;
    
   

}



////登出
-(void)logout:(id)logout
{
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
    [backendless.userService logout:responder];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@"NO" forKey:@"loggedIn"];
    [userDefault synchronize];
    
    NSLog(@"我想登出了 我累了");
    
}


-(id)responseHandler:(id)responder
{
    NSLog(@"成功登出");
    LandingVC *controller = [LandingVC new];
    UINavigationController *controllerNav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:controllerNav animated:YES completion:nil];
    return responder;
}


-(void)errorHandler:(Fault *)fault
{
    NSLog(@"想登出？！ 登出失敗喔%@ <%@>", fault.message, fault.detail);
}
////////以上是登出



-(void)publish:(id)publish
{

    
    PublishTVC *controller = [PublishTVC new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:nav animated:YES completion:nil];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    /////all frame
    cell.basicView.frame = CGRectMake(0, 0, self.view.frame.size.width, 340);
    
    cell.userHeadImage.frame = CGRectMake(10, 10, 50, 50);
   
    cell.userNameLabel.frame = CGRectMake(70, 15, 200, 30);
    cell.userNameLabel.font = [UIFont boldSystemFontOfSize:20];
    
    cell.countryLabel.frame = CGRectMake(70, 40, 200 , 20);
    cell.countryLabel.font = [UIFont systemFontOfSize:15];

    cell.postedImageButton.frame = CGRectMake(0, 70, self.view.frame.size.width, 200);
    [cell.postedImageButton addTarget:self action:@selector(viewPhoto:) forControlEvents:UIControlEventTouchUpInside];


    
    
    
    
    cell.userHeadImage.image = [UIImage imageNamed:@"005"];
    cell.userNameLabel.text = @"ketchup";
    cell.countryLabel.text = @"Taiwan , Kaohsiung";
    [cell.postedImageButton setBackgroundImage:[UIImage imageNamed:@"006"] forState:UIControlStateNormal];
    
    
    return cell;
}



-(void)viewPhoto:(UIButton*)postedImageButton
{
    NSLog(@"進入相片瀏覽模式");
    PhotoViewerVC *controller = [PhotoViewerVC new];
    
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:controller animated:YES completion:nil];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
