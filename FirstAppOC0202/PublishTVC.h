//
//  PublishTVC.h
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/15.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuntionBarView.h"

#import "Backendless.h"


@interface PublishTVC : UITableViewController
<UITextViewDelegate , UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property(strong,nonatomic)UIButton *userImageButton;
@property(strong,nonatomic)UIButton *cancelButton;

@property(strong,nonatomic)UITextView *textView;
@property(strong,nonatomic)UIImageView *pickedImage;
@property(strong,nonatomic)UIButton *deleteImageButton;

@property(strong,nonatomic)FuntionBarView *functionBar;


@end
