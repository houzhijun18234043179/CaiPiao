//
//  TOPSDKTests.m
//  TOPSDKTests
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "TOPSDKTests.h"
#import "RKUserGetRequest.h"
#import "RKItemsSearchRequest.h"
#import "RKItemsSearchResponse.h"
#import "ItemModel.h"
#import "CategoryModel.h"

@implementation TOPSDKTests
@synthesize topClient;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    topClient = [[RKTopClient alloc] init];
    [[RKXMLParser sharedXMLParser] readConfigFile:@"feedConfig"];
}

- (void)tearDown
{
    // Tear-down code here.
    [topClient release];
    
    [super tearDown];
}

- (void)testXMLParser{
    STAssertNotNil([RKXMLParser sharedXMLParser].feedConfigDictionary , @"Failed reading config file.");
}

- (void)testApiUserGet
{
    RKUserGetRequest *request = [[RKUserGetRequest alloc] initWithFields:@"user_id,nick,seller_credit" andNick:@"robinkam008"];
    DebugLog(@"%@", [request rkPropertyDictionary]);
    RKTopResponse *response =[topClient executeWithRequest:request andSessionKey:nil];
    STAssertNil(response.errorCode,  @"\nFailed invoking API: %@ with error code: %@", [request apiMethodName], response.msg);
}

- (void)testApiItemsSearch
{
    RKItemsSearchRequest *request = [[RKItemsSearchRequest alloc] initWithFields:@"num_iid,title,pic_url,price,volumn,location,volumepromoted_service" andQueryKeyword:@"iphone"];
    DebugLog(@"%@", [request rkPropertyDictionary]);
    RKItemsSearchResponse *response = (RKItemsSearchResponse *)[topClient executeWithRequest:request andSessionKey:nil];
    for (ItemModel *item in response.items) {
        DebugLog(@"%@", [item rkPropertyDictionary]);
    }
    for (CategoryModel *category in response.categories) {
        DebugLog(@"%@", [category rkPropertyDictionary]);
    }
    STAssertNil(response.errorCode, @"\nFailed invoking API: %@ with error code: %@", [request apiMethodName], response.msg);
}

- (void)testApiGetLoginUrl{
    NSString *loginUrl = [topClient getLoginUrl];
    DebugLog(@"Login URL: %@", loginUrl);
    STAssertNotNil(loginUrl, @"Login URL: %@", loginUrl);
}

@end
