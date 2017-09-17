//
//  WJBaseViewController.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJBaseViewController.h"
#import "WJGroupItem.h"
#import "WJSettingArrowitem.h"
#import "WJSettingCell.h"


@interface WJBaseViewController ()

@end

@implementation WJBaseViewController

-(NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

-(instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - tableView数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WJGroupItem *group = self.groups[section];
    return group.items.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    WJSettingCell *cell = [WJSettingCell cellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleValue1];
    
    //获取对应的组模型
    WJGroupItem *group = self.groups[indexPath.section];
    
    //获取模型
    WJSettingitem *item = group.items[indexPath.row];
    
    //给cell传递一个模型
    cell.item = item;
    return cell;
    
}

#pragma mark - tableView代理
//返回每一组的头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //获取当前组模型
    WJGroupItem *group = self.groups[section];
    return group.headTitle;
    
}


//返回每一组的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //获取当前组模型
    WJGroupItem *group = self.groups[section];
    return group.footTitle;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //获取对应的组模型
    WJGroupItem *group = self.groups[indexPath.section];
    
    
    //获取模型
    WJSettingitem *item = group.items[indexPath.row];
    
    if (item.operationBlock) {
        //调用block
        item.operationBlock(indexPath);
        return;
    }
    if ([item isKindOfClass:[WJSettingArrowitem class]]) {
        //表示箭头类型，可以跳转
        WJSettingArrowitem *arrowItem = (WJSettingArrowitem *)item;
        
        
        if (arrowItem.descVc) {
            //创建需要跳转控制器对象
            UIViewController *vc =  [[arrowItem.descVc alloc] init];
            //跳转界面
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    
}

@end
