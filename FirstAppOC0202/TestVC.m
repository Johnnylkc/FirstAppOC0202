//
//  TestVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/9.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "TestVC.h"

@interface TestVC () 



@end

@implementation TestVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self allUI];
    

}



-(void)allUI
{
    self.pickedImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
    self.pickedImage.center = CGPointMake(self.view.frame.size.width/2, 200);
    self.pickedImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.pickedImage];
    
    self.cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.cameraButton.center = CGPointMake(self.view.frame.size.width/2, 400);
    self.cameraButton.backgroundColor = [UIColor blackColor];
    [self.cameraButton setTitle:@"相機" forState:UIControlStateNormal];
    [self.cameraButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.cameraButton addTarget:self action:@selector(openCam:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cameraButton];
    
    self.albumButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.albumButton.center = CGPointMake(self.view.frame.size.width/2, 450);
    self.albumButton.backgroundColor = [UIColor blackColor];
    [self.albumButton setTitle:@"相簿" forState:UIControlStateNormal];
    [self.albumButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.albumButton addTarget:self action:@selector(openAlbum:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.albumButton];
    

    self.uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.uploadButton.center = CGPointMake(self.view.frame.size.width/2, 500);
    self.uploadButton.backgroundColor = [UIColor redColor];
    [self.uploadButton setTitle:@"GO" forState:UIControlStateNormal];
    [self.uploadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.uploadButton addTarget:self action:@selector(upload:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.uploadButton];
        
    
    
}

-(void)upload:(UIButton*)uploadButton
{
    NSData *data = UIImageJPEGRepresentation(self.pickedImage.image, 0.7);
    NSString *fileName = [NSString stringWithFormat:@"img/%0.0f.jpeg",[[NSDate date] timeIntervalSince1970] ];
    
    [backendless.fileService upload:fileName content:data response:^(BackendlessFile *uploadFile) {
        NSLog(@"上傳成功");
    } error:^(Fault *fault) {
        NSLog(@"上傳失敗");
    }];

//    [backendless.fileService saveFile:@"userPhotos/photos" fileName:@"photos" content:data response:^(BackendlessFile *uploadFile) {
//        NSLog(@"恭喜 上傳成功");
//    } error:^(Fault *fault) {
//        NSLog(@"上傳失敗");
//    }];
//    
}


-(void)openCam:(UIButton*)cameraButton
{
 
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = YES;
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:nil];

  
    
    
}


-(void)openAlbum:(UIButton*)albumButton
{
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



- (void)didReceiveMemoryWarning {
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
