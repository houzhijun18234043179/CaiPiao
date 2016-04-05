//
//  RKTopClient.m
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RKTopClient.h"

@interface RKTopClient(private)
- (NSString *)timeStampInSeconds;
- (NSString *)topToken;
- (NSString *)getDataStringWithDictionary:(NSDictionary *)paramDictionary;
- (NSString *)getAuthAPIRequestURLWithAPIName:(NSString *)apiName andDataString:(NSString *)dataString;
- (NSString *)generateSignWithParams:(NSMutableDictionary *)params;
- (NSString *)generateUnAuthorizedSignWithDataString:(NSString *)data forAPI:(NSString *)api;
- (NSString *)generateAuthorizedSignWithDataString:(NSString *)data andECode:(NSString *)ecode forAPI:(NSString *)api;
- (NSString *)doHttpRequestWithUrl:(NSString *)url andPostFields:(NSMutableDictionary *)postFields;
- (NSString *)doHttpRequestWithCompleteUrl:(NSString *)completeUrl;
@end

@implementation RKTopClient
@synthesize gatewayUrl;
@synthesize appKey;
@synthesize appSecret;
@synthesize appVersion;
@synthesize sdkVersion;
@synthesize format;
@synthesize signMethod;

@synthesize imei;
@synthesize imsi;
@synthesize ttid;

@synthesize sessionKey;
@synthesize topsession;
@synthesize sid;
@synthesize ecode;
@synthesize nick;
@synthesize token;

@synthesize connectTimeout;
@synthesize readTimeout;
@synthesize needCheckRequest;

static RKTopClient *_sharedInstance;

+ (RKTopClient *)sharedTopClient{
    @synchronized([self class]) {
		if(!_sharedInstance)
			[[self alloc] init];
		return _sharedInstance;
	}
    return nil;
}

+ (id)alloc{
    @synchronized ([self class]){
		if (_sharedInstance == nil) {
			_sharedInstance = [super alloc];
		}	
		return _sharedInstance;
	}
	return nil;
}

+ (id)allocWithZone:(NSZone *)zone{
	@synchronized ([self class]){
		if (_sharedInstance == nil) {
			_sharedInstance = [super allocWithZone:zone];
		}	
		return _sharedInstance;
	}
	return nil;
}

- (id)retain{
	return self;
}

- (unsigned)retainCount{
	return UINT_MAX; //denotes an object that cannot be released
}


- (void)dealloc{
    [gatewayUrl release];
    [appKey release];
    [appSecret release];
    [appVersion release];
    [sdkVersion release];
    [format release];
    [signMethod release];
    
    [imei release];
    [imsi release];
    [ttid release];
    
    [sessionKey release];
    [topsession release];
    [sid release];
    [ecode release];
    [nick release];
    [token release];
    
    [super dealloc];
}

#pragma mark - Private Methods
- (NSString *)timeStampInSeconds{
    NSString *t = [NSString stringWithFormat:@"%d", [[NSDate date] timeIntervalSince1970]];
    return t;
}

- (NSString *)topToken{
    NSString *md5AppSecret = [appSecret md5];
    NSString *tempString = [NSString stringWithFormat:@"%@%@%@%@", appKey, md5AppSecret, nick, [self timeStampInSeconds]];
    return [tempString md5];
}

- (NSString *)getDataStringWithDictionary:(NSDictionary *)paramDictionary{
    return [paramDictionary JSONRepresentation];
}

- (NSString *)getAuthAPIRequestURLWithAPIName:(NSString *)apiName andDataString:(NSString *)dataString{
    NSString *sign = [self generateUnAuthorizedSignWithDataString:dataString forAPI:apiName];
    NSString *requestUrl = [NSString stringWithFormat: @"http://api.m.taobao.com/rest/api2.do?api=%@&V=*&imei=%@&imsi=%@&appkey=%@&data=%@&t=%@&sign=%@&ttid=%@", apiName, self.imei, self.imsi, self.appKey, dataString, [self timeStampInSeconds], sign, self.ttid];
    // 必须先将URL中的大括号和双引号进行编码才能正常调用
    requestUrl = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return requestUrl;
}

