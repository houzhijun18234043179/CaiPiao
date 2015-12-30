//
//  HMGroupBuyController.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMGroupBuyController.h"
#import "UIImage+Ex.h"
#import "UIView+Ex.h"
#import "HMTitleButton.h"
@interface HMGroupBuyController ()

@end

@implementation HMGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    

  

    
    //2 标题
    HMTitleButton *titleBtn = [HMTitleButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    //设置选中状态下地背景图片
    //142 44
    UIImage *backImg = [UIImage imageNamed:@"navTitleSel"] ;
    [titleBtn setBackgroundImage:backImg forState:UIControlStateSelected];
    [titleBtn sizeToFit];
    
    //设置按钮的大小和背景图片的大小一致
    titleBtn.width = backImg.size.width;
    titleBtn.height = backImg.size.height;
    self.navigationItem.titleView = titleBtn;
    
    //给按钮注册事件
    [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //3 右边的两个按钮
    UIView *view = [[UIView alloc] init];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        item3.width = -10;
    self.navigationItem.rightBarButtonItems = @[item3,item];
    
    //两个按钮
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn1];
    [btn1 setTitle:@"发合买" forState:UIControlStateNormal];
    [btn1 sizeToFit];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn2];
    [btn2 setImage:[UIImage imageNamed:@"NavInfoFlat"] forState:UIControlStateNormal];
    [btn2 sizeToFit];
    
    
    //设置view的大小
    view.width = btn1.width + btn2.width + 5;
    view.height = 44;
 
    //
    btn1.y = (view.height - btn1.height ) / 2;
    btn2.y = (view.height - btn2.height) / 2;
    btn2.x = btn1.width + 5;
    
    //使用系统的UIBarButtonItem.多个UIBarButtonItem之间的距离我们无法控制
//    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"发合买" style:UIBarButtonItemStylePlain target:nil action:nil];
//    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavInfoFlat"] style:UIBarButtonItemStylePlain target:nil action:nil];
//    
//    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    item3.width = -10;
//
//    
//    self.navigationItem.rightBarButtonItems = @[item3,item2,item1];

}

//点击标题按钮
- (void)btnClick:(UIButton *)sender {
    //1 设置按钮选中
    sender.selected = !sender.isSelected;
    
    //2 旋转三角
    [UIView animateWithDuration:0.25 animations:^{
        
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
    
    
    //3 点击按钮的时候,当按钮是选中状态,弹出view
    if (sender.isSelected) {
        UIView *popView = [[UIView alloc] init];
        [self.view addSubview:popView];
        popView.frame = CGRectMake(0, 0, self.view.width, self.view.height/2);
        popView.backgroundColor = [UIColor blackColor];
        popView.alpha = 0.5;
    }else{
        [[self.view.subviews lastObject] removeFromSuperview];
    }
}



@end
