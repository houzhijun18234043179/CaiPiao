//
//  HMHelp.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHelp.h"

@implementation HMHelp
+ (instancetype)helpWithDic:(NSDictionary *)dic {
    HMHelp *help = [HMHelp new];
    [help setValuesForKeysWithDictionary:dic];
    return help;
}

//加载模型数据
+ (NSArray *)helps {
    //1 加载json文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array =  [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //2 字典转模型
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        HMHelp *help = [self helpWithDic:dic];
        [mArray addObject:help];
    }
    
    return mArray.copy;
}
@end
