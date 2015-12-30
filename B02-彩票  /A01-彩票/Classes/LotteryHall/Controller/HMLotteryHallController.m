//
//  HMLotteryHallController.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMLotteryHallController.h"
#import "UIView+Ex.h"
@interface HMLotteryHallController ()
@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) UIImageView *imgView;

@end

@implementation HMLotteryHallController
//点击活动按钮
- (IBAction)btnClick:(id)sender {
    //1 弹出遮盖的view
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //当导航控制器内部有scrollView的时候,内部的scrollView会往下偏移64;
    UIView *coverView = [UIView new];
    self.coverView = coverView;
    [window addSubview:coverView];
    
    coverView.frame =[UIScreen mainScreen].bounds;
  
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    //2 弹出图片
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aa"]];
    self.imgView = imgView;
    [window addSubview:imgView];
    imgView.center = coverView.center;
    
    //3 关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imgView addSubview:closeBtn];
    //开启imgView和用户的交互
    imgView.userInteractionEnabled = YES;
    
    //
    [closeBtn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    //让按钮的大小和内容一样
    [closeBtn sizeToFit];
    
    closeBtn.x = imgView.width - closeBtn.width;
    closeBtn.y = 0;
    
    //给关闭按钮注册事件
    [closeBtn addTarget:self action:@selector(btnClose) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClose {
    [UIView animateWithDuration:1 animations:^{
        self.coverView.alpha = 0;
        self.imgView.frame = CGRectMake(35, 45, 0, 0);
        [self.imgView.subviews[0] removeFromSuperview];
        
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.imgView removeFromSuperview];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //设置导航条的样式
//    
//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    

}

@end
