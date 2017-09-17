//
//  WJArenaNavController.m
//  彩票1
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJArenaNavController.h"

@interface WJArenaNavController ()

@end

@implementation WJArenaNavController


+(void)load
{

    // 获取当前类下的所有导航控制器
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
