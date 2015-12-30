//
//  HMNewFeatureController.m
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//
#define count 4
#import "HMNewFeatureController.h"
#import "HMNewFeatureCell.h"
#import "UIView+Ex.h"
@interface HMNewFeatureController ()
@property (nonatomic, weak) UIImageView *guideView;
@property (nonatomic, weak) UIImageView *guideLargeTextView;
@property (nonatomic, weak) UIImageView *guideSmallTextView;

@end

@implementation HMNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

//1 设置layout
- (instancetype)init {
    UICollectionViewFlowLayout *layout=  [ UICollectionViewFlowLayout new];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //分页
    self.collectionView.pagingEnabled = YES;
    //不显示横向滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //2 Register cell classes

    UINib *nib = [UINib nibWithNibName:@"HMNewFeatureCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    
    //创建4个imageView
    [self addImageViews];
}

- (void)addImageViews {
    //画线
    UIImageView *guideLineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLineView];
    guideLineView.x = -200;
    
    //第一个图片
    UIImageView *guideView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guideView];
    
    self.guideView = guideView;
    //大文字
    UIImageView *guideLargeTextView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeTextView];
    guideLargeTextView.y += self.view.height * 0.7;

    self.guideLargeTextView = guideLargeTextView;
    //小文字
    UIImageView *guideSmallTextView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallTextView];
    guideSmallTextView.y += self.view.height * 0.8;
    self.guideSmallTextView = guideSmallTextView;

    
}

//collectionView的代理方法
//滚动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //获取偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat w = scrollView.width;
    
    //判断滚动的方向   offsetX和guideView的x值比较
    if (offsetX < self.guideView.x) {
        w = -w;
    }
    
    self.guideView.x = offsetX + w;
    self.guideLargeTextView.x = offsetX + w;
    self.guideSmallTextView.x = offsetX + w;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.guideView.x = offsetX;
        self.guideLargeTextView.x = offsetX;
        self.guideSmallTextView.x = offsetX;
    }];
    
    //换图片
    int index = offsetX / ABS(w) + 1;
    NSString *imgName = [NSString stringWithFormat:@"guide%d",index];
    self.guideView.image = [UIImage imageNamed:imgName];
    
    imgName = [NSString stringWithFormat:@"guideLargeText%d",index];
    self.guideLargeTextView.image = [UIImage imageNamed:imgName];

    imgName = [NSString stringWithFormat:@"guideSmallText%d",index];
    self.guideSmallTextView.image = [UIImage imageNamed:imgName];

}


#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //设置背景图片
    NSString *name = [NSString stringWithFormat:@"guide%zdBackground",indexPath.item+1];
    cell.backgroudImageName = name;
    
    //控制按钮显示或者隐藏
    if (indexPath.item == count - 1) {
        [cell setStartBtnHidden:NO];
    }else{
        [cell setStartBtnHidden:YES];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
