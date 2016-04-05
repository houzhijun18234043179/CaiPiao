//
//  RKTopRequestProtocol.h
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RKTopRequestProtocol <NSObject>

@required
/**
 * 获取TOP的API名称。
 * 
 * @return API名称
 */
-(NSString *)apiMethodName;

/**
 * 获取所有的Key-Value形式的文本请求参数集合。其中：
 * <ul>
 * <li>Key: 请求参数名</li>
 * <li>Value: 请求参数值</li>
 * </ul>
 * 
 * @return 文本请求参数集合
 */
-(NSMutableDictionary *)apiParams;

-(void)check;

@optional
/**
 * @return 指定或默认的时间戳
 */
-(long)timestamp;

/**
 * 设置时间戳，如果不设置,发送请求时将使用当时的时间。
 * 
 * @param timestamp 时间戳
 */
-(void)setTimestamp:(long)timestamp;

-(Class)getResponseClass;

@end
