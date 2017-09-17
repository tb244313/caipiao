//
//  WJHallViewController.m
//  彩票1
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJHallViewController.h"
#import "UIImage+Image.h"
#import "WJCover.h"
#import "WJPopMenu.h"

@interface WJHallViewController ()<WJPopMenuDelegate>

@end

@implementation WJHallViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //自己写的分类方法，也想要提示
    //创建item

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(activity)];

    
    
}
//点击活动按钮就会调用
-(void)activity
{

    //弹出蒙版
    [WJCover show];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;

 
    //2.弹出pop菜单
    WJPopMenu *menu =  [WJPopMenu showInPoint:CGPointMake(screenW * 0.5, screenH * 0.5)];
    menu.delegate = self;
    
}

#pragma mark - WJPopMenuDelegate
//点击菜单中关闭按钮就会调用
-(void)popMenuDidClickClose:(WJPopMenu *)popMenu
{
    
    //隐藏pop菜单的某个点
 //   [popMenu hideInPoint:CGPointMake(44, 44)];
    [UIView animateWithDuration:0.25 animations:nil completion:^(BOOL finished) {
        //动画完成的时候做事情
        
    }];


    void (^completion)() = ^(){
        //移除蒙版
        [WJCover hide];
    };

    completion();
    
    
    
    [popMenu hideInPoint:CGPointMake(44, 44) completion:^(){
        //移除蒙版
//        [WJCover hide];
    }];
    
    

    
}


@end
