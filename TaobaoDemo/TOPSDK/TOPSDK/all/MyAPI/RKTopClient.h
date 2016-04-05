//
//  RKTopClient.h
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RKTopRequestProtocol.h"
#import "RKTopResponse.h"
#import "ASIHTTPRequest.h"

#define APP_KEY @"app_key"
#define FORMAT @"format"
#define METHOD @"method"
#define TIMESTAMP @"timestamp"
#define VERSION @"v"
#define SIGN @"sign"
#define SIGN_METHOD @"sign_method"
#define PARTNER_ID @"partner_id"
#define SESSION @"session"

@interface RKTopClient : NSObject

@property (nonatomic, copy) NSString *gatewayUrl;
@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, copy) NSString *sdkVersion;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *signMethod;

@property (nonatomic, copy) NSString *imei;
@property (nonatomic, copy) NSString *imsi;
@property (nonatomic, copy) NSString *ttid;

@property (nonatomic, copy) NSString *sessionKey;
@property (nonatomic, copy) NSString *topsession;
@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *ecode;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *token;

@property (nonatomic, assign) int connectTimeout;
@property (nonatomic, assign) int readTimeout;

@property (nonatomic, assign) BOOL needCheckRequest;

+ (RKTopClient *)sharedTopClient;

-(id)initWithServerURL:(NSString *)url andAppKey:(NSString *)key andAppSecret:(NSString *)secret;

/**
 *	@brief	调用淘宝开放平台API
 *
 *	@param 	request 	请求包
 *	@param 	sessionKey 	如果要查询高级API获取用户信息，需要提供Session Key
 *
 *	@return	Response对象，内部封装了返回的数据结果或者出错信息
 */
-(RKTopResponse *)executeWithRequest:(id<RKTopRequestProtocol>)request andSessionKey:(id)sessionKey;


-(NSString *)getLoginUrl;

-(NSString *)getUserSessionKey;

-(NSString *)autoLogin;

-(BOOL)logout;

@end