- (NSString *)generateSignWithParams:(NSMutableDictionary *)params{
    NSArray *array = [params allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	NSMutableString *stringToBeSigned = [NSMutableString stringWithCapacity:1024];
	[stringToBeSigned appendString:self.appSecret];
	NSUInteger i, count = [array count];
	for (i = 0; i < count; i++) {
		NSString *key = [array objectAtIndex:i];
        NSString *value = [params objectForKey:key];
		[stringToBeSigned appendFormat:@"%@%@",key, value];
	}
//    [stringToBeSigned appendString:self.appSecret];
	NSString *hash = [stringToBeSigned md5];
	return hash;
}

- (NSString *)generateUnAuthorizedSignWithDataString:(NSString *)data forAPI:(NSString *)api{
    NSString *sign = nil;
    NSString *v = @"*";
    sign = [NSString stringWithFormat:@"%@%@%@%@%@%@%@", self.appSecret, api, v, self.imei, self.imsi, [data md5], [self timeStampInSeconds]];
    sign = [sign md5];
    return sign;
}

- (NSString *)generateAuthorizedSignWithDataString:(NSString *)data andECode:(NSString *)eCode forAPI:(NSString *)api{
    NSString *sign = nil;
    NSString *v = @"*";
    sign = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", eCode, self.appSecret, api, v, self.imei, self.imsi, [data md5], [self timeStampInSeconds]];
    sign = [sign md5];
    return sign;
}

- (NSString *)doHttpRequestWithUrl:(NSString *)url andPostFields:(NSMutableDictionary *)postFields{
    NSMutableString *postBodyString = [NSMutableString stringWithCapacity:1024];
    NSArray *keys = [postFields allKeys];
    for (NSString *key in keys) {
        NSString *value = [postFields objectForKey:key];
        [postBodyString appendFormat:@"&%@=%@", key, value];
    }
    NSString *requestUrl = [url stringByAppendingString:postBodyString];
    requestUrl = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self doHttpRequestWithCompleteUrl:requestUrl];
}

- (NSString *)doHttpRequestWithCompleteUrl:(NSString *)completeUrl{
    NSString *response = nil;
    DebugLog(@"Start API request: \n%@", completeUrl);
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:completeUrl]];
    request.timeOutSeconds = self.connectTimeout;
    [request startSynchronous];
    NSError *error = [request error]; 
    if (!error) { 
        response = [request responseString]; 
        //    NSData *responseData = [request responseData];
        //    NSString *response = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
    } else {
        DebugLog(@"Request Failed: %@", [error localizedDescription]);
    }
    return response;
}

#pragma mark - Public Methods
- (id)init{
    if (self = [super init]) {
        self.gatewayUrl = @"http://gw.api.taobao.com/router/rest";//正式测试环境网关
        
        //self.appKey = ;//请从淘宝开发者账号中获取
        //self.appSecret = ;//请从淘宝开发者账号中获取
        self.format = @"xml";
//        self.signMethod = @"md5";
        self.appVersion = @"2.0";
        self.sdkVersion = @"top-sdk-java";
        
        NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
        self.imei = [udid substringToIndex:15];
        self.imsi = [udid substringFromIndex:(udid.length-15)];
        
        NSString *channelCode = @"400000";
        NSString *appName = @"zsqjd";
        NSString *platformNmae = @"iphone";
        NSString *specialParam = @"7090";   //特殊参数：7090为店铺应用
        self.ttid = [NSString stringWithFormat:@"%@_%@@%@_%@_%@_%@", channelCode, self.appKey, appName, platformNmae, appVersion, specialParam];//400000_12432929@zsqjd_iPhone_1.0
        
        self.connectTimeout = 0;
        self.readTimeout = 0;
        
        self.needCheckRequest = YES;
    }
    return self;
}

- (id)initWithServerURL:(NSString *)url andAppKey:(NSString *)key andAppSecret:(NSString *)secret{
    if ([self init]) {
        self.gatewayUrl = url;
        self.appKey = key;
        self.appSecret = secret;
    }
    return self;
}

/**
 *	@brief	TOPClient发送请求，调用API
 *
 *	@param 	request 	请求对象
 *	@param 	theSessionKey 	Session Key，当要调用用户相关的API时，需要
 *
 *	@return	RKTopResponse对象
 */
-(RKTopResponse *)executeWithRequest:(id<RKTopRequestProtocol>)request andSessionKey:(id)theSessionKey
{
    Class clazz = [request getResponseClass];
    if (![clazz isSubclassOfClass:[NSObject class]]) {
        clazz = [RKTopResponse class];
    }
    RKTopResponse *response = [[[clazz alloc] init] autorelease];
    
    if (needCheckRequest) {
        @try {
            [request check];
        }
        @catch (NSException *exception) {
            response.errorCode = exception.name;
            response.msg = exception.reason;
            return response;
        }
    }
    //组装系统参数
    NSMutableDictionary *sysParams = [NSMutableDictionary dictionary];
    [sysParams setObject:self.appKey forKey:APP_KEY];
    [sysParams setObject:self.appVersion forKey:VERSION];
    [sysParams setObject:self.format forKey:FORMAT];
//    [sysParams setObject:self.signMethod forKey:SIGN_METHOD];
    [sysParams setObject:[request apiMethodName] forKey:METHOD];
    [sysParams setObject:self.sdkVersion forKey:PARTNER_ID];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"YYYY-MM-dd HH:mm:SS"];
    NSString *timestamp = [df stringFromDate:date];
    [df release];
    [sysParams setObject:timestamp forKey:TIMESTAMP];
    
    if (theSessionKey) {
        [sysParams setObject:theSessionKey forKey:SESSION];
    }
    
    //获取业务参数
    NSMutableDictionary *apiParams = [request apiParams];
    
    //签名
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:sysParams];
    [params addEntriesFromDictionary:apiParams];
    NSString *sign = [self generateSignWithParams:params];
    [sysParams setObject:sign forKey:SIGN];
    
    //系统参数放入GET请求串
    NSMutableString *requestUrl = [NSMutableString stringWithCapacity:1024];
