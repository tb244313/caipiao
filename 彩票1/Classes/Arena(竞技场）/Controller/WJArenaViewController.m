//
//  WJArenaViewController.m
//  彩票1
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJArenaViewController.h"


#define WJColor(r,g,b) ([UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]) 


@interface WJArenaViewController ()

@end

@implementation WJArenaViewController

//自己创建控制器的view
-(void)loadView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    self.view = imageView;
    imageView.userInteractionEnabled = YES;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavBar];
    
}

//设置导航栏
-(void)setNavBar
{
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    //segment: 默认文字跟选中背景图片
    //设置选中的背景图片
    //设置导航条的内容
    self.navigationItem.titleView = segment;
    
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    segment.tintColor = WJColor(18, 142, 143);
    
    NSMutableDictionary *norAttr = [NSMutableDictionary dictionary];
    norAttr[NSForegroundColorAttributeName] = WJColor(18, 143, 142);
    //设置文字
    [segment setTitleTextAttributes:norAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selAttr = [NSMutableDictionary dictionary];
    selAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //设置文字
    [segment setTitleTextAttributes:selAttr forState:UIControlStateSelected];
    
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
