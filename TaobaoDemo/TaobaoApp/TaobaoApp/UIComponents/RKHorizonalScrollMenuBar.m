//
//  RKHorizonalScrollMenuBar.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-31.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RKHorizonalScrollMenuBar.h"

@implementation RKHorizonalScrollMenuBar
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc{
    [_scrollView release];
    [_contentView release];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)reloadMenuArray:(NSArray *)menuArray{
    if (_scrollView.superview) {
        [_scrollView removeFromSuperview];
    }
    [_scrollView release], _scrollView = nil;
    [_contentView release], _contentView = nil;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _contentView = [[UIView alloc] initWithFrame:self.bounds];
    
    CGFloat buttonX, buttonY, buttonWidth, buttonHeight = 20, hGap = 10, fontSize = 14;
    buttonY = (self.bounds.size.height - buttonHeight)/2;
    for (NSString *menu in menuArray) {
        int charNumber = [menu length];
        buttonX = buttonX + buttonWidth + hGap;
        buttonWidth = buttonHeight - fontSize + fontSize*charNumber;
        
        UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
        [menuButton setTitle:menu forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [menuButton addTarget:self action:@selector(menuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect contentViewRect = _contentView.bounds;
        contentViewRect.size.width = buttonX + buttonWidth + hGap;
        [_contentView setFrame:contentViewRect];
        [_contentView addSubview:menuButton];
    }
    _scrollView.contentSize = _contentView.frame.size;
}

- (void)menuButtonAction:(id)sender{
    for (UIButton *menuButton in _contentView.subviews) {
        menuButton.selected = NO;
    }
    ((UIButton *)sender).selected = YES;
    
    if ([delegate respondsToSelector:@selector(rkHorizonalScrollMenuBar:didSelectMenuItem:)]) {
        [delegate rkHorizonalScrollMenuBar:self didSelectMenuItem:sender];
    }
}

@end
