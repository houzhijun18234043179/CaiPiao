//
//  StaticUtil.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-5.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "StaticUtil.h"
#import "RegexKitLite.h"
#import "LoginWebVC.h"

@implementation StaticUtil

+ (NSString *)stringWithoutHTMLTags:(NSString *)sourceString{
    NSString *regex = @"<.*>";
    NSString *result = [sourceString stringByReplacingOccurrencesOfRegex:regex withString:@""];
    return result;
}

+ (void)presentLoginWebVCFromVC:(UIViewController *)parentViewController{
    LoginWebVC *vcLoginWeb = [[LoginWebVC alloc] init];
    [parentViewController presentModalViewController:vcLoginWeb animated:NO];
    [vcLoginWeb release];
}

@end
