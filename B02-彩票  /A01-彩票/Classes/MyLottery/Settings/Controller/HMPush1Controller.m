//
//  HMPush1Controller.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMPush1Controller.h"

@implementation HMPush1Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, 0, 30)];

}

//开奖推送
- (void)addGroups {
    //一组
    HMSettingItem *item11 = [HMSettingItemSwitch itemWithTitle:@"开奖推送" subTitle:@"每周二、四、日开奖"];
    HMSettingItem *item12 = [HMSettingItemSwitch itemWithTitle:@"比分直播推送"  subTitle:@"每周一、三、六开奖"];
    HMSettingItem *item13 = [HMSettingItemSwitch itemWithTitle:@"中奖动画"  subTitle:@"每周开奖 包括试机号提醒"];
    HMSettingItem *item14 = [HMSettingItemSwitch itemWithTitle:@"购彩提醒"  subTitle:@"每周一、三、五开奖"];
    HMSettingItem *item15 = [HMSettingItemSwitch itemWithTitle:@"圈子推送"  subTitle:@"每周二、五、日开奖"];
    HMSettingItem *item16 = [HMSettingItemSwitch itemWithTitle:@"排列三"  subTitle:@"每天开奖"];
    HMSettingItem *item17 = [HMSettingItemSwitch itemWithTitle:@"排列五"  subTitle:@"每天开奖"];
    
    
    HMSettingGroup *group1 = [HMSettingGroup groupWithItems:@[item11,item12,item13,item14,item15,item16,item17]];
    self.groups = @[group1];
}
@end
