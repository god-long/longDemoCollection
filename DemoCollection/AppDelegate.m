//
//  AppDelegate.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/15.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstVC.h"
#import <JSPatch/JSPatch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //线上正常版本
    [JSPatch startWithAppKey:kJSPatchKey];
    
    //RSA加密
    [JSPatch setupRSAPublicKey:@"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEfqx5IU5s0O8LemLV2kpmNtN6\nOsjGWozaFULmgPG3oW/HMykzTqgO7DwY2D9NBpSJAHkrkBlqFm2t6eIh6pYJmJSe\nr8eCVRu3njIqdDGmKc5kLxKKFeWZCrMCtaF7ll0CG73liDZ+2IrfnH7I0nos3G2R\nZrDC9i8VEqEx9Xy2uwIDAQAB\n-----END PUBLIC KEY-----"];
    
#ifdef DEBUG
    //发布开发版本时需要打开
//    [JSPatch setupDevelopment];
#endif

    [JSPatch sync];

    //本地版本
//    [JSPatch testScriptInBundle];
    
     
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[[FirstVC alloc] init]];
    self.window.rootViewController = navi;
    
    [self configDynamicQuickActions];
    
    return YES;
}

//设置动态的quick actions
- (void)configDynamicQuickActions {

    UIApplicationShortcutIcon *tempItem1Icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome];
    
    UIApplicationShortcutItem *tempItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"com.resume.third" localizedTitle:@"我是动态的1" localizedSubtitle:@"我是运行程序后才出现的" icon:tempItem1Icon userInfo:nil];
    
    UIApplicationShortcutItem *tempItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"com.resume.fourth" localizedTitle:@"我是动态的2"];
    [UIApplication sharedApplication].shortcutItems = @[tempItem1,tempItem2];
}

//点击quick action到应用中响应的入口
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
    
    //根据设置的type唯一标识，来做具体的事情
    if ([shortcutItem.type isEqualToString:@"com.demoCollection.first"]) {
        [self showShortcutAlertWithTitle:shortcutItem.localizedTitle message:shortcutItem.localizedSubtitle];
    }else if ([shortcutItem.type isEqualToString:@"com.demoCollection.second"]){
        [self showShortcutAlertWithTitle:shortcutItem.localizedTitle message:[NSString stringWithFormat:@"subtitle:%@\nuserinfo:%@",shortcutItem.localizedSubtitle,[shortcutItem.userInfo objectForKey:@"keyName"]]];
    }
    
    completionHandler(YES);
}

- (void)showShortcutAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"%@",action);
    }]];
    [self.window.rootViewController presentViewController:alertVC animated:YES completion:nil];
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
