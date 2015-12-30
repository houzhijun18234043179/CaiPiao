//
//  HMBaseSettingController.h
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
//
#import "HMSettingGroup.h"
#import "HMSettingItem.h"
#import "HMSettingItemArrow.h"
#import "HMSettingItemSwitch.h"
//
#import "HMSettingCell.h"
@interface HMBaseSettingController : UITableViewController
- (void)addGroups ;
@property (nonatomic, strong) NSArray *groups;

@end
