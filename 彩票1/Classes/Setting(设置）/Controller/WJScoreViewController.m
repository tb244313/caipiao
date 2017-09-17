//
//  WJScoreViewController.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJScoreViewController.h"
#import "WJGroupItem.h"
#import "WJSettingSwitchItem.h"

@interface WJScoreViewController ()
@property(nonatomic, assign) int age;
@end

@implementation WJScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup0];
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];

}

-(void)dealloc
{

    NSLog(@"%s",__func__);
    
}
//第0组
-(void)setUpGroup0
{
    //创建组模型
    WJGroupItem *group = [[WJGroupItem alloc] init];
    
    //创建行模型
    WJSettingSwitchItem *item = [WJSettingSwitchItem itemWithImage:nil title:@"推送我关注的比赛"];
    
    group.items = @[item];
    //添加到groups
    [self.groups addObject:group];
    

}
//第1组
-(void)setUpGroup1
{
    //创建组模型
    WJGroupItem *group = [[WJGroupItem alloc] init];
    
    //创建行模型
    WJSettingitem *item = [WJSettingitem itemWithImage:nil title:@"起始时间"];
    item.subTitle = @"00:00";
    
    
    
    group.items = @[item];
    
    group.headTitle = @"aaa";
    //添加到groups
    [self.groups addObject:group];
    
}

//第2组
-(void)setUpGroup2
{
    WJGroupItem *group = [[WJGroupItem alloc] init];
    
    //创建行模型
    WJSettingitem *item = [WJSettingitem itemWithImage:nil title:@"结束时间"];
    
    
    //typeof:会自动识别参数的类型
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.25 animations:^{
        NSLog(@"%@",self);
    }];
    
    
    //block尽量少使用self,容易造成循环引用
    
    //这里已经造成循环引用，原因block造成,block会把里面的所有强指针都强引用
    item.operationBlock = ^(NSIndexPath *indexPath){
//
//        //获取点击的cell
    //    self:强指针
    //    self:间接强引用block
    //    获取点击的cell
    
        NSLog(@"%d",weakSelf.age);
        
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        
        //弹出键盘
        UITextField *textField = [[UITextField alloc] init];
        [textField becomeFirstResponder];
        
        [cell addSubview:textField];
        
        //做键盘处理，只要键盘挡住cell,把cell往上移动
        //只要把文本框，就把文本框添加到对应的cell上就自动完成键盘处理
        
    };
    item.subTitle = @"23:59";

    group.items = @[item];
    
    group.headTitle = @"aaa";
    //添加到groups
    [self.groups addObject:group];
    
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
