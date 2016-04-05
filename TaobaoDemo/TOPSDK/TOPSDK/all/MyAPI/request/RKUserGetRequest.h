//
//  RKUserGetRequest.h
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKTopRequestProtocol.h"

@interface RKUserGetRequest : RKTopRequest

/** 
 * 需返回的字段列表。可选值：User结构体中的所有字段；以半角逗号(,)分隔。不支持：地址，真实姓名，身份证，手机，电话
 */
@property (nonatomic, retain) NSString *fields;

/** 
 * 用户昵称，如果昵称为中文，请使用UTF-8字符集对昵称进行URL编码。
 <br><font color="red">注：在传入session的情况下,可以不传nick，表示取当前用户信息；否则nick必须传.<br>
 自用型应用不需要传入nick
 </font>
 */
@property (nonatomic, retain) NSString *nick;

- (id)initWithFields:(NSString *)theFields andNick:(NSString *)theNick;

@end
