//
//  MyTaobaoVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "MyTaobaoVC.h"

@implementation MyTaobaoVC
@synthesize userInfo;
@synthesize theTableView;
@synthesize imgUserPhoto;
@synthesize lblUserNickName;
@synthesize lblBuyerCredit;
@synthesize lblSellerCredit;
@synthesize lblLevelDescription;
@synthesize btnWangwangLogin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    
    if ([RKTopClient sharedTopClient].nick==nil) {
        [StaticUtil presentLoginWebVCFromVC:self];
    } else {
        // 获取用户信息
        RKUserGetRequest *request = [[RKUserGetRequest alloc] initWithFields:@"user_id,nick,uid,buyer_credit,seller_credit,avatar" andNick:[RKTopClient sharedTopClient].nick];
        DebugLog(@"开始用SessionKey：%@ 调用API：taobao.user.get", [RKTopClient sharedTopClient].topsession);
        RKUserGetResponse *response = (RKUserGetResponse *)[[RKTopClient sharedTopClient] executeWithRequest:request andSessionKey:[RKTopClient sharedTopClient].topsession];   //注意这里必须使用topsession而不是sid属性
        DebugLog(@"获取到的用户信息：%@", [response.user rkPropertyDictionary]);
        if (response) {
            self.userInfo = response.user;
            [self configView];
        }
        
    }
}

- (void)viewDidUnload
{
    [self setTheTableView:nil];
    [self setImgUserPhoto:nil];
    [self setLblUserNickName:nil];
    [self setLblBuyerCredit:nil];
    [self setLblSellerCredit:nil];
    [self setLblLevelDescription:nil];
    [self setBtnWangwangLogin:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [userInfo release];
    [theTableView release];
    [imgUserPhoto release];
    [lblUserNickName release];
    [lblBuyerCredit release];
    [lblSellerCredit release];
    [lblLevelDescription release];
    [btnWangwangLogin release];
    [super dealloc];
}

#pragma mark - Event Handlers
- (IBAction)refreshUserInfo:(id)sender {
}

- (IBAction)logout:(id)sender {
    [[RKTopClient sharedTopClient] logout];
    [StaticUtil presentLoginWebVCFromVC:self];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrSection.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *cellsInSection = [self.arrCell objectAtIndex:section];
    return cellsInSection.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    TableCellSettings *cellSettings = [self.arrSection objectAtIndex:section];
    return cellSettings.title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    NSArray *cellsInSection = [self.arrCell objectAtIndex:indexPath.section];
    TableCellSettings *cellSettings = [cellsInSection objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = cellSettings.title;
    if (indexPath.section==0) {
        cell.detailTextLabel.text = cellSettings.subTitle;
        [cell.imageView setImage:[UIImage imageNamed:cellSettings.imageName]];
    }
    return cell;
}

#pragma mark - Inherited Methods
- (void)configView{
    [super configView];
    [self.imgUserPhoto setImageWithURL:[NSURL URLWithString:self.userInfo.avatar] placeholderImage:[UIImage imageNamed:@"PortraitPlaceholder"]];
    self.lblUserNickName.text = self.userInfo.nick;
    self.lblBuyerCredit.text = [NSString stringWithFormat:@"买家信用：%@", self.userInfo.buyer_credit_score];
    self.lblSellerCredit.text = [NSString stringWithFormat:@"卖家信用：%@", self.userInfo.seller_credit_score];
    self.lblLevelDescription.text = self.userInfo.buyer_credit_level;
}
- (void)configNavigationBar{
    [super configNavigationBar];
    self.navigationController.navigationBarHidden = YES;
    self.title = @"我的淘宝";
}
- (void)configTableCells{
    [super configTableCells];
    self.arrSection = [NSMutableArray array];
    self.arrCell =[NSMutableArray array];
    
    TableCellSettings *cellSettings = nil;
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"我是买家";
    [self.arrSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"收藏夹";
    [self.arrSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"";
    [self.arrSection addObject:cellSettings];
    
    NSMutableArray *cellsForSection = nil;
    
    cellsForSection = [NSMutableArray array];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.imageName = @"Icon-WaitPayment";
    cellSettings.title = @"等待买家付款";
    cellSettings.subTitle = @"0";
    [cellsForSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.imageName = @"Icon-WaitSending";
    cellSettings.title = @"等待卖家发货";
    cellSettings.subTitle = @"1";
    [cellsForSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.imageName = @"Icon-WaitReceiving";
    cellSettings.title = @"等待买家确认收货";
    cellSettings.subTitle = @"1";
    [cellsForSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.imageName = @"Icon-Order";
    cellSettings.title = @"三个月内成功的订单";
    cellSettings.subTitle = @"12";
    [cellsForSection addObject:cellSettings];
    [self.arrCell addObject:cellsForSection];
    
    cellsForSection = [NSMutableArray array];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"宝贝收藏";
    [cellsForSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"店铺收藏";
    [cellsForSection addObject:cellSettings];
    [self.arrCell addObject:cellsForSection];
    
    cellsForSection = [NSMutableArray array];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"收货地址管理";
    [cellsForSection addObject:cellSettings];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"其他设置";
    [cellsForSection addObject:cellSettings];
    [self.arrCell addObject:cellsForSection];
    
}
@end
