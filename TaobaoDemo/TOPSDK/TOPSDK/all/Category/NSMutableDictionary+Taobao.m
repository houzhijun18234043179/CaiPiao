//
//  NSMutableDictionaryTaobao.m
//  audioBook
//
//  Created by YangZigang on 11-1-19.
//  Copyright 2011 audiocn.com. All rights reserved.
//

#import "NSMutableDictionary+Taobao.h"
#import "NSString+MD5.h"

// MARK: -
// MARK: 请填写实际的app_key和 app_secret_key
static NSString* const app_key = @"12434108";
static NSString* const app_secret_key = @"53ebbd7f4afef035b754a25689c389f4";


@implementation NSMutableDictionary (Taobao)

- (NSString*)urlString
{
	[self setObject:app_key forKey:@"app_key"];
	NSArray *array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	NSMutableString *url = [NSMutableString stringWithCapacity:1024];
	NSMutableString *str = [NSMutableString stringWithCapacity:1024];
	[str appendString:app_secret_key];
	NSUInteger i, count = [array count];
	for (i = 0; i < count; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString * obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
		[str appendFormat:@"%@%@",obj, [self objectForKey:obj]];
	}
	NSString *hash = [str md5];
	[self setObject:hash forKey:@"sign"];
	array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	[url setString:@""];
	for (i = 0; i < [array count]; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString *obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
	}
	//[url appendFormat:@"&sign=%@", hash];
	return url;
}

- (NSString*)urlString2
{
	[self setObject:app_key forKey:@"app_key"];
	NSArray *array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	NSMutableString *url = [NSMutableString stringWithCapacity:1024];
	NSMutableString *str = [NSMutableString stringWithCapacity:1024];
	[str appendString:app_secret_key];
	NSUInteger i, count = [array count];
	for (i = 0; i < count; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString * obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
		[str appendFormat:@"%@%@",obj, [self objectForKey:obj]];
	}
	[str appendString:app_secret_key];
	NSString *hash = [ str md5];
	[self setObject:hash forKey:@"sign"];
	array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	[url setString:@""];
	for (i = 0; i < [array count]; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString *obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
	}
	return url;
}


- (void)testDefault
{
	// http://gw.api.tbsandbox.com/router/rest?app_key=test&codeType=JAVA&fields=num_iid,title,nick,pic_url,cid,price,type,delist_time,post_fee,score,volume&format=json&method=taobao.items.search&page_no=1&page_size=40&q=羽绒服&sign=65FA41EC8A3568BD99FABA2CA7C55C00&timestamp=2011-01-19 16:19:01&v=2.0
	
	[self setObject:app_key forKey:@"app_key"];
	[self setObject:@"JAVA" forKey:@"codeType"];
	[self setObject:@"num_iid,title,nick,pic_url,cid,price,type,delist_time,post_fee,score,volume,product_id" forKey:@"fields"];
	[self setObject:@"json" forKey:@"format"];
	[self setObject:@"taobao.items.search" forKey:@"method"];
	[self setObject:@"2.0" forKey:@"v"];
	[self setObject:@"popularity:asc" forKey:@"popularity"];
	NSDate *date = [NSDate date];
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"YYYY-MM-dd HH:mm:SS"];
	[self setObject:[df stringFromDate:date] forKey:@"timestamp"];
	[df release];
}

@end