//    [requestUrl setString:@""];
    [requestUrl setString: [requestUrl stringByAppendingFormat:@"%@?", self.gatewayUrl]];
	NSArray *array = [sysParams allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	for (int i = 0; i < [array count]; i++) {
		if ([requestUrl length]) {
			[requestUrl appendString:@"&"];
		}
		NSString *key = [array objectAtIndex:i];
		[requestUrl appendFormat:@"%@=%@", key, [sysParams objectForKey:key]];
	}
    
    //发起HTTP请求
    @try {
        response.body = [self doHttpRequestWithUrl:requestUrl andPostFields:apiParams];
        response.params = params;
    }
    @catch (NSException *exception) {
        response.errorCode = exception.name;
        response.msg = exception.reason;
        return response;
    }
    
    //解析TOP返回结果
    BOOL respWellFormed = NO;
    BOOL respError = NO;
    if ([self.format isEqualToString:@"json"]) {
        NSDictionary *responseObject = [response.body JSONValue];
        if (responseObject) {
            respWellFormed = YES;
        }
        NSDictionary *errorInfo = [responseObject valueForKey:@"error_response"];
        if (errorInfo) {
            respError = YES;
            response.errorCode = [errorInfo objectForKey:@"code"];
            response.msg = [errorInfo objectForKey:@"msg"];
            response.subCode = [errorInfo objectForKey:@"sub_code"];
            response.subMsg = [errorInfo objectForKey:@"sub_msg"];
        }
    }
    
    if ([self.format isEqualToString:@"xml"]) {
        CXMLDocument *responseObject = [[[CXMLDocument alloc] initWithXMLString:response.body options:0 error:nil] autorelease];
        if (responseObject) {
            respWellFormed = YES;
        }
        CXMLElement *errorInfo = [[responseObject nodesForXPath:@"error_response" error:nil] lastObject];
        if (errorInfo) {
            respError = YES;
            response.errorCode = [[[errorInfo nodesForXPath:@"code" error:nil] lastObject] stringValue];
            response.msg = [[[errorInfo nodesForXPath:@"msg" error:nil] lastObject] stringValue];
        }
    }
    
    //返回的HTTP文本不是标准JSON或者XML，记下错误日志
    if (respWellFormed==NO) {
        DebugLog(@"\nError: %@ \n%@ \nHTTP_ERROR_%@ \n%@", [request apiMethodName], requestUrl, response.errorCode, response.msg);
        response.errorCode = @"0";
        response.msg = @"HTTP_RESPONSE_NOT_WELL_FORMED";
        return response;
    }
    
    //返回的是错误信息，则记下错误日志
    if (respError) {
        DebugLog(@"\n调用API返回错误: %@", response.msg);
        return response;
    }
    
    DebugLog(@"\n有效的API反馈结果: %@", response.body);
    return response;
}

-(NSString *)getLoginUrl{
    //新的OAuth 2.0认证页面，Client-side flow
    return [NSString stringWithFormat:@"https://oauth.taobao.com/authorize?response_type=token&client_id=%@&redirect_uri=appcallback://&scope=item&state=1212&view=wap", appKey];
    //老的OAuth 1.3认证流程
    NSString *loginUrl = nil;
    NSString *dataString = [NSString stringWithFormat:@"{\"appkey\":\"%@\",\"callbackUrl\":\"appcallback://\"}", self.appKey];
    NSString *apiName = @"com.taobao.wireless.mtop.getLoginUrl";
    NSString *sign = [self generateUnAuthorizedSignWithDataString:dataString forAPI:apiName];
    NSString *requestUrl = [NSString stringWithFormat: @"http://api.m.taobao.com/rest/api2.do?api=%@&V=*&imei=%@&imsi=%@&appkey=%@&data=%@&t=%@&sign=%@&ttid=%@", apiName, self.imei, self.imsi, self.appKey, dataString, [self timeStampInSeconds], sign, self.ttid];
    // 必须先将URL中的大括号和双引号进行编码才能正常调用
    requestUrl = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DebugLog(@"UTF8转义编码后的URL: \n%@", requestUrl);
    NSString *response = [self doHttpRequestWithCompleteUrl:requestUrl];
    
    //解析结果
    NSDictionary *responseDictionary = [response JSONValue];
    DebugLog(@"getLoginUrl result: %@", responseDictionary);
    NSDictionary *dataDictionary = [responseDictionary objectForKey:@"data"];
    NSString *result = [[responseDictionary valueForKey:@"ret"] JSONRepresentation];
    if ([result rangeOfString:@"成功"].length>0) {
        self.sessionKey = [dataDictionary valueForKey:@"key"];
        loginUrl = [dataDictionary valueForKey:@"url"];
        NSURL *url = [NSURL URLWithString:loginUrl];
        NSString *queryString = [url query];
        self.token = [queryString stringByMatching:@"token=(.*)$" capture:1L];
        DebugLog(@"获得token：%@", self.token);
    } else {
        DebugLog(@"获取登录URL失败：%@", result);
    }
    return loginUrl;
}

