//
//  PublishTVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/15.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PublishTVC.h"

@interface PublishTVC ()

@end

@implementation PublishTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self allUI];
    
    
}

-(void)allUI
{
   
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    self.userImageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,40, 40)];
    [self.userImageButton setBackgroundImage:[UIImage imageNamed:@"johnny"] forState:UIControlStateNormal];
    self.userImageButton.layer.cornerRadius = 5;
    self.userImageButton.clipsToBounds = YES;
    [self.userImageButton addTarget:self action:@selector(doSomeShit:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"007"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:self.userImageButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:self.cancelButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    /////////////////以上是navigation的UI
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
    self.textView.delegate = self;
    //self.textView.backgroundColor = [UIColor orangeColor];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.scrollEnabled = NO;
    [self.textView becomeFirstResponder];
    
    self.pickedImage =
    [[UIImageView alloc] initWithFrame:CGRectMake(10, 0,self.tableView.frame.size.width-20 , 400)];
    self.pickedImage.contentMode = UIViewContentModeScaleAspectFit;
    self.pickedImage.backgroundColor = [UIColor redColor];

    
    FuntionBarView *functionBar =
    [[FuntionBarView alloc] initWithFrame:CGRectMake(0, self.tableView.frame.size.height-100, self.tableView.frame.size.width, 55)];
    [functionBar.cameraButton addTarget:self action:@selector(cameraOrphotos:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:functionBar];
    

    
}

-(void)doSomeShit:(UIButton*)userImageButton
{
    NSLog(@"這個按鈕目前還沒給他功能");
    NSLog(@"%f",self.pickedImage.image.size.width);
}

-(void)cancel:(UIButton*)cacelButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.textView endEditing:YES];
}

-(void)cameraOrphotos:(UIButton*)functionBar
{
    NSLog(@"t55555");
}

/////讓textView可以隨著內容的字打的越多 高度跟著改變
- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, CGFLOAT_MAX)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
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
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    
    switch (indexPath.row)
    {
        case 0:
            rowHeight = self.textView.frame.size.height;
            break;
            
        case 1:
            rowHeight = self.pickedImage.frame.size.height;
            break;
            
            
        default:
            break;
    }
    
    return rowHeight;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UITableViewCell *cell =
    [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    
    
    switch (indexPath.row)
    {
        case 0:
            [cell addSubview:self.textView];
            break;
            
        case 1:
            self.pickedImage.image = [UIImage imageNamed:@"010"];
            [cell addSubview:self.pickedImage];
            break;
        
        default:
            break;
    }
    
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
