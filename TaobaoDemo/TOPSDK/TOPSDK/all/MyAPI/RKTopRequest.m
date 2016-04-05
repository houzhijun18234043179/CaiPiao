//
//  RKTopRequest.m
//  TOPSDK
//
//  Created by Robin Kam on 11-12-26.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RKTopRequest.h"

@implementation RKTopRequest

- (NSString *)apiMethodName{
    return nil;
}

- (NSMutableDictionary *)apiParams{
    NSMutableDictionary *paramDictionary = [NSMutableDictionary dictionary];   
    unsigned int outCount, i;   
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);   
    for (i = 0; i < outCount; i++) {   
        objc_property_t property = properties[i];   
        NSString *propertyName = [[[NSString alloc] initWithCString:property_getName(property)] autorelease];   
        id propertyValue = [self valueForKey:(NSString *)propertyName];   
        if (propertyValue) [paramDictionary setObject:propertyValue forKey:propertyName];   
    }   
    free(properties);   
    return paramDictionary; 
}

- (void)check{
    
}

- (void)dealloc{
//    unsigned int outCount, i;   
//    objc_property_t *properties = class_copyPropertyList([self class], &outCount);   
//    for (i = 0; i < outCount; i++) {   
//        objc_property_t property = properties[i];   
//        NSString *propertyName = [[[NSString alloc] initWithCString:property_getName(property)] autorelease];   
//        id propertyValue = [self valueForKey:(NSString *)propertyName]; 
//        [propertyValue release];
//    }   
//    free(properties); 
    
    [super dealloc];
}

@end
