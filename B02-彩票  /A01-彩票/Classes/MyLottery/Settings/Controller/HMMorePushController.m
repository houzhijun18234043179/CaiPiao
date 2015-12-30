//
//  HMMorePushController.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMMorePushController.h"

#import "HMPush1Controller.h"
#import "HMPush2Controller.h"
#import "HMPush3Controller.h"


@interface HMMorePushController ()
@end

@implementation HMMorePushController


- (void)addGroups {
    HMSettingItem *item11 = [HMSettingItemArrow itemWithTitle:@"开奖推送" destController:[HMPush1Controller class]];
    HMSettingItem *item12 = [HMSettingItemArrow itemWithTitle:@"比分直播推送" destController:[HMPush2Controller class]];
    HMSettingItem *item13 = [HMSettingItemArrow itemWithTitle:@"中奖动画" destController:[HMPush3Controller class]];
    
    HMSettingGroup *group = [HMSettingGroup groupWithItems:@[item11,item12,item13]];
    
    self.groups = @[group];
}

@end
