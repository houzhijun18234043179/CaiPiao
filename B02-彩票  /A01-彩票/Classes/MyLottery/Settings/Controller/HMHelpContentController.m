//
//  HMHelpContentController.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHelpContentController.h"
#import "HMHelp.h"
@interface HMHelpContentController () <UIWebViewDelegate>

@end

@implementation HMHelpContentController

- (void)loadView {
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //关闭按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(btnClose)];
    self.navigationItem.leftBarButtonItem = item;
    
    //加载对应的网页
    UIWebView *webView = (UIWebView *)self.view;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    webView.delegate = self;
    [webView loadRequest:request];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //网页加载完成
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.location.href='#%@'",self.help.id]];
}


- (void)btnClose {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
