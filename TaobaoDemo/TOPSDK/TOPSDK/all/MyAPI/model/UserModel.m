//
//  UserModel.m
//  TOPSDK
//
//  Created by Robin Kam on 12-1-4.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize user_id;//	 Number	 否	10001	用户数字ID
@synthesize uid;//	 String	 否	10001	用户字符串ID
@synthesize nick;//	 String	 否	hz0799	用户昵称
@synthesize sex;//	 String	 否	m	性别。可选值:m(男),f(女)
@synthesize buyer_credit_score;//	UserCredit	 否		买家信用
@synthesize seller_credit_score;//	UserCredit	 否		卖家信用
@synthesize buyer_credit_level;//	UserCredit	 否		买家信用
@synthesize seller_credit_level;//	UserCredit	 否		卖家信用
@synthesize location;//	Location	 否		用户当前居住地公开信息。如：location.city获取其中的city数据
@synthesize created;//	 Date	 否	2000-01-01 00:00:00	用户注册时间。格式:yyyy-MM-dd HH:mm:ss
@synthesize last_visit;//	 Date	 否	2000-01-01 00:00:00	最近登陆时间。格式:yyyy-MM-dd HH:mm:ss
@synthesize birthday;//	 Date	 是	2000-01-01 00:00:00	生日
@synthesize type;//	 String	 否	B	用户类型。可选值:B(B商家),C(C商家)
@synthesize has_more_pic;//	 Boolean	 是	true	是否购买多图服务。可选值:true(是),false(否)
@synthesize item_img_num;//	 Number	 是	5	可上传商品图片数量
@synthesize item_img_size;//	 Number	 是	1024	单张商品图片最大容量(商品主图大小)。单位:k
@synthesize prop_img_num;//	 Number	 是	5	可上传属性图片数量
@synthesize prop_img_size;//	 Number	 是	1024	单张销售属性图片最大容量（非主图的商品图片和商品属性图片）。单位:k
@synthesize auto_repost;//	 String	 是	unlimited	是否受限制。可选值:limited(受限制),unlimited(不受限)
@synthesize promoted_type;//	 String	 是	authentication	有无实名认证。可选值:authentication(实名认证),not authentication(没有认证)
@synthesize status;//	 String	 是	normal	状态。可选值:normal(正常),inactive(未激活),delete(删除),reeze(冻结),supervise(监管)
@synthesize alipay_bind;//	 String	 是	bind	有无绑定。可选值:bind(绑定),notbind(未绑定)
@synthesize consumer_protection;//	 Boolean	 是	true	是否参加消保
@synthesize alipay_account;//	 String	 是	hz0799@163.com	支付宝账户
@synthesize alipay_no;//	 String	 是	10001	支付宝ID
@synthesize avatar;//	 String	 是	http://assets.taobaocdn.com/app/sns/img/default/avatar-120.png	用户头像地址
@synthesize liangpin;//	 Boolean	 是	true	是否是无名良品用户，true or false
@synthesize sign_food_seller_promise;//	 Boolean	 是	true	卖家是否签署食品卖家承诺协议
@synthesize has_shop;//	 Boolean	 否	true	用户作为卖家是否开过店
@synthesize is_lightning_consignment;//	 Boolean	 否	true	是否24小时闪电发货(实物类)
@synthesize has_sub_stock;//	 Boolean	 是	true	表示用户是否具备修改商品减库存逻辑的权限（一共有拍下减库存和付款减库存两种逻辑） 值含义： 1）true：是 2）false：否。
@synthesize vip_info;//	 String	 否	v1	用户的全站vip信息，可取值如下：c(普通会员),asso_vip(荣誉会员)，vip1,vip2,vip3,vip4,vip5,vip6(六个等级的正式vip会员)，共8种取值，其中asso_vip是由vip会员衰退而成，与主站上的vip0对应。
@synthesize email;//	 String	 是	xiaoming@taobao.com	联系人email
@synthesize magazine_subscribe;//	 Boolean	 是	true	是否订阅了淘宝天下杂志
@synthesize vertical_market;//	 String	 是	3C,shoes	用户参与垂直市场类型。shoes表示鞋城垂直市场用户，3C表示3C垂直市场用户。多个类型之间用","分隔。如：一个用户既是3C用户又是鞋城用户，那么这个字段返回就是"3C,shoes"。如果用户不是垂直市场用户，此字段返回为""。
@synthesize online_gaming;//	 Boolean	 是	true	用户是否为网游用户，属于隐私信息，需要登陆才能查看自己的。 目前仅供taobao.user.get使用

- (void)dealloc{
    [user_id release];
    [uid release];
    [nick release];
    [sex release];
    [buyer_credit_score release];
    [seller_credit_score release];
    [buyer_credit_level release];
    [seller_credit_level release];
    [location release];
    [created release];
    [last_visit release];
    [birthday release];
    [type release];
    [has_more_pic release];
    [item_img_num release];
    [item_img_size release];
    [prop_img_num release];
    [prop_img_size release];
    [auto_repost release];
    [promoted_type release];
    [status release];
    [alipay_bind release];
    [consumer_protection release];
    [alipay_account release];
    [alipay_no release];
    [avatar release];
    [liangpin release];
    [sign_food_seller_promise release];
    [has_shop release];
    [is_lightning_consignment release];
    [has_sub_stock release];
    [vip_info release];
    [email release];
    [magazine_subscribe release];
    [vertical_market release];
    [online_gaming release];
}

@end
