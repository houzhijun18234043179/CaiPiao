//
//  HMKeyboardToolBar.h
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMKeyboardToolBar;
//1
@protocol HMKeyboardToolBarDelegate <NSObject>

- (void)keyboardToolBarDidClickedCancel:(HMKeyboardToolBar *)toolBar;
- (void)keyboardToolBarDidClickedSure:(HMKeyboardToolBar *)toolBar;

@end

@interface HMKeyboardToolBar : UIView
//2
@property (nonatomic, weak) id<HMKeyboardToolBarDelegate> delegate;
//3

+ (instancetype)toolBar;
@end
