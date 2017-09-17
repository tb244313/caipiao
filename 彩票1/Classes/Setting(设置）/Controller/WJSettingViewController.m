
//
//  WJSettingViewController.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJSettingViewController.h"
#import "WJSettingitem.h"
#import "WJGroupItem.h"
#import "WJSettingArrowitem.h"
#import "WJSettingSwitchItem.h"
#import "WJSettingCell.h"
#import "WJPushViewController.h"


@interface WJSettingViewController ()
//保存当前tableView有多少组,元素应该是一个groupItem

@end

@implementation WJSettingViewController

//设置界面：MVC
//1.设计模型（需要自己设计模型），模型用来保存控件最想要的数据
//1.1 每一个cell需要对应模型(image,title,辅助试图类型)
//2.布局界面：tableView样式，分组
//3.观察有多少组，3组,搞一个数组记录下当前有多少组
//4.观察每一组有多少行 1:1 2:4 3:4

//tableView有多少组，就看下_groups有多少个数组模型，每一个小数组，用来描述当前这一组有多少行
//每一组有多少行，由小数组决定，小数组保存着这一组有多少个模型
//每一行长什么样子，有对应小数组中的模型决定


- (void)viewDidLoad {
    [super viewDidLoad];

    //手动创建模型数据
    //第一组
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
}
//第一组
-(void)setUpGroup0
{
    
    //创建组模型
    WJGroupItem *group = [[WJGroupItem alloc] init];
    group.headTitle = @"abc";
    
    //创建一个数组，描述第0组有多少行
    //创建模型
    WJSettingArrowitem *item = [WJSettingArrowitem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    
    group.items = @[item];
    [self.groups addObject:group];

}


//第1组
-(void)setUpGroup1
{
    
    //创建组模型
    WJGroupItem *group = [[WJGroupItem alloc] init];
    group.headTitle = @"bcd";
    
    //创建一个数组，描述第0组有多少行
    //创建模型
    WJSettingArrowitem *item = [WJSettingArrowitem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"推送与提醒"];

    
    //描述需要跳转的控制器
    item.descVc = [WJPushViewController class];
    
    WJSettingSwitchItem *item1 = [WJSettingSwitchItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    
    WJSettingSwitchItem *item2 = [WJSettingSwitchItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    WJSettingSwitchItem *item3 = [WJSettingSwitchItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];

    group.items = @[item,item1,item2,item3];
    
    [self.groups addObject:group];
    
}

-(void)setUpGroup2
{
    
    //创建组模型
    WJGroupItem *group = [[WJGroupItem alloc] init];
    //创建模型
    WJSettingArrowitem *item = [WJSettingArrowitem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    item.operationBlock = ^(NSIndexPath *indexPath){
    
        NSLog(@"检查新版号");
    };
    
    
    WJSettingArrowitem *item1 = [WJSettingArrowitem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
  
    
    
    WJSettingArrowitem *item2 = [WJSettingArrowitem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    WJSettingArrowitem *item3 = [WJSettingArrowitem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    group.items = @[item,item1,item2,item3];
    
    [self.groups addObject:group];

}





@end
