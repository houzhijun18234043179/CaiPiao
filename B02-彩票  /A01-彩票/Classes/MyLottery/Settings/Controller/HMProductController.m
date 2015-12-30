//
//  HMProductController.m
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMProductController.h"
#import "HMProduct.h"
#import "HMProductCell.h"
@interface HMProductController ()
@property (nonatomic, strong) NSArray *products;
@end

@implementation HMProductController
//懒加载
- (NSArray *)products {
    if (_products == nil) {
        _products = [HMProduct products];
    }
    return _products;
}

//UICollectionView must be initialized with a non-nil layout parameter
//1  初始化之前设置layout
- (instancetype)init {
    
    UICollectionViewFlowLayout *layout=  [UICollectionViewFlowLayout new];
   
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 15;
    layout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);

    return [super initWithCollectionViewLayout:layout];
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];

    //2  Register cell classes

    UINib *nib = [UINib nibWithNibName:@"HMProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}




- (void)dealloc {
    NSLog(@"dealloc");
}
#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
   //设置选中cell的背景样式
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = view;
    
    cell.product = self.products[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//点击cell的时候.输出对应的cell的product的名称
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HMProduct *product = self.products[indexPath.item];
   
    
    UIApplication *app = [UIApplication sharedApplication];
    //应用的url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",product.customUrl,product.id]];
    
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }else{
        [app openURL:[NSURL URLWithString:product.url]];
    }

}



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
