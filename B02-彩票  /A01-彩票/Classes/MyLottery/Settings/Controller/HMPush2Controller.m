//
//  HMPush2Controller.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMPush2Controller.h"
#import "HMSettingItemLabel.h"
#import "HMKeyboardToolBar.h"
@interface HMPush2Controller () <HMKeyboardToolBarDelegate>
@property (nonatomic, strong) UIDatePicker *datePicker ;

@property (nonatomic, strong) NSIndexPath *indexPath;
@end

@implementation HMPush2Controller
- (void)addGroups {
    HMSettingItemSwitch *item = [HMSettingItemSwitch itemWithTitle:@"推送我关注的比赛"];
    HMSettingGroup *group1 = [HMSettingGroup groupWithItems:@[item] footer:@"我是footer"];
    
    HMSettingItem *item21 = [HMSettingItemLabel itemWithTitle:@"起始时间" time:@"00:00"];
    HMSettingItem *item22 = [HMSettingItemLabel itemWithTitle:@"结束时间" time:@"00:00"];
    HMSettingGroup *group2 = [HMSettingGroup groupWithItems:@[item21,item22] header:@"我是aaheader"];
    
    self.groups = @[group1,group2];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //0 获取数据  判断 是否是arrow
    HMSettingGroup *group = self.groups[indexPath.section];
    HMSettingItem *item = group.items[indexPath.row];
    
    if (![item isKindOfClass:[HMSettingItemLabel class]]) {
        [self.view endEditing:YES];
    }
    
    
    self.indexPath = indexPath;
    
    //1 获取当前选中的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //2 添加文本框
    UITextField *txt = [UITextField new];
    [cell addSubview:txt];
    //3 设置键盘
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    self.datePicker = datePicker;
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.backgroundColor = [UIColor lightGrayColor];
    //
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //
    HMKeyboardToolBar *toolBar = [HMKeyboardToolBar toolBar];
    toolBar.delegate = self;
    txt.inputAccessoryView = toolBar;
    //
    txt.inputView = datePicker;
    
    //4 成为第一响应者
    [txt becomeFirstResponder];
}

//HMKeyboardToolBar代理方法
- (void)keyboardToolBarDidClickedSure:(HMKeyboardToolBar *)toolBar {
    //1 获取时间
    NSDate *date = self.datePicker.date;
    //2 把时间转化成字符串  00:00
    NSDateFormatter *ndf = [NSDateFormatter new];
    ndf.dateFormat = @"HH:mm";
    NSString *time = [ndf stringFromDate:date];
    
    //3 取得对应的模型数据
    HMSettingGroup *group = self.groups[self.indexPath.section];
    HMSettingItem *item = group.items[self.indexPath.row];
    //4 更新模型数据,刷新tablView
    item.time = time;
    [self.tableView reloadRowsAtIndexPaths:@[self.indexPath] withRowAnimation:0];
}

- (void)keyboardToolBarDidClickedCancel:(HMKeyboardToolBar *)toolBar {
    [self.view endEditing:YES];
}


@end
