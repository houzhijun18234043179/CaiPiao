//
//  TkItemModel.h
//  TOPSDK
//
//  Created by Robin Kam on 12-9-7.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TkItemModel : NSObject

@property (nonatomic, copy) NSString *num_iid;  // 	Number 	否 	123 	淘宝客商品数字id
@property (nonatomic, copy) NSString *nick;  // 	String 	否 	jayzhou 	卖家昵称
@property (nonatomic, copy) NSString *title;  // 	String 	否 	1212 	商品title 宝贝名称
@property (nonatomic, copy) NSString *price;  // 	Price 	否 	12.15 	商品价格
@property (nonatomic, copy) NSString *item_location;  // 	String 	否 	北京 	商品所在地
@property (nonatomic, copy) NSString *seller_credit_score;  // 	Number 	否 	12 	卖家信用等级
@property (nonatomic, copy) NSString *click_url;  // 	String 	否 	http://s.click.taobao.com/.....&p=mm_15999136_0_0&n=19&u=12001469 	推广点击url
@property (nonatomic, copy) NSString *shop_click_url;  // 	String 	否 	http://s.click.taobao.com/.....&p=mm_15999136_0_0&n=19&u=12001469 	商品所在店铺的推广点击url
@property (nonatomic, copy) NSString *pic_url;  // 	String 	否 	http://img01.taobaocdn.com/bao/uploaded/i1/T1GM8KXkheXXXz9q_b_093149.jpg 	图片url
@property (nonatomic, copy) NSString *commission_rate;  // 	String 	否 	500.00 	淘宝客佣金比率，比如：1234.00代表12.34%
@property (nonatomic, copy) NSString *commission;  // 	Price 	否 	12.15 	淘宝客佣金
@property (nonatomic, copy) NSString *commission_num;  // 	String 	否 	123 	累计成交量.注：返回的数据是30天内累计推广量
@property (nonatomic, copy) NSString *commission_volume;  // 	Price 	否 	12.15 	累计总支出佣金量
@property (nonatomic, copy) NSString *volume;  // 	Number 	否 	100 	30天内交易量

@end
