//
//  WJGroupBuyController.m
//  彩票1
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJGroupBuyController.h"
#import "WJTitleButton.h"
#import "UIImage+Image.h"

@interface WJGroupBuyController ()
@property(nonatomic, weak) WJTitleButton *titleButton;

@end

@implementation WJGroupBuyController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpNavBar];
    
    //跳转到当前控制器的时候隐藏底部条
//    self.hidesBottomBarWhenPushed = YES;
    //注意：只会帮你隐藏系统的UITabBar
    //把自己的tabBar的条添加到系统的tabBar
    
    
}


-(void)setUpNavBar
{
    //默认按钮图片在左边
    WJTitleButton *titleBtn = [WJTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleBtn;
    //文字
    [titleBtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    //image
    [titleBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    //自动计算按钮尺寸
    //    [titleBtn sizeToFit];
    self.navigationItem.titleView = titleBtn;
    
    //设置右边的按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:0 target:self action:@selector(click)];
    
    
}

//点击返回按钮
-(void)back
{
    //回到上一个界面
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)click
{
    //修改标题按钮的文字
    [_titleButton setTitle:@"全部彩种全部彩种全部彩种" forState:UIControlStateNormal];
    
    
//    //重新计算按钮的尺寸
//    [_titleButton sizeToFit];

}


@end
