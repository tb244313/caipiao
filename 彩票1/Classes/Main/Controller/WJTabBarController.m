//
//  WJTabBarController.m
//  彩票1
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJTabBarController.h"
#import "WJHallViewController.h"
#import "WJArenaViewController.h"
#import "WJDiscoveryViewController.h"
#import "WJHistoryViewController.h"
#import "WJMyLotteryViewController.h"
#import "WJTabBar.h"
#import "WJNavigationController.h"
#import "WJArenaNavController.h"
#import "WJSaveService.h"

@interface WJTabBarController ()<WJTabBarDelegate>

//记录每个子控制器对应按钮的模型
@property(nonatomic, strong) NSMutableArray *items;

@end

@implementation WJTabBarController

+(void)initialize
{
    if (self == [WJNavigationController class])
    {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:nil];
        
        //获取当前整个应用程序下的所有导航条的外观
        //获取当前类下面的导航条
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        
        //设置导航条背景图片
        [navBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
        
        //设置导航条文字标题
        NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
        
        //颜色
        
        
    }
}

-(NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
        
    }
    return _items;
    

}
//UITabBarButton 上面的图片尺寸是有规格，不能太大，如果太大，就显示不出来
//系统的UITabBarButton不能显示我们美工提供的图片，系统的UITabBarButton不能完成我们需求，UITabBarButton不好使
//自定义按钮，显示UITabBar
//需不需要系统自带的UITabBarButton,把系统自带的UITabBarButton移除
//直接把系统的UITabBar移除
//自定义UITabBar,添加到tabBarVc上

//viewDidLoad:做控制器的初始化操作
- (void)viewDidLoad {
    [super viewDidLoad];
    

    //创建导航控制器的根控制器
    [self setUpAllChildViewController];
    
    //自定义tabBar
    [self setUpTabBar];
    
    
    //切换界面
//    self.selectedViewController = self.childViewControllers[1];
    
//    self.selectedIndex = 1;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    //移除系统UITabBar上自带的按钮
    for (UIView *childView in self.tabBar.subviews) {
       //判断下是否是UITabBar
        if ([childView isKindOfClass:[WJTabBar class]] == NO)
        {
            [childView removeFromSuperview];
        }
    }
}

#pragma mark - 自定义tabBar
-(void)setUpTabBar
{
    //在ARC中，一个对象没有被强引用，并不会马上销毁，什么时候销毁，在下一次运行循环到来的时候，系统会自动判断当前哪些对象，没有强引用，没有强引用，就会销毁
    
    //1.移除系统的tabBar
//    [self.tabBar removeFromSuperview];
//    NSLog(@"%@",self.tabBar);
    
    //2.添加自己的tabBar
    //1.创建UITabBar
    
    
    //2.创建UIView
    WJTabBar *tabBar = [[WJTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.delegate = self;
    
    //记录下tabBar里面有几个按钮
    //系统的tabBar里面有多少个按钮是由tabBarVc的子控制器总数
    //把对应按钮的模型数组
    tabBar.items = self.items;
    
    
    tabBar.backgroundColor = [UIColor blueColor];
    
    [self.tabBar addSubview:tabBar];
    
    
}

#pragma mark - WJTabBarDelegate
//点击底部按钮，切换控制器
-(void)tabBar:(WJTabBar *)tabBar didClickBtn:(NSInteger)buttonIndex
{
    self.selectedIndex = buttonIndex;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 添加所有的子控制器
-(void)setUpAllChildViewController
{
    
    //1.购彩大厅
    WJHallViewController *hall = [[WJHallViewController alloc] init];
    
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] seleImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    
    //2.竞技场
    WJArenaViewController *arena = [[WJArenaViewController alloc] init];
    arena.view.backgroundColor = [UIColor yellowColor];
    

    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] seleImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@"竞技场"];
    
    
    
    
    //3.发现
    //加载storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"WJDiscoveryViewController" bundle:nil];
    
    WJDiscoveryViewController *discover = [storyboard instantiateInitialViewController];
    
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] seleImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    
    
    //4.开奖信息
    WJHistoryViewController *history = [[WJHistoryViewController alloc] init];

    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] seleImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    
    //5.我的彩票
    WJMyLotteryViewController *lottery = [[WJMyLotteryViewController alloc] init];

    [self setUpOneChildViewController:lottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] seleImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];

    
    //添加子控制器
    //添加子控制器，tabBar子控制器：导航控制器
    //tabBarVc默认会把选中的控制器添加到自己的存放view的子控件上
    //默认tabBarVc选中第一个子控制器

}

-(void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image seleImage:(UIImage *)seleImage title:(NSString *)title
{
    //设置导航条标题
    vc.navigationItem.title = title;
    
    //设置导航条标题颜色
    
    
    UINavigationController *nav = [[WJNavigationController alloc] initWithRootViewController:vc];
    
    
    if ([vc isKindOfClass:[WJArenaViewController class]]) {
        //竞技场
        nav = [[WJArenaNavController alloc] initWithRootViewController:vc];
    }
    //设置导航条的背景色
//    nav.navigationBar.backgroundColor = [UIColor redColor];
    
    //UIBarMetricsDefault:才能设置图片成功,其它的模式都设置不了
    //UIBarMetricsDefault：导航控制器的子控制器的view高度会减少64
    
    
    nav.tabBarItem.image = image;
    
    nav.tabBarItem.selectedImage = seleImage;
    
    //保存对应按钮的模型
    [self.items addObject:nav.tabBarItem];
    
    
    [self addChildViewController:nav];

}

//设置导航条标题颜色



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
