//
//  HMTabBar.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMTabBar.h"
#import "HMTabBarButton.h"
@interface HMTabBar ()
//记录上一个按钮
@property (nonatomic, weak) UIButton *previousBtn;
@end

@implementation HMTabBar
//1 自定义tabBar
+ (instancetype)tabBarWithSBNames:(NSArray *)sbNames {
    HMTabBar *tabBar = [self new];
    //更好地选择
//    sbNames enumerateObjectsUsingBlock:<#^(id obj, NSUInteger idx, BOOL *stop)block#>
    
    //生成tabBar中的按钮
    for (NSString *name in sbNames) {
        HMTabBarButton *btn = [HMTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = tabBar.subviews.count;
        
        [tabBar addSubview:btn];
        //获取图片的名称
        NSString *imgName = [NSString stringWithFormat:@"TabBar_%@_new",name];
        NSString *selImgName = [NSString stringWithFormat:@"TabBar_%@_selected_new",name];

        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selImgName] forState:UIControlStateSelected];
        //注册事件
        [btn addTarget:tabBar action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    }
    
    //让第一个按钮默认选中
    [tabBar btnClick:tabBar.subviews[0] ];
    
    return tabBar;
}

- (void)btnClick:(UIButton *)sender {
    //上一个按钮不选中
    [self.previousBtn setSelected:NO];
    //让当前按钮选中
    sender.selected = YES;
  
    
    //记录上一个按钮
    self.previousBtn = sender;
    
    
    //3 在合适的时机通知代理(调用代理方法)
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedButton:index:)]) {
        [self.delegate tabBarDidClickedButton:self index:sender.tag];
    }
}


//2 设置内部按钮的大小和位置
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / self.subviews.count;
    CGFloat height = self.bounds.size.height;
    CGFloat x = 0;
    CGFloat y = 0;
    for (UIButton *btn in self.subviews) {
        btn.frame = CGRectMake(x, y, width, height);
        x += width;
    }
    
}


@end










