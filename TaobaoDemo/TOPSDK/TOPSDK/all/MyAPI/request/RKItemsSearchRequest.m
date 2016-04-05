//
//  RKItemsSearch.m
//  TOPSDK
//
//  Created by Robin Kam on 11-12-26.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RKItemsSearchRequest.h"

@implementation RKItemsSearchRequest

@synthesize fields;	//Field List	必须	num_iid,title,nick,pic_url,cid,price,type,delist_time,post_fee		 需返回的商品结构字段列表。可选值为Item中的以下字段：num_iid,title,nick,pic_url,cid,price,type,delist_time,post_fee；多个字段之间用“,” 分隔。如：iid,title。新增字段location（卖家地址，可以分别获取location.city,location.state）；score(卖家信用等级数),volume(最近成交量) 新增字段：has_discount, num, is_prepay, promoted_service, ww_status, list_time
@synthesize q;	//String	特殊可选	title		 搜索字段。 用来搜索商品的title以及对应产品的title。
@synthesize cid;	//Number	特殊可选	34341		 商品所属类目Id。ItemCat中的cid。 可以通过taobao.itemcats.get取到
@synthesize nicks;	//String	特殊可选	nick1,nick2,nick3		 卖家昵称列表。多个之间用“,”分隔；最多支持5个卖家昵称。如:nick1,nick2,nick3。
@synthesize props;	//String	特殊可选	pid1:vid1;pid2:vid2		 商品属性。商品属性。可以搜到拥有和输入属性一样的商品列表。字段格式为：pid1:vid1;pid2:vid2.属性的pid调用 taobao.itemprops.get.v2取得，属性值的vid用taobao.itempropvalues.get取得vid。
@synthesize product_id;	//Number	特殊可选	345342		 可以根据产品Id搜索属于这个spu的商品。这个字段可以通过查询 taobao.products.get 取到
@synthesize order_by;	//String	可选	popularity:desc	popularity:desc	 排序方式。格式为column:asc/desc,column可选值为: price, delist_time, seller_credit；如按价格升序排列表示为：price:asc。新增排序字段：volume（最近成交量）；新增排序字段：popularity(商品的人气值)
@synthesize ww_status;	//Boolean	可选	true		 旺旺在线状态（不设置结果包含所有状态，设置为true结果只有旺旺在线卖家的商品）不能单独使用，要和其他条件一起用才行。
@synthesize post_free;	//Boolean	可选	true		 免运费（不设置包含所有邮费状态，设置为true结果只有卖家包邮的商品）不能单独使用，要和其他条件一起用才行。
@synthesize location_state;	//String	可选	浙江		 所在省。如：浙江
@synthesize location_city;	//String	可选	杭州		 所在市。如：杭州
@synthesize is_3D;	//Boolean 可选	true		 是否是3D淘宝的商品,置为false或为空表示不对是否3D商品进行判断
@synthesize start_score;	//Number	可选	1		 商品所属卖家的最小信用等级数，1表示1心，2表示2心……，设置此条件表示搜索结果里的商品，所属的卖家信用必须大于等于设置的 start_score。
@synthesize end_score;    //Number	可选	2		 商品所属卖家的最大信用等级数，1表示1心，2表示2心……，设置此条件表示搜索结果里的商品，所属的卖家信用必须小于等于设置的end_score
@synthesize start_volume;	//Number	可选	100		 商品30天内最小销售数，设置此条件表示搜索结果里的商品，最近成交量必须大于等于设置的start_volume。
@synthesize end_volume;	//Number	可选	200		 商品30天内最大销售数，设置此条件表示搜索结果里的商品，最近成交量必须小于等于设置的end_volume
@synthesize one_station;	//Boolean	可选	true		 是否淘1站代购商品，设置为true表示淘1站商品，设置为false或不设置表示不判断这个属性
@synthesize is_cod;	//Boolean	可选	true		 是否支持货到付款，设置为true表示支持货到付款，设置为false或不设置表示不判断这个属性
@synthesize is_mall;	//Boolean	可选	true		 表示是否搜索商城的商品这一搜索条件。 值含义：true：搜索商城商品，false：搜素集市商品，若为null，则搜索全部的商品（默认值）
@synthesize is_prepay;	//Boolean	可选	true		 是否如实描述(即:先行赔付)商品，设置为true表示该商品是如实描述的商品，设置为false或不设置表示不判断这个属性
@synthesize genuine_security;	//Boolean	可选	true		 是否正品保障商品(既是如实描述，又是7天无理由退换货的商品，设置了这个属性时：is_prepay和promoted_service不能再行设置)，设置为true表示该商品是正品保障的商品，设置为false或不设置表示不判断这个属性
@synthesize promoted_service;	//String	可选	2		 是否提供保障服务的商品。可选入参有：2、4。设置为2表示该商品是“假一赔三”的商品，设置为4表示该商品是“7天无理由退换货”的商品
@synthesize stuff_status;	//String	可选	new		 商品的新旧状态。可选入参有：new、second、unused 。设置为new表示该商品是全新的商品，设置为second表示该商品是二手的商品，设置为unused表示该商品是闲置的商品
@synthesize start_price;	//Number	可选	10		 商品最低价格。单位:元。正整数，取值范围:0-100000000。
@synthesize end_price;	//Number	可选	120		 商品最高价格。单位:元。正整数，取值范围:0-100000000
@synthesize page_no;	//Number	可选	1	1	 页码。取值范围:大于零的整数。默认值为1,即默认返回第一页数据。用此接口获取数据时，当翻页获取的条数（page_no*page_size）超过10240,为了保护后台搜索引擎，接口将报错。所以请大家尽可能的细化自己的搜索条件，例如根据修改时间分段获取商品
@synthesize page_size;	//Number	可选	40	40	 每页条数。取值范围:大于零的整数;最大值：200；默认值：40
@synthesize auction_flag;	//Boolean	可选	true		 商品是否为虚拟商品 true：是虚拟商品 false：不是虚拟商品
@synthesize auto_post;	//Boolean	可选	true		 商品是否为自动发货 true：自动发货 false：非自动发货
@synthesize has_discount;	//Boolean	可选	true		 商品是否对会员打折
@synthesize is_xinpin;	//Boolean	可选	true		 表示是否新品这一搜索条件。 值含义：true-是新品，false-无限制，不输入(null)-无限制

