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

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];


    
}

-(void)allUI
{
   
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
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
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.scrollEnabled = NO;
    
    self.pickedImage =
    [[UIImageView alloc] initWithFrame:CGRectMake(10, 0,self.tableView.frame.size.width-20 , 400)];
    self.pickedImage.contentMode = UIViewContentModeScaleAspectFit;
    self.pickedImage.userInteractionEnabled = YES;

    self.deleteImageButton = [[UIButton alloc] initWithFrame:CGRectMake(self.pickedImage.frame.size.width-50, 10, 20, 20)];
    [self.deleteImageButton setBackgroundImage:[UIImage imageNamed:@"013"] forState:UIControlStateNormal];
    [self.deleteImageButton addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
   [self.pickedImage addSubview:self.deleteImageButton];


    self.functionBar =
    [[FuntionBarView alloc] initWithFrame:CGRectMake(0, self.tableView.frame.size.height -20, self.tableView.frame.size.width, 40)];
    
    [self.functionBar.cameraButton addTarget:self action:@selector(openCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.functionBar.albumButton addTarget:self action:@selector(openAlbum:) forControlEvents:UIControlEventTouchUpInside];
    [self.functionBar.publishButton addTarget:self action:@selector(publish:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:self.functionBar];

    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
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

-(void)openCamera:(UIButton*)functionBar
{
    NSLog(@"給我打開相機");
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = YES;
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)openAlbum:(UIButton*)functionBar
{
    NSLog(@"給我打開相機膠卷");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.pickedImage.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)deleteImage:(UIButton*)deleteImageButton
{
    NSLog(@"我要刪除這張照片");
    self.pickedImage.image = nil;
}

-(void)publish:(UIButton*)functionBar
{
    NSLog(@"送出囉");
    
//    NSData *data = UIImageJPEGRepresentation(self.pickedImage.image, 0.7);
//    
//    NSString *fileName = [NSString stringWithFormat:@"img/%0.0f.jpeg",[[NSDate date] timeIntervalSince1970] ];
//    
//    [backendless.fileService upload:fileName content:data response:^(BackendlessFile *uploadFile) {
//        NSLog(@"上傳成功");
//    } error:^(Fault *fault) {
//        NSLog(@"上傳失敗");
//    }];

    NSData *data = UIImageJPEGRepresentation(self.pickedImage.image, 0.7);;
    
    [backendless.fileService upload:self.textView.text content:data
                           response:^(BackendlessFile *uploadedFile) {
                               NSLog(@"File has been uploaded. File URL is - %@", uploadedFile.fileURL);
                           }
                              error:^(Fault *fault) {
                                  NSLog(@"Server reported an error: %@", fault); 
                              }];
    
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



-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    self.textView.inputAccessoryView.frame = CGRectMake(0, self.tableView.frame.size.width, 300, 40);
    
    return YES;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    self.functionBar.transform = CGAffineTransformMakeTranslation(0,scrollView.contentOffset.y);
}



- (void)keyboardWillShow:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    NSNumber *durationValue = info[UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curveValue = info[UIKeyboardAnimationCurveUserInfoKey];
    NSValue *endFrame = info[UIKeyboardFrameEndUserInfoKey];
    
    [UIView animateWithDuration:durationValue.doubleValue delay:0 options:(curveValue.intValue << 16) animations:^{
        
        self.functionBar.frame = CGRectMake(0,[endFrame CGRectValue].origin.y - self.functionBar.bounds.size.height,self.functionBar.bounds.size.width,self.functionBar.bounds.size.height);
        
    }
     
        completion:nil];
}


- (void)keyboardWillHide:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    NSNumber *durationValue = info[UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curveValue = info[UIKeyboardAnimationCurveUserInfoKey];
    
    [UIView animateWithDuration:durationValue.doubleValue delay:0 options:(curveValue.intValue << 16) animations:^{
    
        self.functionBar.frame = CGRectMake(0,self.view.bounds.size.height - self.functionBar.bounds.size.height,self.functionBar.bounds.size.width,self.functionBar.bounds.size.height);
        
    }
     
        completion:nil];
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.row)
    {
        case 0:
            [cell addSubview:self.textView];
            break;
            
        case 1:
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
