//
//  LoginWebVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "LoginWebVC.h"

#define POLLING_TIMES_LIMIT 10
#define POLLING_INTERVAL 10

@interface LoginWebVC(Private)
- (void)doSessionPoll;
- (void)stopSessionPoll;
@end

@implementation LoginWebVC
@synthesize loginUrl;
@synthesize theWebView;
@synthesize lblError;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleAuthCallback:) name:@"NT_AUTH_CALLBACK" object:nil];
    
    loadingView = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:loadingView];
    
    topClient = [RKTopClient sharedTopClient];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.lblError.hidden = YES;
    self.loginUrl = [topClient getLoginUrl];
//    NSString *topSession = [[RKTopClient sharedTopClient] autoLogin]; //老的认证流程
    if ([RKTopClient sharedTopClient].topsession) {
        [self dismissModalViewControllerAnimated:YES];
    }else if (loginUrl) {
        [self loadPageByURL:loginUrl];
    } else {
        self.lblError.hidden = NO;
    }
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self setTheWebView:nil];
    [self setLblError:nil];
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
    [loadingView release];
    [theWebView release];
    [lblError release];
    [super dealloc];
}

#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [loadingView show:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [loadingView hide:YES];
    return;
    
    //老的认证流程，已作废
    NSURL *url = webView.request.URL;
    NSString *queryString = [url query];
    DebugLog(@"\n已载入页面URL: %@", [url absoluteString]);
    DebugLog(@"\nQuery String: %@", queryString);
    //如果登录成功，queryString形如 sid=f7a7d14a313cc9827ce7d954fb66c948&ac=1&appkey=12432929&callback_url=null
    //a337ac3f9221c155679c74a1248dfecf
    //f7a7d14a313cc9827ce7d954fb66c948
    if (queryString && [queryString rangeOfString:@"sid"].length>0) {
        NSString *sid = [queryString stringByMatching:@"sid=(\\w+)&.*" capture:1L];
        DebugLog(@"\n从页面URL获取到sid = %@", sid);
        [self doSessionPoll];
//        NSString *sessionKey = [topClient getUserSessionKey];
//        if ([sid isEqualToString:sessionKey]) 
//        {
//            DebugLog(@"\n登录成功！\nsid = %@\nsessionKey = ", sid, topClient.sid);
//            [self dismissModalViewControllerAnimated:YES];
//        }
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [loadingView hide:YES];
}

#pragma mark - public methods
- (IBAction)refreshWebPage:(id)sender {
    [self loadPageByURL:self.loginUrl];
}

- (IBAction)cancelLogin:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.tabBarController.selectedIndex = 0;
}

-(void)loadPageByURL:(NSString *)url{
    NSURL *theURL = [NSURL URLWithString:url];
    [theWebView loadRequest:[NSURLRequest requestWithURL:theURL]];
}

#pragma mark - private methods
- (void)handleAuthCallback:(NSNotification *)notification{
    NSURL *url = notification.object;
    NSRange urlPrefixRange = [url.absoluteString rangeOfString:@"appcallback://#"];
    if (urlPrefixRange.length==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录失败" message:url.absoluteString  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return;
    }
    NSString *parameterString = [url.absoluteString stringByReplacingCharactersInRange:urlPrefixRange withString:@""];
    NSArray *parameterArray = [parameterString componentsSeparatedByString:@"&"];
    for (NSString *paramExp in parameterArray) {
        NSArray *keyNvalue = [paramExp componentsSeparatedByString:@"="];
        NSString *key = [keyNvalue objectAtIndex:0];
        NSString *value = [keyNvalue objectAtIndex:1];
        NSLog(@"%@ = %@", key, value);
        if ([key isEqualToString:@"taobao_user_nick"]) {
            [RKTopClient sharedTopClient].nick = value;
        }else if ([key isEqualToString:@"access_token"]) {
            [RKTopClient sharedTopClient].topsession = value;
        }
    }

    [self dismissModalViewControllerAnimated:YES];
}

- (void)doSessionPoll{
    pollingCount++;
    NSLog(@"\n第 %d 次获取Session Key.", pollingCount);
    NSString *sessionKey = [topClient getUserSessionKey];
    if (pollingCount >= POLLING_TIMES_LIMIT) 
    {
        DebugLog(@"\n已达最大polling重试次数，暂停Session Poll ");
        [self stopSessionPoll];
    }
    else if (sessionKey) 
    {
        DebugLog(@"\n登录成功！\nsessionKey = ", topClient.sid);
        [self dismissModalViewControllerAnimated:YES];
    }
    else
    {
        [self performSelector:@selector(doSessionPoll) withObject:nil afterDelay:POLLING_INTERVAL];
    }
    
}

- (void)stopSessionPoll{
    pollingCount=0;
}
@end
