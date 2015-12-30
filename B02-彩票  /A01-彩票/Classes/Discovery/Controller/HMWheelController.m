//
//  HMWheelController.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMWheelController.h"
#import "HMWheelView.h"
@interface HMWheelController ()

@end

@implementation HMWheelController
- (IBAction)btnClose:(id)sender {
    //关闭
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载转盘
    HMWheelView *wheelView = [HMWheelView wheelView];
    [self.view addSubview:wheelView];
    
    wheelView.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
