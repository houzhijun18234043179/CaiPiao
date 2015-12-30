//
//  HMPush3Controller.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMPush3Controller.h"

@interface HMPush3Controller ()

@end

@implementation HMPush3Controller

- (void)addGroups {
    HMSettingItemSwitch *item = [HMSettingItemSwitch itemWithTitle:@"中奖动画"];
    
    HMSettingGroup *group = [HMSettingGroup groupWithItems:@[item] footer:@"我是footer"];
    
    self.groups = @[group];
}

@end
