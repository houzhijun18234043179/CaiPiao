//
//  HMSettingItemLabel.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingItemLabel.h"

@implementation HMSettingItemLabel
+ (instancetype)itemWithTitle:(NSString *)title time:(NSString *)time {
    HMSettingItemLabel *item = [self itemWithTitle:title ];
    item.time = time;
    return item;
}

@end
