//
//  TkItemModel.m
//  TOPSDK
//
//  Created by Robin Kam on 12-9-7.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "TkItemModel.h"

@implementation TkItemModel

@synthesize num_iid;  // 	Number 	否 	123 	淘宝客商品数字id
@synthesize nick;  // 	String 	否 	jayzhou 	卖家昵称
@synthesize title;  // 	String 	否 	1212 	商品title 宝贝名称
@synthesize price;  // 	Price 	否 	12.15 	商品价格
@synthesize item_location;  // 	String 	否 	北京 	商品所在地
@synthesize seller_credit_score;  // 	Number 	否 	12 	卖家信用等级
@synthesize click_url;  // 	String 	否 	http://s.click.taobao.com/.....&p=mm_15999136_0_0&n=19&u=12001469 	推广点击url
@synthesize shop_click_url;  // 	String 	否 	http://s.click.taobao.com/.....&p=mm_15999136_0_0&n=19&u=12001469 	商品所在店铺的推广点击url
@synthesize pic_url;  // 	String 	否 	http://img01.taobaocdn.com/bao/uploaded/i1/T1GM8KXkheXXXz9q_b_093149.jpg 	图片url
@synthesize commission_rate;  // 	String 	否 	500.00 	淘宝客佣金比率，比如：1234.00代表12.34%
@synthesize commission;  // 	Price 	否 	12.15 	淘宝客佣金
@synthesize commission_num;  // 	String 	否 	123 	累计成交量.注：返回的数据是30天内累计推广量
@synthesize commission_volume;  // 	Price 	否 	12.15 	累计总支出佣金量
@synthesize volume;  // 	Number 	否 	100 	30天内交易量

- (void)dealloc{
    [num_iid release];
    [nick release];
    [title release];
    [price release];
    [item_location release];
    [seller_credit_score release];
    [click_url release];
    [shop_click_url release];
    [pic_url release];
    [commission_rate release];
    [commission release];
    [commission_num release];
    [commission_volume release];
    [volume release];
    
    [super dealloc];
}

@end
