//
//  HMTabBarController.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMTabBarController.h"
#import "UIImage+Ex.h"
#import "HMTabBar.h"

@interface HMTabBarController () <HMTabBarDelegate>
@end

@implementation HMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1 加载子控制器
    [self addChildControllers];
    
    
  

    
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    //验证当前的tabBAr中是否生成了tabBArButton
//    NSLog(@"%@",self.tabBar.subviews);
//}

//1 加载子控制器
- (void)addChildControllers {
    //1 加载子控制器
    NSArray *sbNames = @[@"LotteryHall",@"Arena",@"Discovery",@"History",@"MyLottery"];
    //
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *name in sbNames) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
        UINavigationController *navC = [sb instantiateInitialViewController];
        
        // 使用此方式设置tabBarController的子控制器, 不会立即添加子控制器对应的tabBarButton, 会在viewWillAppear中生成
        //[self addChildViewController:navC];  //    self.viewControllers
        [mArray addObject:navC];
    }
    
    //使用此方式设置tabBarController的子控制器,会立即生成每一个子控制器对应的tabBarButton
    self.viewControllers = mArray.copy;
    

    //验证当前的tabBAr中是否生成了tabBArButton
//    NSLog(@"%@",self.tabBar.subviews);
    
    //2 加载自定义tabBar
    HMTabBar *myTabBar = [HMTabBar tabBarWithSBNames:sbNames];
    myTabBar.frame = self.tabBar.bounds;
    //
    myTabBar.delegate = self;
    
    //把自定义tabBar添加到系统的tabBar中
    [self.tabBar addSubview:myTabBar];
    
//    [self.view addSubview:myTabBar];
    //删除系统的tabBar 课下查看view的层级结构
//    [self.tabBar removeFromSuperview];
}


//tabBar代理中的方法
- (void)tabBarDidClickedButton:(HMTabBar *)tabBar index:(NSInteger)index {
    //切换子控制器
    self.selectedIndex = index;
}



@end
