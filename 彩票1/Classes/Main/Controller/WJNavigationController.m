//
//  WJNavigationController.m
//  彩票1
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJNavigationController.h"
#import "UIImage+Image.h"
#import "WJSaveService.h"

@interface WJNavigationController ()<UINavigationControllerDelegate>
@property(nonatomic, strong) id popDelegate;

@end

@implementation WJNavigationController

//什么调用：第一次使用这个类或者它的子类的时候
//不一定只会调用一次
+(void)initialize
{
    if (self == [WJNavigationController class])
    {
        

        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
        //设置导航条的背景图片
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        //    设置导航条文字标题
        //创建描述字体的字典
        NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
        
        //颜色
        textAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
        //字体大小
        textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
        
        
        
        //titleTextAttributes:给标题文字设置设置属性（颜色，字体，阴影...)
        navBar.titleTextAttributes = textAttr;
        

    }

}

//类加载的时候调用
//这个才是只会调用一次
+(void)load
{
//    NSLog(@"%s",__func__);
    
    //只想设置一次导航条的背景图片和导航条的标题
    
    //获取当前整个应用程序下所有导航条的外观
//    UINavigationBar *navBar = [UINavigationBar appearance];
    //只影响当前类下面的导航条
    //获取当前类下面的导航条
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //清空滑动手势代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //回到导航控制器的根控制器，恢复滑动手势按钮
    
    //监听导航控制器什么时候会到根控制器
    
    //设置导航控制器的代理
    
    self.delegate = self;
    
    //设置导航条标题颜色

}

#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.childViewControllers[0]) {
        //回到根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
//    NSLog(@"%@",viewController);

}
//假死状态：程序还在运行，只不过界面不能交互


//想在push的时候，设置下一个栈顶控制器的导航条的左边按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //viewController下一个栈顶控制器
//    NSLog(@"%ld",self.childViewControllers.count);
    
    
//    NSLog(@"%@",viewController);
//    NSLog(@"%s",);
    [super pushViewController:viewController animated:animated];
    
    
    //不是导航控制器的根控制器才需要返回按钮
    if (self.childViewControllers.count > 1) {
        //在iOS7之后，导航控制器自动添加了滑动返回功能，手指往右滑动，就能回到上一个控制器
        //注意：如果覆盖系统的返回按钮，滑动返回功能失效
        //设置左边的按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"NavBack"] style:0 target:self action:@selector(back)];
        
    }

}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{

    UIViewController *vc =  [super popViewControllerAnimated:animated];
//    NSLog(@"%@",vc);
    return vc;
    
}



//点击返回按钮
-(void)back
{
    //回到上一个界面
    [self popViewControllerAnimated:YES];
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
