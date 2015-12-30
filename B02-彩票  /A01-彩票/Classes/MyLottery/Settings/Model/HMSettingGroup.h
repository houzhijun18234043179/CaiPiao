//
//  HMSettingGroup.h
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMSettingGroup : NSObject
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;

+ (instancetype)groupWithItems:(NSArray *)items;

+ (instancetype)groupWithItems:(NSArray *)items header:(NSString *)header;
+ (instancetype)groupWithItems:(NSArray *)items footer:(NSString *)footer;
+ (instancetype)groupWithItems:(NSArray *)items header:(NSString *)header footer:(NSString *)footer;


@end
