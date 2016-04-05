//
//  RequestCheckUtils.h
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ERROR_CODE_ARGUMENTS_MISS @"40"
#define ERROR_CODE_ARGUMENTS_INVALID @"41"

@interface RequestCheckUtils : NSObject

+ (void)checkNotEmptyWithValue:(NSObject *)value andFieldName:(NSString *)fieldName;

+ (void)checkNumericWithValue:(NSObject *)value andFieldName:(NSString *)fieldName;

+ (void)checkMinValueWithValue:(NSObject *)value andFieldName:(NSString *)fieldName andMinValue:(NSNumber *)minValue;

@end
