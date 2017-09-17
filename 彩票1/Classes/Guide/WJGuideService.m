//
//  WJGuideService.m
//  彩票1
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJGuideService.h"
#import "WJSaveService.h"
#import "WJNewFeatureViewController.h"
#import "WJTabBarController.h"

#define WJVersionKey @"version"


@implementation WJGuideService
+(UIViewController *)chooseWindowRootViewController
{
    
    //定义一个窗口的根控制器
    UIViewController *rootVc = nil;
    //新特性->控制器
    //1.第一次使用app时会显示新特性界面
    //2.如何判断app是否有新的版本号，第一次使用app新的版本的时候就会显示页面
    //3.最新的版本好保存到info.plist文件中
    //获取应用最新的版本号1.0
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    
    //获取上一次的版本号1.0
    NSString *oldVersion = [WJSaveService objectForKey:WJVersionKey];
    
    
    
    
    
    if ([curVersion isEqualToString:oldVersion] == NO) {
        
        [WJSaveService setObject:curVersion forKey:WJVersionKey];
        
        
        
        //有最新的版本号
        //进入新特性界面
        // 创建流水布局
        WJNewFeatureViewController *newFeature = [[WJNewFeatureViewController alloc] init];
        rootVc = newFeature;
        NSLog(@"进入新特性界面");
        
        
    }else{
        //没有最新的版本号
        //进入主框架界面
        //创建UITabBarController
        WJTabBarController *tabBar = [[WJTabBarController alloc]init];
        
        rootVc = tabBar;
        NSLog(@"进入主框架界面");
    }
    return rootVc;
    
}
@end
