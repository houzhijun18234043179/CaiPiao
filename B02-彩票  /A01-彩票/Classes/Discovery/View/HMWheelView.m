//
//  HMWheelView.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMWheelView.h"
#import "UIView+Ex.h"
@interface HMWheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//记录上一个按钮
@property (nonatomic, weak) UIButton *previousBtn;
//
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation HMWheelView
//点击开始选号按钮
- (IBAction)start:(id)sender {
    //旋转
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    anim.toValue = @(M_PI * 2 * 5);
    anim.duration = 2;
    //设置代理的目的,监听动画开始和结束
    anim.delegate = self;
    [self.imageView.layer addAnimation:anim forKey:nil];
}
//核心动画的代理方法
//快速动画开始
- (void)animationDidStart:(CAAnimation *)anim {
    //禁用和用户的交互
    self.imageView.userInteractionEnabled = NO;
    //暂停慢速动画
    self.link.paused = YES;
    
}
//快速动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //动画停止,旋转会原点
    self.imageView.transform = CGAffineTransformMakeRotation(-self.previousBtn.tag * 2 * M_PI / 12);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //开启和用户的交互
        self.imageView.userInteractionEnabled = YES;
        //开始慢速动画
        self.link.paused = NO;
    });
}

+ (instancetype)wheelView {
    return [[[NSBundle mainBundle] loadNibNamed:@"HMWheelView" owner:nil options:nil] lastObject];
}

//1 添加12个星座按钮
//2 设置按钮上的文字

//3 慢速旋转  CADisplayLink


- (void)awakeFromNib {
    //3 慢速旋转
    [self startRotation];
    
    
    int count = 12;
    
    
    //开启imageView和用户交互
    self.imageView.userInteractionEnabled = YES;
    
    //星座图片  12个     当UIImage加载本地图片的时候.会自动转换 pt
    UIImage *bigImg = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *selBigImg = [UIImage imageNamed:@"LuckyAstrologyPressed"];

    //把pt转换成px
    CGFloat scale =  [UIScreen mainScreen].scale;  // 1x   2x  3x
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = bigImg.size.width / 12 * scale;
    CGFloat height = bigImg.size.height * scale;
    
    for (int i =0; i< count; i++) {
        x = i * width;
        //px  剪裁图片
       CGImageRef smallImg =  CGImageCreateWithImageInRect(bigImg.CGImage, CGRectMake(x, y, width, height));
        CGImageRef selSmallImg =  CGImageCreateWithImageInRect(selBigImg.CGImage, CGRectMake(x, y, width, height));

        UIImage *sImg = [UIImage imageWithCGImage:smallImg scale:scale orientation:UIImageOrientationUp];
        UIImage *selImg = [UIImage imageWithCGImage:selSmallImg scale:scale orientation:UIImageOrientationUp];

        //释放
        CGImageRelease(smallImg);
        CGImageRelease(selSmallImg);
        
        //创建12个按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.imageView addSubview:btn];
        
        btn.tag = i;
        
        //设置按钮上显示的星座图片
        [btn setImage:sImg forState:UIControlStateNormal];
        [btn setImage:selImg forState:UIControlStateSelected];
        
        //设置按钮中的图片的位置 (  还有一种方式自定义button 重写layoutSubViews)
        btn.imageEdgeInsets = UIEdgeInsetsMake(-25, 0, 0, 0);
        
        //加载选中的图片
        UIImage *img = [UIImage imageNamed:@"LuckyRototeSelected"];
        [btn setBackgroundImage:img forState:UIControlStateSelected];
      //设置按钮大小
        btn.width = img.size.width;
        btn.height = img.size.height;
        
        //设置锚点  -- 必须先设置大小
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position =  self.imageView.center;
        //旋转
        btn.transform = CGAffineTransformMakeRotation(i * M_PI * 2 / count);
        
        //给按钮注册事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //让第一个按钮选中
        if (i  == 0) {
            [self btnClick:btn];
        }
        
    }
}

//开启慢速旋转
- (void)startRotation {
    //和屏幕的刷新率保持一致   执行动画
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    self.link = link;
}

//旋转
- (void)update {
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4 / 60);
}


//点击.让当前按钮选中
- (void)btnClick:(UIButton *)sender {
    self.previousBtn.selected = NO;
    sender.selected = YES;

    self.previousBtn = sender;
}








@end