-(NSString *)getUserSessionKey{
    NSString *userSessionKey = nil;
    NSString *dataString = [NSString stringWithFormat:@"{\"key\":\"%@\",\"appkey\":\"%@\"}", self.sessionKey, self.appKey];
    NSString *apiName = @"com.taobao.client.mtop.getUserSessionKey";
    NSString *sign = [self generateUnAuthorizedSignWithDataString:dataString forAPI:apiName];
    NSString *requestUrl = [NSString stringWithFormat: @"http://api.m.taobao.com/rest/api2.do?api=%@&V=*&imei=%@&imsi=%@&appkey=%@&data=%@&t=%@&sign=%@&ttid=%@", apiName, self.imei, self.imsi, self.appKey, dataString, [self timeStampInSeconds], sign, self.ttid];
    // 必须先将URL中的大括号和双引号进行编码才能正常调用
    requestUrl = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DebugLog(@"UTF8转义编码后的URL: \n%@", requestUrl);
    NSString *response = [self doHttpRequestWithCompleteUrl:requestUrl];
    
    //解析结果
    NSDictionary *responseDictionary = [response JSONValue];
    DebugLog(@"getUserSessionKey result: %@", responseDictionary);
    NSDictionary *dataDictionary = [responseDictionary objectForKey:@"data"];
    NSString *result = [[responseDictionary valueForKey:@"ret"] JSONRepresentation];
    if ([result rangeOfString:@"成功"].length>0) {
        self.topsession = [dataDictionary valueForKey:@"topsession"];
        self.sid = [dataDictionary valueForKey:@"sid"];
        self.ecode = [dataDictionary valueForKey:@"ecode"];
        self.nick = [dataDictionary valueForKey:@"nick"];
        self.token = [dataDictionary valueForKey:@"token"];
        userSessionKey = [NSString stringWithString: self.sid];
    } else {
        DebugLog(@"获取UserSessionKey失败：%@", result);
        [self logout];
    }
    return userSessionKey;
}

-(NSString *)autoLogin{
    NSString *topSession = nil;
    NSString *topToken = [self topToken];
    NSMutableDictionary *paramDictionary = [NSMutableDictionary dictionary];
    [paramDictionary setValue:token forKey:@"token"];
    [paramDictionary setValue:appKey forKey:@"appKey"];
    [paramDictionary setValue:topToken forKey:@"topToken"];
    NSString *dataString = [self getDataStringWithDictionary:paramDictionary];
    NSString *apiName = @"com.taobao.client.sys.autologin";
    NSString *requestUrl = [self getAuthAPIRequestURLWithAPIName:apiName andDataString:dataString];
    NSString *response = [self doHttpRequestWithCompleteUrl:requestUrl];
    
    //解析结果
    NSDictionary *responseDictionary = [response JSONValue];
    DebugLog(@"autoLogin result: %@", responseDictionary);
    NSDictionary *dataDictionary = [responseDictionary objectForKey:@"data"];
    NSString *result = [[responseDictionary valueForKey:@"ret"] JSONRepresentation];
    if ([result rangeOfString:@"成功"].length>0) {
        self.sid = [dataDictionary valueForKey:@"sid"];
        self.ecode = [dataDictionary valueForKey:@"ecode"];
        self.nick = [dataDictionary valueForKey:@"nick"];
        self.topsession = [dataDictionary valueForKey:@"topsession"];
        topSession = [NSString stringWithFormat:@"登录成功！获得SessionKey：%@", self.topsession];
    } else {
        DebugLog(@"自动登录失败：%@", result);
        [self logout];
    }
    return topSession;
}

- (BOOL)logout{
    self.topsession = nil;
    self.sid = nil;
    self.ecode = nil;
    self.nick = nil;
    self.token = nil;
    
    return YES;
}
@end
