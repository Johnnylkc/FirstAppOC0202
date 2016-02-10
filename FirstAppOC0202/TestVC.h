//
//  TestVC.h
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/9.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Backendless.h"


@interface TestVC : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(strong,nonatomic)UIImageView *pickedImage;
@property(strong,nonatomic)UIButton *cameraButton;
@property(strong,nonatomic)UIButton *albumButton;
@property(strong,nonatomic)UIButton *uploadButton;

@end
