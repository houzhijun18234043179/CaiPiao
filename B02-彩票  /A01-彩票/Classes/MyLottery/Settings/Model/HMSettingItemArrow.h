//
//  HMSettingItemArrow.h
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingItem.h"

@interface HMSettingItemArrow : HMSettingItem
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destController:(Class)destController;
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon option:(HMSettingItemOption)option;

+ (instancetype)itemWithTitle:(NSString *)title destController:(Class)destController;

@end
