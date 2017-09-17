//
//  WJPushViewController.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJPushViewController.h"
#import "WJGroupItem.h"
#import "WJSettingArrowitem.h"
#import "WJSettingCell.h"
#import "WJAwardViewController.h"
#import "WJScoreViewController.h"

@interface WJPushViewController ()

@end

@implementation WJPushViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加第0组
    [self setUpGroup0];
    
}

//添加第0组
-(void)setUpGroup0
{
    //1创建组模型
    WJGroupItem *group = [[WJGroupItem alloc]init];
    
    //2创建行模型
    WJSettingArrowitem *item = [WJSettingArrowitem itemWithImage:nil title:@"开奖推送"];
    item.descVc = [WJAwardViewController class];
    
    
    WJSettingArrowitem *item1 = [WJSettingArrowitem itemWithImage:nil title:@"比分直播"];
    item.descVc = [WJScoreViewController class];
    
    WJSettingArrowitem *item2 = [WJSettingArrowitem itemWithImage:nil title:@"开奖推送"];

    WJSettingArrowitem *item3 = [WJSettingArrowitem itemWithImage:nil title:@"开奖推送"];


    group.items = @[item,item1,item2,item3];
    
    
    //3描述组行模型
    
    [self.groups addObject:group];
}




@end
