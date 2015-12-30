//
//  AppDelegate.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "AppDelegate.h"
#import "HMTabBarController.h"
#import "HMNewFeatureController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1 初始化window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //2 设置keywindow
    [self.window makeKeyAndVisible];
    
    
    //判断 显示新特性界面,还是显示app的主界面
    //读取应用的版本号
    float version = [[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"] floatValue];
    //获取上一次的版本号  从用户偏好中获取上一次的版本号
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    float oldVersion = [userDefaults floatForKey:@"version"];
    
    if (version > oldVersion) {
        //新特性界面
        HMNewFeatureController *vc = [HMNewFeatureController new];
        self.window.rootViewController = vc;
        
        //保存当前的版本号
        [userDefaults setFloat:version forKey:@"version"];
    }else{
        //显示应用的主界面
        
        //3 设置控制器
        HMTabBarController *tabBarC = [HMTabBarController new];
        
        self.window.rootViewController = tabBarC;
    }
    
    
    
  
    
    
    //显示状态栏
    UIApplication *app =  [UIApplication sharedApplication];
    [app setStatusBarHidden:NO];
    [app setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
