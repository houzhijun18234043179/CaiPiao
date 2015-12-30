//
//  HMSettingCell.h
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMSettingItem;
@interface HMSettingCell : UITableViewCell
@property (nonatomic, strong) HMSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style ;
@end
