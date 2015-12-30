//
//  HMSettingItemArrow.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingItemArrow.h"

@implementation HMSettingItemArrow
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destController:(Class)destController {
    HMSettingItemArrow *item = [self itemWithTitle:title icon:icon];
    item.destController = destController;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon option:(HMSettingItemOption)option {
    HMSettingItemArrow *item = [self itemWithTitle:title icon:icon];

    item.option = option;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destController:(Class)destController {
    HMSettingItemArrow *item = [self itemWithTitle:title];
    item.destController = destController;
    return item;
}
@end
