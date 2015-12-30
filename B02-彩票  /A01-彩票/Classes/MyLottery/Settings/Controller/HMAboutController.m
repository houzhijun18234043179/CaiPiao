//
//  HMAboutController.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMAboutController.h"
#import "HMAboutHeader.h"
@interface HMAboutController ()

@end

@implementation HMAboutController
- (void)dealloc {
    NSLog(@"dealloc");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [HMAboutHeader aboutHeader];
    
}

- (void)addGroups {
    HMSettingItem *item11 = [HMSettingItemArrow itemWithTitle:@"评分支持"];
    HMSettingItem *item12 = [HMSettingItemArrow itemWithTitle:@"客服电话" subTitle:@"010-110120"];
    
    HMSettingGroup *group = [HMSettingGroup groupWithItems:@[item11,item12]];
    
    self.groups = @[group];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1
    HMSettingCell *cell = [HMSettingCell cellWithTableView:tableView  style:UITableViewCellStyleValue1];
    
    //2
    HMSettingGroup *group = self.groups[indexPath.section];
    HMSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    //3
    return cell;
}


@end
