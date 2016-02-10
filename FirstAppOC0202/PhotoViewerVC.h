//
//  PhotoViewerVC.h
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/10.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTVC.h"

@interface PhotoViewerVC : UIViewController <UIScrollViewDelegate>
{
    CGFloat viewWidth,viewHeight;
}

@property(strong,nonatomic)UIScrollView *scrollView;
@property(strong,nonatomic)UIImageView *detailImage;
@property(strong,nonatomic)UITapGestureRecognizer *tapGesture;


@end
