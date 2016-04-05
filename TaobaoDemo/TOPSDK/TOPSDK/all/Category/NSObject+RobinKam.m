//
//  NSObject+RobinKam.m
//  TOPSDK
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "NSObject+RobinKam.h"

@implementation NSObject (RobinKam)

- (NSDictionary *)rkPropertyDictionary{
    NSMutableDictionary *propertyDictionary = [NSMutableDictionary dictionary];   
    unsigned int outCount, i;   
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);   
    for (i = 0; i < outCount; i++) {   
        objc_property_t property = properties[i];   
        NSString *propertyName = [[[NSString alloc] initWithCString:property_getName(property)] autorelease];   
        id propertyValue = [self valueForKey:(NSString *)propertyName];   
        if (propertyValue) [propertyDictionary setObject:propertyValue forKey:propertyName];   
    }   
    free(properties);   
    return propertyDictionary;  
}

@end
