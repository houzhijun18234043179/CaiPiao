//
//  TaobaoAppTests.m
//  TaobaoAppTests
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "TaobaoAppTests.h"
#import "RegexKitLite.h"
#import "TableCellSettings.h"
#import "RKUserGetRequest.h"
#import "RKItemsSearchRequest.h"
#import "RKItemsSearchResponse.h"
#import "ItemModel.h"
#import "CategoryModel.h"

@implementation TaobaoAppTests
@synthesize topClient;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    topClient = [RKTopClient sharedTopClient];
    [[RKXMLParser sharedXMLParser] readConfigFile:@"feedConfig"];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testXMLParser{
    DebugLog(@"%@", [RKXMLParser sharedXMLParser].feedConfigDictionary);
    STAssertNotNil([RKXMLParser sharedXMLParser].feedConfigDictionary , @"Failed reading config file.");
}

- (void)testApiUserGet
{
    RKUserGetRequest *request = [[RKUserGetRequest alloc] initWithFields:@"user_id,nick,seller_credit" andNick:@"roibnkam008"];
    DebugLog(@"%@", [request rkPropertyDictionary]);
    RKTopResponse *response =[topClient executeWithRequest:request andSessionKey:nil];
    STAssertNil(response.errorCode,  @"\nFailed invoking API: %@ with error code: %@", [request apiMethodName], response.msg);
}

- (void)testApiItemsSearch
{
    RKItemsSearchRequest *request = [[RKItemsSearchRequest alloc] initWithFields:@"num_iid,title,pic_url,price,volumn,location,volumepromoted_service" andQueryKeyword:@"iphone"];
    DebugLog(@"%@", [request rkPropertyDictionary]);
    RKItemsSearchResponse *response = (RKItemsSearchResponse *)[topClient executeWithRequest:request andSessionKey:nil];
    STAssertTrue(response.items.count>0, @"XMLParser没有解析出items数组");
    STAssertTrue(response.categories.count>0, @"XMLParser没有解析出categories数组");
    STAssertNotNil(response.totalResults, @"XMLParser没有解析出total_results");
    DebugLog(@"total_results: %@", response.totalResults);
    for (ItemModel *item in response.items) {
        DebugLog(@"%@", [item rkPropertyDictionary]);
    }
    for (CategoryModel *category in response.categories) {
        DebugLog(@"%@", [category rkPropertyDictionary]);
    }
    STAssertNil(response.errorCode, @"\n调用API失败\nAPI: %@ \n错误代码: %@", [request apiMethodName], response.msg);
}

- (void)testApiGetLoginUrl{
    NSString *loginUrl = [topClient getLoginUrl];
    DebugLog(@"Login URL: %@", loginUrl);
    STAssertNotNil(loginUrl, @"Login URL: %@", loginUrl);
}

- (void)testToken{
    NSString *queryString = @"token=87d86e87-3ae4-42f2-a92f-40db85277681";
    NSString *token = [queryString stringByMatching:@"token=(.*)" capture:1L];
    STAssertNotNil(token, @"token = %@", token);
}

@end
