//
//  NLXMLParser.h
//  Neulion API iOS SDK.
//  Version: 1.0
//
//  Copyright 2011 Neulion Inc. All rights reserved.
//

#define XMLPARESR_ROOTPATH_KEY      @"rootPath"
#define XMLPARSER_ELEMENTPATH_KEY   @"elementPath"
#define XMLPARSER_OBJECTNAME_KEY    @"objectName"
#define SEPERATOR @"</>"

#import <Foundation/Foundation.h>
#import "TouchXML.h"
#import "JSON.h"

@interface RKXMLParser : NSObject {
 @private
    NSMutableDictionary *feedConfigDictionary;
}

@property (nonatomic, retain, readonly) NSMutableDictionary *feedConfigDictionary;

+ (RKXMLParser *)sharedXMLParser;
- (void)readConfigFile:(NSString *)fileName;

- (NSString *)getStringByXPath:(NSString *)xPath fromXMLString:(NSString *)xmlString;

- (NSString *)getStringByXPath:(NSString *)xPath fromXMLData:(NSData *)data;

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withString:(NSString *)string withSeperator:(NSString *)seperatorName;

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withString:(NSString *)string;

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withData:(NSData *)data withSeperator:(NSString *)seperatorName;

- (NSArray *)getDictionaryArrayWithName:(NSString *)templateName withData:(NSData *)data;

- (NSArray *)getObjectArrayWithName:(NSString *)templateName withString:(NSString *)string withSeperator:(NSString *)seperatorName;

- (NSArray *)getObjectArrayWithName:(NSString *)templateName withString:(NSString *)string;

- (NSArray *)getObjectArrayWithName:(NSString *)templateName withData:(NSData *)data withSeperator:(NSString *)seperatorName;

- (NSArray *)getObjectArrayWithName:(NSString *)templateName withData:(NSData *)data;


- (NSArray *)getObjectArrayFromDictionaryArray:(NSArray *)dictionaryArray withObjectName:(NSString *)objName;

@end
