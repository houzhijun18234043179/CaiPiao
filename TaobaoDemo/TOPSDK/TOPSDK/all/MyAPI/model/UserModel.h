//
//  UserModel.h
//  TOPSDK
//
//  Created by Robin Kam on 12-1-4.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, retain) NSString *user_id;//	 Number	 否	10001	用户数字ID
@property (nonatomic, retain) NSString *uid;//	 String	 否	10001	用户字符串ID
@property (nonatomic, retain) NSString *nick;//	 String	 否	hz0799	用户昵称
@property (nonatomic, retain) NSString *sex;//	 String	 否	m	性别。可选值:m(男),f(女)
@property (nonatomic, retain) NSString *buyer_credit_score;//	UserCredit	 否		买家信用
@property (nonatomic, retain) NSString *seller_credit_score;//	UserCredit	 否		卖家信用
@property (nonatomic, retain) NSString *buyer_credit_level;//	UserCredit	 否		买家信用
@property (nonatomic, retain) NSString *seller_credit_level;//	UserCredit	 否		卖家信用
@property (nonatomic, retain) NSString *location;//	Location	 否		用户当前居住地公开信息。如：location.city获取其中的city数据
@property (nonatomic, retain) NSString *created;//	 Date	 否	2000-01-01 00:00:00	用户注册时间。格式:yyyy-MM-dd HH:mm:ss
@property (nonatomic, retain) NSString *last_visit;//	 Date	 否	2000-01-01 00:00:00	最近登陆时间。格式:yyyy-MM-dd HH:mm:ss
@property (nonatomic, retain) NSString *birthday;//	 Date	 是	2000-01-01 00:00:00	生日
@property (nonatomic, retain) NSString *type;//	 String	 否	B	用户类型。可选值:B(B商家),C(C商家)
@property (nonatomic, retain) NSString *has_more_pic;//	 Boolean	 是	true	是否购买多图服务。可选值:true(是),false(否)
@property (nonatomic, retain) NSString *item_img_num;//	 Number	 是	5	可上传商品图片数量
@property (nonatomic, retain) NSString *item_img_size;//	 Number	 是	1024	单张商品图片最大容量(商品主图大小)。单位:k
@property (nonatomic, retain) NSString *prop_img_num;//	 Number	 是	5	可上传属性图片数量
@property (nonatomic, retain) NSString *prop_img_size;//	 Number	 是	1024	单张销售属性图片最大容量（非主图的商品图片和商品属性图片）。单位:k
@property (nonatomic, retain) NSString *auto_repost;//	 String	 是	unlimited	是否受限制。可选值:limited(受限制),unlimited(不受限)
@property (nonatomic, retain) NSString *promoted_type;//	 String	 是	authentication	有无实名认证。可选值:authentication(实名认证),not authentication(没有认证)
@property (nonatomic, retain) NSString *status;//	 String	 是	normal	状态。可选值:normal(正常),inactive(未激活),delete(删除),reeze(冻结),supervise(监管)
@property (nonatomic, retain) NSString *alipay_bind;//	 String	 是	bind	有无绑定。可选值:bind(绑定),notbind(未绑定)
@property (nonatomic, retain) NSString *consumer_protection;//	 Boolean	 是	true	是否参加消保
@property (nonatomic, retain) NSString *alipay_account;//	 String	 是	hz0799@163.com	支付宝账户
@property (nonatomic, retain) NSString *alipay_no;//	 String	 是	10001	支付宝ID
@property (nonatomic, retain) NSString *avatar;//	 String	 是	http://assets.taobaocdn.com/app/sns/img/default/avatar-120.png	用户头像地址
@property (nonatomic, retain) NSString *liangpin;//	 Boolean	 是	true	是否是无名良品用户，true or false
@property (nonatomic, retain) NSString *sign_food_seller_promise;//	 Boolean	 是	true	卖家是否签署食品卖家承诺协议
@property (nonatomic, retain) NSString *has_shop;//	 Boolean	 否	true	用户作为卖家是否开过店
@property (nonatomic, retain) NSString *is_lightning_consignment;//	 Boolean	 否	true	是否24小时闪电发货(实物类)
@property (nonatomic, retain) NSString *has_sub_stock;//	 Boolean	 是	true	表示用户是否具备修改商品减库存逻辑的权限（一共有拍下减库存和付款减库存两种逻辑） 值含义： 1）true：是 2）false：否。
@property (nonatomic, retain) NSString *vip_info;//	 String	 否	v1	用户的全站vip信息，可取值如下：c(普通会员),asso_vip(荣誉会员)，vip1,vip2,vip3,vip4,vip5,vip6(六个等级的正式vip会员)，共8种取值，其中asso_vip是由vip会员衰退而成，与主站上的vip0对应。
@property (nonatomic, retain) NSString *email;//	 String	 是	xiaoming@taobao.com	联系人email
@property (nonatomic, retain) NSString *magazine_subscribe;//	 Boolean	 是	true	是否订阅了淘宝天下杂志
@property (nonatomic, retain) NSString *vertical_market;//	 String	 是	3C,shoes	用户参与垂直市场类型。shoes表示鞋城垂直市场用户，3C表示3C垂直市场用户。多个类型之间用","分隔。如：一个用户既是3C用户又是鞋城用户，那么这个字段返回就是"3C,shoes"。如果用户不是垂直市场用户，此字段返回为""。
@property (nonatomic, retain) NSString *online_gaming;//	 Boolean	 是	true	用户是否为网游用户，属于隐私信息，需要登陆才能查看自己的。 目前仅供taobao.user.get使用

@end
