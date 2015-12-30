//
//  HMTabBar.h
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMTabBar;

//1 定义代理协议
@protocol HMTabBarDelegate <NSObject>

@required
- (void)tabBarDidClickedButton:(HMTabBar *)tabBar index:(NSInteger)index;

@end

@interface HMTabBar : UIView
//2 定义代理属性
@property (nonatomic, weak) id<HMTabBarDelegate> delegate;
//3 在合适的时机通知代理(调用代理方法)

+ (instancetype)tabBarWithSBNames:(NSArray *)sbNames;
@end
