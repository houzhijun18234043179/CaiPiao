//
//  HMNavController.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMNavController.h"
#import "UIImage+Ex.h"
@interface HMNavController ()

@end

@implementation HMNavController

//当这个类,在第一次使用之前(调用此类的第一个方法执行) 会执行,并且只会执行一次
+ (void)initialize {
    //统一 设置导航条的样式
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    NSLog(@"initialize");
    //设置导航条不透明
    navBar.translucent = NO;
    
    //统一设置item的样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"viewDidLoad");
    
}
//后退
- (void)backClick {
    [self popViewControllerAnimated:YES];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //1 自定义后退按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage originalImage:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixed.width = -10;
    
    viewController.navigationItem.leftBarButtonItems = @[fixed,backItem];
    
    //隐藏tabBAr
    viewController.hidesBottomBarWhenPushed = YES;
    
    //恢复手势后退
    self.interactivePopGestureRecognizer.delegate = nil;
    
    [super pushViewController:viewController animated:animated];
    
    
    
    
}

@end
