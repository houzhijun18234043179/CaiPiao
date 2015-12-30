//
//  HMBaseSettingController.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMBaseSettingController.h"

@interface HMBaseSettingController ()
@end

@implementation HMBaseSettingController
//懒加载,加载数据
- (NSArray *)groups {
    if (_groups == nil) {
        [self addGroups];
    }
    return _groups;
}

- (void)addGroups {
    
}

//设置tableView分组显示
- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tableView的背景图片
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    
    //设置tableView分组显示  style属性是只读的
    //    self.tableView.style = UITableViewStyleGrouped;
    
    //设置距离
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
    self.tableView.sectionHeaderHeight = 15;
    self.tableView.sectionFooterHeight = 0;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    HMSettingGroup *group = self.groups[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1
    HMSettingCell *cell = [HMSettingCell cellWithTableView:tableView];
    
    //2
    HMSettingGroup *group = self.groups[indexPath.section];
    HMSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    //3
    return cell;
}
//返回组头  自动把字母转化成大写
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HMSettingGroup *group = self.groups[section];
    return group.header;
}
//返回组尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    HMSettingGroup *group = self.groups[section];
    return group.footer;
}


//tableView的代理方法. 选中cell的时候执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取出模型
    HMSettingGroup *group = self.groups[indexPath.section];
    HMSettingItem *item = group.items[indexPath.row];
    
    if (item.option) {
        item.option();
    }else if(item.destController){
        //创建目标控制器
        UIViewController *vc = [item.destController new];
        vc.title = item.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
