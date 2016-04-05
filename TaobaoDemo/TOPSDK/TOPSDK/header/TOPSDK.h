//
//  TOPSDK.h
//  TOPSDK
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SDK_VERSION @"top-sdk-ios-2011-12-20";

#define FORMAT_JSON @"json";
#define FORMAT_XML @"xml";

#define MURL @"http://api.m.taobao.com/rest/api2.do"; // TOP认证过程使用的URL
#define APIURL @"http://gw.api.taobao.com/router/rest"; // API调用的过程中使用的URL
#define APP_KEY @"12344741";
#define SECRET @"93d5bcb5dcf77dcc1c3ff26a5d3fc4ff";
#define TTID @"400000_12344741@mykhd_android_1.0.0";

#define IMEI @"890141032111185";
#define IMSI @"310260000000000";

#define v @"*";

// 获取登陆成功后的URL和KEY
#define LOGINURL @""; // 可以跳转到授权页面的登陆URL
#define LOGINKEY @"";

@interface TOPSDK : NSObject{
    NSString *mURL;
    NSString *apiURL;
    NSString *appKey;
    NSString *secret;
    NSString *ttID;
    NSString *imei;
    NSString *imsi;
    // 获取登陆成功后的URL和KEY
    NSString *loginURL;
    NSString *loginKey;
    // 获取用户会话信息
    NSString *topSession;
    NSString *sid;
    NSString *ecode;
    NSString *token;
    NSString *nick;
    // 自动登陆返回的信息
    NSString *userid;
}

+(TOPSDK *)sharedTOPSDK;
@property (nonatomic, copy) NSString *mURL;
@property (nonatomic, copy) NSString *apiURL;
@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *ttID;
@property (nonatomic, copy) NSString *imei;
@property (nonatomic, copy) NSString *imsi;
@property (nonatomic, copy) NSString *loginURL;
@property (nonatomic, copy) NSString *loginKey;
@property (nonatomic, copy) NSString *topSession;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *ecode;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *userid;

@end
