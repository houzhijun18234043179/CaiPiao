//
//  NLXMLParser.m
//  Neulion API iOS SDK.
//  Version: 1.0
//
//  Copyright 2011 Neulion Inc. All rights reserved.
//

#import "RKXMLParser.h"

@implementation RKXMLParser
@synthesize feedConfigDictionary;

static RKXMLParser *_sharedXMLParser = nil;

- (void)dealloc{
    [feedConfigDictionary release], feedConfigDictionary = nil;
	[super dealloc];
}


+ (RKXMLParser *)sharedXMLParser{
    @synchronized([self class]) {
		if(!_sharedXMLParser)
			[[self alloc] init];
		return _sharedXMLParser;
	}
    
    return nil;
}

+ (id)alloc{
    @synchronized([self class]){
        NSAssert(_sharedXMLParser == nil, @"Attempted to allocate a second instance of the settings.");
        _sharedXMLParser = [super alloc];
        return _sharedXMLParser;
    }
    return nil;
}

+ (id)allocWithZone:(NSZone *)zone{
	@synchronized ([self class]){
		if (_sharedXMLParser == nil) {
			_sharedXMLParser = [super allocWithZone:zone];
		}
		
		return _sharedXMLParser;
	}
	
	return nil;
}

- (id)retain{
	return self;
}

- (unsigned)retainCount{
	return UINT_MAX; //denotes an object that cannot be released
}

- (id)init{
    self = [super init];
	if (self != nil) {
        
	}
	
	return self;
}

- (void)readConfigFile:(NSString *)fileName{
    NSString* feedFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    feedConfigDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:feedFilePath];
}