- (void)dealloc{
    [fields release];
    [q release];
    [cid release];
    [nicks release];
    [props release];
    [product_id release];
    [order_by release];
    [ww_status release];
    [post_free release];
    [location_state release];
    [location_city release];
    [is_3D release];
    [start_score release];
    [end_score release];
    [start_volume release];
    [end_volume release];
    [one_station release];
    [is_cod release];
    [is_mall release];
    [is_prepay release];
    [genuine_security release];
    [promoted_service release];
    [stuff_status release];
    [start_price release];
    [end_price release];
    [page_no release];
    [page_size release];
    [auction_flag release];
    [auto_post release];
    [has_discount release];
    [is_xinpin release];
    
    [super dealloc];
}


- (NSString *)apiMethodName{
    return @"taobao.items.search";//@"taobao.taobaoke.items.get";//@"taobao.items.search";
}

- (void)check{
//    [RequestCheckUtils checkMinValueWithValue:cid andFieldName:@"cid" andMinValue:0];
}

- (Class)getResponseClass{
    return NSClassFromString(@"RKItemsSearchResponse");
}

- (id)initWithFields:(NSString *)theFields andQueryKeyword:(NSString *)queryKeyword{
    return [self initWithFields:theFields andQueryKeyword:queryKeyword orderBy:@"popularity:desc"];
}

- (id)initWithFields:(NSString *)theFields andQueryKeyword:(NSString *)queryKeyword orderBy:(NSString *)orderOption{
    if (self = [super init]) {
        self.fields = theFields;
        self.q = queryKeyword;
        self.page_size = @"10";
        self.order_by = orderOption;
    }
    return self;
}

@end
