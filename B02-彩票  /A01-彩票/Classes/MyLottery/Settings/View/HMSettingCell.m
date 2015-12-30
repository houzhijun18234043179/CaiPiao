//
//  HMSettingCell.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingCell.h"
#import "HMSettingItem.h"
#import "HMSettingItemArrow.h"
#import "HMSettingItemSwitch.h"
#import "HMSettingItemLabel.h"

@interface HMSettingCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISwitch *Switch;


@end

@implementation HMSettingCell
//懒加载
- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _iconView;
}

- (UILabel *)label {
    if (_label == nil) {
        //显示时间的label
        UILabel *lbl = [UILabel new];
        lbl.textColor = [UIColor grayColor];
        lbl.font = [UIFont systemFontOfSize:13];
        _label  = lbl;
    }
    return _label;
}

- (UISwitch *)Switch {
    if (_Switch == nil) {
        _Switch = [UISwitch new];
        //注册事件
        [_Switch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _Switch;
}

//当switch的状态改变.记录状态
- (void)valueChanged:(UISwitch *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.isOn forKey:self.item.title];
}


+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style {
    static NSString *reuseId = @"item";
    HMSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:reuseId];
        //
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return cell;
}


//1 创建cell对象
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [self cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
}

//2 赋值
- (void)setItem:(HMSettingItem *)item {
    _item = item;
    
    
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    self.textLabel.text = item.title;
    //设置子标题
    self.detailTextLabel.text = item.subTitle;
    
    //           学习
    //不知道  -- 知道  -- 知道怎么样用了 -- 熟练  --  随心所欲
    
    
    
    //设置箭头
    if ([item isKindOfClass:[HMSettingItemArrow class]]) {
        self.accessoryView = self.iconView;
    }else if([item isKindOfClass:[HMSettingItemSwitch class]]){
        //开关
        //设置没有选中的样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //加载开关的状态
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        self.Switch.on = [userDefaults boolForKey:item.title];
        
        
        self.accessoryView = self.Switch;
    }else if([item isKindOfClass:[HMSettingItemLabel class]]){
        //显示时间的label
             self.label.text = item.time;
        [self.label sizeToFit];
        
        self.accessoryView = self.label;
    }else {
        self.accessoryView = nil;
    }

}
@end
