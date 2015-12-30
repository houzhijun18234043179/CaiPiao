//
//  HMHelp.h
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHelp : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *id;

+ (instancetype)helpWithDic:(NSDictionary *)dic;

+ (NSArray *)helps;
@end
