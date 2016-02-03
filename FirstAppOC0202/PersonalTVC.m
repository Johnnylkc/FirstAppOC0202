//
//  PersonalTVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/4.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PersonalTVC.h"
#import "PersonalCell.h"

@interface PersonalTVC ()

@property(strong,nonatomic)UIView *headerView;
@property(strong,nonatomic)UIImageView *backImage;

@end

@implementation PersonalTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[PersonalCell class] forCellReuseIdentifier:@"cell"];
    
    [self allUI];
    
}

-(void)allUI
{
    ////headerView
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.headerView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = self.headerView;
    
    self.backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
    self.backImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    [self.headerView addSubview:self.backImage];
    
}



- (void)didReceiveMemoryWarning {
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
    return 20;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    
    
    return cell;
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
