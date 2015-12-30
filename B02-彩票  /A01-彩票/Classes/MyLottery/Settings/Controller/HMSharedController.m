//
//  HMSharedController.m
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMSharedController.h"
#import <MessageUI/MessageUI.h>
@interface HMSharedController () <MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation HMSharedController
- (UIWebView *)webView {
    if (_webView ==nil) {
        _webView = [UIWebView new];
    }
    return _webView;
}


- (void)addGroups {
    
//    __unsafe_unretained HMSharedController  *weakSelf = self;
    
    __weak typeof(self)  weakSelf = self;
    
    
    HMSettingItem *item1 = [HMSettingItemArrow itemWithTitle:@"电话分享" icon:nil option:^{
        //方式1
//        NSURL *url = [NSURL URLWithString:@"tel://10000"];
//        [[UIApplication sharedApplication] openURL:url];
        
        //方式2
//        NSURL *url = [NSURL URLWithString:@"telprompt://10000"];
//        [[UIApplication sharedApplication] openURL:url];
        
        //方式3
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://10000"]];
        [weakSelf.webView loadRequest:request];

    }];
    
    HMSettingItem *item2 = [HMSettingItemArrow itemWithTitle:@"短信分享" icon:nil option:^{
//        NSURL *url = [NSURL URLWithString:@"sms://10000"];
//        [[UIApplication sharedApplication] openURL:url];
        
        //判断是否能发短信
        if (![MFMessageComposeViewController canSendText]) {
            return ;
        }
        
        MFMessageComposeViewController *vc = [MFMessageComposeViewController new];
        //设置导航条上按钮的 文字颜色
        vc.navigationBar.tintColor = [UIColor whiteColor];
        
        //
        vc.body = @"hello world";
        vc.recipients = @[@"110",@"120"];
        
        //
        vc.messageComposeDelegate = weakSelf;
        
        [weakSelf presentViewController:vc animated:YES completion:nil];
    }];
    
    HMSettingItem *item3 = [HMSettingItemArrow itemWithTitle:@"邮件分享" icon:nil option:^{
//        NSURL *url = [NSURL URLWithString:@"mailto://xxxx@xxx.com"];
//        [[UIApplication sharedApplication] openURL:url];
        
        //判断是否能发邮件
        if (![MFMailComposeViewController canSendMail]) {
            return ;
        }
        
        MFMailComposeViewController *vc = [MFMailComposeViewController new];
        //标题
        [vc setSubject:@"黑10 全体同学送你的礼物"];
        //收件人
        [vc setToRecipients:@[@"haoyuexing@itcast.cn"]];
        //抄送
//        [vc setCcRecipients:@[]];
        //密送
//        [vc setBccRecipients:@[]];
        [vc setMessageBody:@"黑10 全体同学送你的礼物" isHTML:NO];
        
        //附件
        UIImage *img = [UIImage imageNamed:@"aa"];
        NSData *data = UIImagePNGRepresentation(img);
        
        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"bb"];
        
        //
        vc.mailComposeDelegate = weakSelf;
        
        [weakSelf presentViewController:vc animated:YES completion:nil];
        
    }];
    
    HMSettingGroup *group = [HMSettingGroup groupWithItems:@[item1,item2,item3]];
    
    self.groups = @[group];
    
    //self -> groups  -> group -> item -> option  -> self
    
    //option -> self
}

- (void)dealloc {
    NSLog(@"dealloc");
}

//代理方法
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
