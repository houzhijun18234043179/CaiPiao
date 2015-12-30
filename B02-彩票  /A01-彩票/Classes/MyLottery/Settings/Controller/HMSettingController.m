//
//  HMSettingController.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingController.h"

//使用兑换码
#import "HMRedeemCodeController.h"
#import "HMMorePushController.h"
#import "HMHelpController.h"
#import "HMAboutController.h"
#import "HMProductController.h"
#import "HMSharedController.h"
@interface HMSettingController ()
@end

@implementation HMSettingController

- (void)addGroups {
    //第一组
    HMSettingItem *item11 = [HMSettingItemArrow itemWithTitle:@"使用兑换码" icon:@"RedeemCode" destController:[HMRedeemCodeController class]];
    HMSettingGroup *group1 = [HMSettingGroup groupWithItems:@[item11]];
    
    //第二组
    HMSettingItem *item21 = [HMSettingItemArrow itemWithTitle:@"推送和提醒" icon:@"MorePush" destController:[HMMorePushController class]];
    HMSettingItem *item22 = [HMSettingItemSwitch itemWithTitle:@"摇一摇机选" icon:@"handShake"];
    HMSettingItem *item23 = [HMSettingItemSwitch itemWithTitle:@"声音效果" icon:@"sound_Effect"];
    HMSettingItem *item24 = [HMSettingItemSwitch itemWithTitle:@"购彩小助手" icon:@"More_LotteryRecommend"];
    HMSettingItem *item25 = [HMSettingItemSwitch itemWithTitle:@"圈子仅Wifi加载图片" icon:@"More_QuanZi_NetFlowSwitchImage"];
    HMSettingGroup *group2 = [HMSettingGroup groupWithItems:@[item21,item22,item23,item24,item25]];
    
    
    //第三组
    HMSettingItem *item31 = [HMSettingItemArrow itemWithTitle:@"检查新版本" icon:@"MoreUpdate" option:^{
        NSLog(@"检查新版本");
    }];
    HMSettingItem *item32 = [HMSettingItemArrow itemWithTitle:@"推荐给朋友" icon:@"MoreShare" destController:[HMSharedController class]];
    HMSettingItem *item33 = [HMSettingItemArrow itemWithTitle:@"产品推荐" icon:@"MoreNetease" destController:[HMProductController class]];
    HMSettingItem *item34 = [HMSettingItemArrow itemWithTitle:@"关于" icon:@"MoreAbout" destController:[HMAboutController class]];
    HMSettingGroup *group3 = [HMSettingGroup groupWithItems:@[item31,item32,item33,item34]];
    self.groups = @[group1,group2,group3];

}





- (void)viewDidLoad {
    [super viewDidLoad];

    //
    self.title = @"设置";
    
    //常见问题
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    self.navigationItem.rightBarButtonItem = item;
    
 }


//点击常见问题
- (void)btnClick {
    HMHelpController *vc = [HMHelpController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
