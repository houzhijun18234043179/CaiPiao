//
//  RequestCheckUtils.m
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RequestCheckUtils.h"

@implementation RequestCheckUtils

+ (void)checkNotEmptyWithValue:(NSObject *)value andFieldName:(NSString *)fieldName{
    if (value==nil) {
        [NSException raise:ERROR_CODE_ARGUMENTS_MISS format:@"client-error:Missing Required Arguments: %@", fieldName];
    }
    if ([value isKindOfClass:[NSString class]]) {
        if ([[((NSString *)value) stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
            [NSException raise:ERROR_CODE_ARGUMENTS_MISS format:@"client-error:Missing Required Arguments: %@", fieldName];
        }
    }
}

+ (void)checkNumericWithValue:(NSObject *)value andFieldName:(NSString *)fieldName{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber *num = [f numberFromString:(NSString *)value];
    if (num==nil) {
        [NSException raise:ERROR_CODE_ARGUMENTS_INVALID format:@"client-check-error:Invalid Arguments:the value of %@ is not number: %@." , fieldName, value];
    }
}

+ (void)checkMinValueWithValue:(NSObject *)value andFieldName:(NSString *)fieldName andMinValue:(NSNumber *)minValue{
    [self checkNotEmptyWithValue:value andFieldName:fieldName];
    [self checkNumericWithValue:value andFieldName:fieldName];
    if (value < minValue) {
        [NSException raise:ERROR_CODE_ARGUMENTS_INVALID format:@"client-check-error:Invalid Arguments:the value of %@ can not be less than %@." , fieldName, value];
    }
}

@end
