//
//  HMSettingItem.h
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^HMSettingItemOption)();
@interface HMSettingItem : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subTitle;

//
@property (nonatomic, copy) NSString *time;


//目标控制器
@property (nonatomic, strong) Class destController;
//
@property (nonatomic, copy) HMSettingItemOption option;

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
