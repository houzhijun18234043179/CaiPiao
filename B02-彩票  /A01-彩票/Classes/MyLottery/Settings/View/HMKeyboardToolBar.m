//
//  HMKeyboardToolBar.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMKeyboardToolBar.h"

@implementation HMKeyboardToolBar

+ (instancetype)toolBar {
    return [[[NSBundle mainBundle] loadNibNamed:@"HMKeyboardToolBar" owner:nil options:nil] lastObject];
}

//取消
- (IBAction)btnCancel:(id)sender {
    if ([self.delegate respondsToSelector:@selector(keyboardToolBarDidClickedCancel:)]) {
        [self.delegate keyboardToolBarDidClickedCancel:self];
    }
    
}
//确定
- (IBAction)btnSure:(id)sender {
    if ([self.delegate respondsToSelector:@selector(keyboardToolBarDidClickedSure:)]) {
        [self.delegate keyboardToolBarDidClickedSure:self];
    }
}

@end