- (NSString *)getStringByXPath:(NSString *)xPath fromXMLString:(NSString *)xmlString{
    CXMLDocument * xmlDoc = [[[CXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil] autorelease];
    NSArray *nodeArray = [xmlDoc nodesForXPath:xPath error:nil];
    NSString *text = nil;
    if (nodeArray.count>0) {
        text = [[nodeArray lastObject] stringValue];
    }
    return text;
}

- (NSString *)getStringByXPath:(NSString *)xPath fromXMLData:(NSData *)data{
    NSString *xmlString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    NSString *text = [self getStringByXPath:xPath fromXMLString:xmlString];
    return text;
}

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withString:(NSString *)string withSeperator:(NSString *)seperatorName{
    if (string == nil) {
        return  nil;
    }
    CXMLDocument * xmlDoc = [[[CXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    NSDictionary *dictionary = [feedConfigDictionary objectForKey:templateName];
    
    NSString *rootPathString = [dictionary objectForKey:XMLPARESR_ROOTPATH_KEY];
    NSDictionary *elementPathDictionary = [dictionary objectForKey:XMLPARSER_ELEMENTPATH_KEY];
    
    NSMutableArray *returnDataArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *dataArray = [[[NSMutableArray alloc] init] autorelease];
    
    if (rootPathString != nil) {
        NSArray *rootArray = [xmlDoc nodesForXPath:rootPathString error:nil];
        
        for (int i = 0; i < [rootArray count]; i ++) {
            NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] init];
            
            for (int j = 0; j < [elementPathDictionary count]; j ++) {
                NSString *keyStringAtIndexI = [[elementPathDictionary allKeys] objectAtIndex:j];
                NSString *valuesAtIndexI = [[elementPathDictionary allValues] objectAtIndex:j];
                NSArray *array = [[rootArray objectAtIndex:i] nodesForXPath:valuesAtIndexI error:nil];
                
                [returnDataArray addObject:[NSDictionary dictionaryWithObject:array forKey:keyStringAtIndexI]];
            }
            
            for (int j = 0; j < [returnDataArray count]; j ++) {
                NSDictionary *dic = [returnDataArray objectAtIndex:j];
                NSString *keyString = [[dic allKeys] objectAtIndex:0];
                NSArray *valuesArray = [[dic allValues] objectAtIndex:0];
                
                NSString *tempDataStr = nil;
                if (valuesArray != nil && [valuesArray count] != 0) {
                    tempDataStr = [[valuesArray objectAtIndex:0] stringValue];
                }
                
                for (int k = 1; [valuesArray count] > 1 && k < [valuesArray count]; k ++) {
                    tempDataStr = [tempDataStr stringByAppendingFormat:@"%@%@",seperatorName,[[valuesArray objectAtIndex:k] stringValue]];
                }
                
                if (tempDataStr == nil) {
                    tempDataStr = @"";
                }
                [dataDictionary setObject:tempDataStr forKey:keyString];          
            }
            [returnDataArray removeAllObjects];
            
            [dataArray addObject:dataDictionary];
            [dataDictionary release];
        }
        
    }else {
        dataArray = nil;
    }
    [returnDataArray release];
    
    return dataArray;
}

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withString:(NSString *)string{
    NSArray *dataArray = [self getDictionaryArrayWithName:templateName withString:string withSeperator:SEPERATOR];
    return dataArray;
}

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withData:(NSData *)data{
    NSString *xmlString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    NSArray *dataArray = [self getDictionaryArrayWithName:templateName withString:xmlString withSeperator:SEPERATOR];
    return dataArray;
}

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withData:(NSData *)data withSeperator:(NSString *)seperatorName{
    NSString *xmlString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    NSArray *dataArray = [self getDictionaryArrayWithName:templateName withString:xmlString withSeperator:seperatorName];
    return dataArray;
}

- (NSArray *)getObjectArrayWithName:(NSString *)templateName withString:(NSString *)string withSeperator:(NSString *)seperatorName{
    NSDictionary *dictionary = [feedConfigDictionary objectForKey:templateName];
    NSString *objectName = [dictionary objectForKey:XMLPARSER_OBJECTNAME_KEY];
    NSArray *dictionaryArray = [self getDictionaryArrayWithName:templateName withString:string withSeperator:seperatorName];
    NSArray *objectsArray = [self getObjectArrayFromDictionaryArray:dictionaryArray withObjectName:objectName];
    
    return objectsArray;
}

-(NSArray *)getObjectArrayWithName:(NSString *)templateName withString:(NSString *)string{
    NSDictionary *dictionary = [feedConfigDictionary objectForKey:templateName];
    NSString *objectName = [dictionary objectForKey:XMLPARSER_OBJECTNAME_KEY];
    NSArray *dictionaryArray  = [self getDictionaryArrayWithName:templateName withString:string];
    NSArray *objectsArray = [self getObjectArrayFromDictionaryArray:dictionaryArray withObjectName:objectName];
    
    return objectsArray;
}


- (NSArray *)getObjectArrayWithName:(NSString *)templateName withData:(NSData *)data{
    NSDictionary *dictionary = [feedConfigDictionary objectForKey:templateName];
    NSString *objectName = [dictionary objectForKey:XMLPARSER_OBJECTNAME_KEY];
    NSArray *objectsArray = [self getObjectArrayFromDictionaryArray:[self getDictionaryArrayWithName:templateName withData:data] withObjectName:objectName];
    
    return objectsArray;
}


- (NSArray *)getObjectArrayWithName:(NSString *)templateName withData:(NSData *)data withSeperator:(NSString *)seperatorName{
    NSDictionary *dictionary = [feedConfigDictionary objectForKey:templateName];
    NSString *objectName = [dictionary objectForKey:XMLPARSER_OBJECTNAME_KEY];
    NSArray *objectsArray = [self getObjectArrayFromDictionaryArray:[self getDictionaryArrayWithName:templateName withData:data withSeperator:seperatorName] withObjectName:objectName];
    
    return objectsArray;
}


- (NSArray *)getObjectArrayFromDictionaryArray:(NSArray *)dictionaryArray withObjectName:(NSString *)objName{
    NSMutableArray *objectsArray = [NSMutableArray array];
    if ([NSClassFromString(objName) class]) {
        
        for (NSDictionary *dictionary in dictionaryArray) {
            id object = [[NSClassFromString(objName) alloc] init];
            for(NSString * key in [dictionary allKeys]){
                @try {
                    [object setValue:[dictionary valueForKey:key] forKey:key];
                }
                @catch (NSException *exception) {
                   // DebugLog(@"Execption: %@", [exception reason]);
                }
                @finally {
                    
                }
                                
            }
            
            [objectsArray addObject:object];
            [object release];

        }
    }
        
    return objectsArray;
}

@end
