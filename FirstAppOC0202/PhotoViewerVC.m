//
//  PhotoViewerVC.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/10.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PhotoViewerVC.h"

@interface PhotoViewerVC () 


@end

@implementation PhotoViewerVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    viewWidth = self.view.frame.size.width;
    viewHeight = self.view.frame.size.height;
    
    [self allUI];
    

}


-(void)allUI
{
    
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.view.frame;
    self.scrollView.delegate = self;
    //self.scrollView.contentSize = CGSizeMake(viewWidth*3, viewHeight*3);
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.minimumZoomScale  = 1;
    self.scrollView.clipsToBounds = YES;
    [self.view addSubview:self.scrollView];
    
    self.detailImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 200)];
    self.detailImage.center = CGPointMake(viewWidth/2, viewHeight/2);
    self.detailImage.image = [UIImage imageNamed:@"006"];
    [self.scrollView addSubview:self.detailImage];
    
    
}


-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.detailImage;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
