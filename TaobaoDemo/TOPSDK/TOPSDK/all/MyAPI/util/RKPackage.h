//
//  NLPackage.h
//  Neulion API iOS SDK.
//  Version: 1.0
//
//  Copyright 2011 Neulion Inc. All rights reserved.
//

#define PACKAGE_ASYNCHRONOUSREQUEST @"ASYNCHRONOUS"
#define PACKAGE_SYNCHRONOUSREQUEST @"SYNCHRONOUS"
#define PACKAGE_GETREQUEST  @"GET"
#define PACKAGE_POSTREQUEST @"POST"


#import <Foundation/Foundation.h>


@interface RKPackage : NSObject {
 @private
    NSString        *url;
    NSString        *signalTagStr;
    NSString        *moduleName;
    NSMutableData   *dataBuffer;
    NSDictionary    *paramDictionary;
    NSDictionary    *userInfo;

    NSString        *requestTypeString;
    NSString        *requestModeString;
    BOOL            useCookiePersistence;
    BOOL            useSessionPersistence;
    BOOL            validatesSecureCertificate;
    NSTimeInterval timeOutSeconds;
    
    NSString        *requestHeader;
    NSString        *requestHeaderValue;
    NSData          *postData;
    
    NSError         *responseError;
}

@property (nonatomic, copy)     NSString            *url;
@property (nonatomic, copy)     NSString            *signalTagStr;
@property (nonatomic, copy)     NSString            *moduleName;
@property (nonatomic, retain)   NSMutableData       *dataBuffer;
@property (nonatomic, retain)   NSDictionary        *paramDictionary;
@property (nonatomic, retain)   NSDictionary        *userInfo;
@property (nonatomic, copy)     NSString            *requestTypeString;         //ASYNCHRONOUS/SYNCHRONOUS
@property (nonatomic, copy)     NSString            *requestModeString;         //GET/POST
@property (nonatomic, readwrite)BOOL                useCookiePersistence;           
@property (nonatomic, readwrite)BOOL                useSessionPersistence;
@property (nonatomic, readwrite)BOOL                validatesSecureCertificate;
@property (nonatomic, readwrite)NSTimeInterval      timeOutSeconds;

@property (nonatomic, copy)     NSString            *requestHeader;
@property (nonatomic, copy)     NSString            *requestHeaderValue;
@property (nonatomic, retain)   NSData              *postData;
@property (nonatomic, retain)   NSError             *responseError;


// Convenience constructor
+ (RKPackage *)package;

@end
