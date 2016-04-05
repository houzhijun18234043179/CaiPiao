//
//  RKHorizonalScrollMenuBar.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-31.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RKHorizonalScorllMenuBarDelegate <NSObject>

- (void)rkHorizonalScrollMenuBar:(id)menuBar didSelectMenuItem:(id)menuItem;

@end

@interface RKHorizonalScrollMenuBar : UIView{
    UIScrollView *_scrollView;
    UIView *_contentView;
}

@property (nonatomic, assign) id<RKHorizonalScorllMenuBarDelegate> delegate;

- (void)reloadMenuArray:(NSArray *)menuArray;

@end
