//
//  HMSettingGroup.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSettingGroup.h"

@implementation HMSettingGroup
+ (instancetype)groupWithItems:(NSArray *)items {
    HMSettingGroup *group = [self new];
    
    group.items = items;
    
    return group;
}


+ (instancetype)groupWithItems:(NSArray *)items header:(NSString *)header {
    HMSettingGroup *group = [self groupWithItems:items];
    group.header = header;
    return group;
}
+ (instancetype)groupWithItems:(NSArray *)items footer:(NSString *)footer {
    HMSettingGroup *group = [self groupWithItems:items];
    group.footer = footer;
    return group;
}
+ (instancetype)groupWithItems:(NSArray *)items header:(NSString *)header footer:(NSString *)footer {
    HMSettingGroup *group = [self  groupWithItems:items header:header];
    group.footer = footer;
    return group;

}

@end
