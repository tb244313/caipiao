//
//  WJAwardViewController.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJAwardViewController.h"
#import "WJGroupItem.h"
#import "WJSettingArrowitem.h"
#import "WJSettingSwitchItem.h"
#import "WJSettingCell.h"

@interface WJAwardViewController ()

@end

@implementation WJAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup0];
}

//添加第0组
-(void)setUpGroup0
{
    //创建组模型
    WJGroupItem *group = [[WJGroupItem alloc] init];
    
    
    
    //创建行模型
    WJSettingSwitchItem *item = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];
    item.subTitle = @"每周二、四、日开奖";
    
    WJSettingSwitchItem *item1 = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];
    WJSettingSwitchItem *item2 = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];
    WJSettingSwitchItem *item3 = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];
    WJSettingSwitchItem *item4 = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];
    WJSettingSwitchItem *item5 = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];
    WJSettingSwitchItem *item6 = [WJSettingSwitchItem itemWithImage:nil title:@"双色球"];

    
    //3.描述组模型中行模型数组
    group.items = @[item,item1,item2,item3,item4,item5,item6];
    
    //4.把数组模型添加到groups
    [self.groups addObject:group];

}


//修改cell的样式
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    WJSettingCell *cell = [WJSettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleSubtitle];
    
    
    //获取对应的组模型
    WJGroupItem *group = self.groups[indexPath.section];
    
    //获取模型
    WJSettingitem *item = group.items[indexPath.row];
    
    //给cell传递一个模型
    cell.item = item;
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
