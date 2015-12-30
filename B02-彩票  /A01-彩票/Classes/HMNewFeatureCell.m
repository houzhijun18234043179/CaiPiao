//
//  HMNewFeatureCell.m
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMNewFeatureCell.h"
#import "HMTabBarController.h"
@interface HMNewFeatureCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation HMNewFeatureCell
//点击开始按钮
- (IBAction)btnStart:(id)sender {
    HMTabBarController *vc = [HMTabBarController new];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    
}
//设置背景图片
- (void)setBackgroudImageName:(NSString *)backgroudImageName {
    self.imageView.image = [UIImage imageNamed:backgroudImageName];
}

//控制按钮的显示或隐藏
- (void)setStartBtnHidden:(BOOL)hidden {
    self.startButton.hidden = hidden;
}

@end
