//
//  PublishVC.h
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/14.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishVC : UIViewController <UITextViewDelegate>

@property(strong,nonatomic)UIImageView *userImage;
@property(strong,nonatomic)UIButton *exitButton;
@property(strong,nonatomic)UITextView *textView;
@property(strong,nonatomic)UILabel *placeholderLabel;
@property(strong,nonatomic)UIImageView *choosedImage;

@end
