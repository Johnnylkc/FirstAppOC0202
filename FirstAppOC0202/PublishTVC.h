//
//  PublishTVC.h
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/15.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuntionBarView.h"

@interface PublishTVC : UITableViewController <UITextViewDelegate>


@property(strong,nonatomic)UIButton *userImageButton;
@property(strong,nonatomic)UIButton *cancelButton;

@property(strong,nonatomic)UITextView *textView;
@property(strong,nonatomic)UIImageView *pickedImage;


@end
