//
//  RKTkItemsGetRequest.h
//  TOPSDK
//
//  Created by Robin Kam on 12-9-7.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "RKTopRequest.h"

@interface RKTkItemsGetRequest : RKTopRequest

- (id)initWithFields:(NSString *)theFields andQueryKeyword:(NSString *)queryKeyword;
- (id)initWithFields:(NSString *)theFields andQueryKeyword:(NSString *)queryKeyword orderBy:(NSString *)orderOption;

@property (nonatomic, copy) NSString *fields;  // 	Field List 	必须 	num_iid 		需返回的字段列表.可选值:num_iid,title,nick,pic_url,price,click_url,commission,commission_rate,commission_num,commission_volume,shop_click_url,seller_credit_score,item_location,volume ;字段之间用","分隔
@property (nonatomic, copy) NSString *nick;  // 	String 	特殊可选 	jay 		淘宝用户昵称，注：指的是淘宝的会员登录名.如果昵称错误,那么客户就收不到佣金.每个淘宝昵称都对应于一个pid，在这里输入要结算佣金的淘宝昵称，当推广的商品成功后，佣金会打入此输入的淘宝昵称的账户。具体的信息可以登入阿里妈妈的网站查看. 注意nick和pid至少需要传递一个,如果2个都传了,将以pid为准
@property (nonatomic, copy) NSString *pid;  // 	Number 	特殊可选 	123456 		用户的pid,必须是mm_xxxx_0_0这种格式中间的"xxxx". 注意nick和pid至少需要传递一个,如果2个都传了,将以pid为准,且pid的最大长度是20
@property (nonatomic, copy) NSString *keyword;  // 	String 	特殊可选 	abc 		商品标题中包含的关键字. 注意:查询时keyword,cid至少选择其中一个参数
@property (nonatomic, copy) NSString *cid;  // 	Number 	特殊可选 	123 		标准商品后台类目id。该ID可以通过taobao.itemcats.get接口获取到。
@property (nonatomic, copy) NSString *start_price;  // 	String 	可选 	1 		起始价格.传入价格参数时,需注意起始价格和最高价格必须一起传入,并且 start_price <= end_price
@property (nonatomic, copy) NSString *end_price;  // 	String 	可选 	999 		最高价格
@property (nonatomic, copy) NSString *auto_send;  // 	String 	可选 	true 		是否自动发货
@property (nonatomic, copy) NSString *area;  // 	String 	可选 	杭州 		商品所在地
@property (nonatomic, copy) NSString *start_credit;  // 	String 	可选 	1heart 		卖家信用: 1heart(一心) 2heart (两心) 3heart(三心) 4heart(四心) 5heart(五心) 1diamond(一钻) 2diamond(两钻) 3diamond(三钻) 4diamond(四钻) 5diamond(五钻) 1crown(一冠) 2crown(两冠) 3crown(三冠) 4crown(四冠) 5crown(五冠) 1goldencrown(一黄冠) 2goldencrown(二黄冠) 3goldencrown(三黄冠) 4goldencrown(四黄冠) 5goldencrown(五黄冠)
@property (nonatomic, copy) NSString *end_credit;  // 	String 	可选 	1heart 		可选值和start_credit一样.start_credit的值一定要小于或等于end_credit的值。注：end_credit与start_credit一起使用才生效
@property (nonatomic, copy) NSString *sort;  // 	String 	可选 	price_desc 		默认排序:default price_desc(价格从高到低) price_asc(价格从低到高) credit_desc(信用等级从高到低) commissionRate_desc(佣金比率从高到低) commissionRate_asc(佣金比率从低到高) commissionNum_desc(成交量成高到低) commissionNum_asc(成交量从低到高) commissionVolume_desc(总支出佣金从高到低) commissionVolume_asc(总支出佣金从低到高) delistTime_desc(商品下架时间从高到低) delistTime_asc(商品下架时间从低到高)
@property (nonatomic, copy) NSString *guarantee;  // 	String 	可选 	true 		是否查询消保卖家
@property (nonatomic, copy) NSString *start_commissionRate;  // 	String 	可选 	1234 		佣金比率下限，如：1234表示12.34%
@property (nonatomic, copy) NSString *end_commissionRate;  // 	String 	可选 	2345 		佣金比率上限，如：2345表示23.45%。注：start_commissionRate和end_commissionRate一起设置才有效。
@property (nonatomic, copy) NSString *start_commissionNum;  // 	String 	可选 	1000 		30天累计推广量（与返回数据中的commission_num字段对应）下限.注：该字段要与end_commissionNum一起使用才生效
@property (nonatomic, copy) NSString *end_commissionNum;  // 	String 	可选 	10000 		30天累计推广量（与返回数据中的commission_num字段对应）上限.
@property (nonatomic, copy) NSString *start_totalnum;  // 	String 	可选 	1 		商品总成交量（与返回字段volume对应）下限。
@property (nonatomic, copy) NSString *end_totalnum;  // 	String 	可选 	10 		商品总成交量（与返回字段volume对应）上限。
@property (nonatomic, copy) NSString *cash_coupon;  // 	String 	可选 	true 		是否支持抵价券，设置为true表示该商品支持抵价券，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *vip_card;  // 	String 	可选 	true 		是否支持VIP卡，设置为true表示该商品支持VIP卡，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *overseas_item;  // 	String 	可选 	true 	false 	是否海外商品，设置为true表示该商品是属于海外商品，默认为false
@property (nonatomic, copy) NSString *sevendays_return;  // 	String 	可选 	true 		是否支持7天退换，设置为true表示该商品支持7天退换，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *real_describe;  // 	String 	可选 	true 		是否如实描述(即:先行赔付)商品，设置为true表示该商品是如实描述的商品，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *onemonth_repair;  // 	String 	可选 	true 		是否30天维修，设置为true表示该商品是支持30天维修，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *cash_ondelivery;  // 	String 	可选 	true 		是否支持货到付款，设置为true表示该商品是支持货到付款，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *mall_item;  // 	String 	可选 	true 		是否商城的商品，设置为true表示该商品是属于淘宝商城的商品，设置为false或不设置表示不判断这个属性
@property (nonatomic, copy) NSString *page_no;  // 	Number 	可选 	1 		结果页数.1~10
@property (nonatomic, copy) NSString *page_size;  // 	Number 	可选 	40 	40 	每页返回结果数.最大每页40
@property (nonatomic, copy) NSString *outer_code;  // 	String 	可选 	abc 		自定义输入串.格式:英文和数字组成;长度不能大于12个字符,区分不同的推广渠道,如:bbs,表示bbs为推广渠道;blog,表示blog为推广渠道.
@property (nonatomic, copy) NSString *is_mobile;  // 	Boolean 	可选 	true 	false 	标识一个应用是否来在无线或者手机应用,如果是true则会使用其他规则加密点击串.如果不穿值,则默认是false. 

@end
