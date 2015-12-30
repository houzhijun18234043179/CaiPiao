//
//  HMLuckyController.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMLuckyController.h"
#import "UIImage+Ex.h"
@interface HMLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HMLuckyController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   //跑马灯
    UIImage *img0 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *img1 = [UIImage imageNamed:@"lucky_entry_light1"];

    self.imageView.animationImages = @[img0,img1];
    self.imageView.animationDuration = 0.5;
    [self.imageView startAnimating]; //开启动画
    
    
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
