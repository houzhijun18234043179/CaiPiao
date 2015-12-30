//
//  HMArenaController.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#define color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#import "HMArenaController.h"

@interface HMArenaController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation HMArenaController
//当segmentedControll发生变化
- (IBAction)valueChanged:(id)sender {
    
    UISegmentedControl *c = sender;
    
//    c.selectedSegmentIndex
    //获取segmentedControl中选择的标题
    NSString *title = [c titleForSegmentAtIndex:c.selectedSegmentIndex];
    NSLog(@"%@",title);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条的背景图片
    UINavigationBar *bar = self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置segmentedControl的样式
    [self.segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [self.segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    //7 170 122
    [self.segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:color(7, 170, 122)} forState:UIControlStateNormal];

    
}
@end
