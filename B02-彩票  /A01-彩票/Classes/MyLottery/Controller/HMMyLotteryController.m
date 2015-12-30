//
//  HMMyLotteryController.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMMyLotteryController.h"
#import "UIImage+Ex.h"
#import "HMNavController.h"

#import "HMSettingController.h"
@interface HMMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *item;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation HMMyLotteryController
//点击设置按钮,跳转到设置控制器
- (IBAction)settingClick:(id)sender {
    HMSettingController *vc = [HMSettingController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    self.item.image = [self.item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置登录按钮的背景图片的拉伸效果
   UIImage *img =  [self.loginBtn backgroundImageForState:UIControlStateHighlighted];
   img =  [ img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
    
    [self.loginBtn setBackgroundImage:img forState:UIControlStateHighlighted];
    
}

//点击登录按钮 
- (IBAction)btnLogin:(id)sender {

    UIViewController *vc = [UIViewController new];
    vc.title = @"登录";
    vc.view.backgroundColor = [UIColor whiteColor];
    
    HMNavController *navC = [[HMNavController alloc] initWithRootViewController:vc];
    
    UIBarButtonItem *item =   [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];

    vc.navigationItem.leftBarButtonItems = @[item];
    
    [self presentViewController:navC animated:YES completion:nil];
}

- (void)btnClick {
    NSLog(@"===");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
