//
//  HMSettingItem.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingItem.h"

@implementation HMSettingItem
+ (instancetype)itemWithTitle:(NSString *)title {
    HMSettingItem *item = [self new];
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon {
    HMSettingItem *item = [self itemWithTitle:title];
   
    item.icon = icon;
    
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    HMSettingItem *item = [self itemWithTitle:title];
    item.subTitle = subTitle;
    return item;
}
@end
