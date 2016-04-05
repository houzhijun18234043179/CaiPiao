//
//  StaticUtil.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-5.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegexKitLite.h"

@interface StaticUtil : NSObject

+ (NSString *)stringWithoutHTMLTags:(NSString *)sourceString;

+ (void)presentLoginWebVCFromVC:(UIViewController *)parentViewController;

@end
