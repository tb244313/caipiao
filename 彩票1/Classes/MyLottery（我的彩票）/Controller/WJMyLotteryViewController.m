//
//  WJMyLotteryViewController.m
//  彩票1
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJMyLotteryViewController.h"
#import "UIImage+Image.h"
#import "WJSettingViewController.h"

@interface WJMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation WJMyLotteryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image =  _loginBtn.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    [self setUpNav];
    
}

//左边按钮
-(void)setUpNav
{
    //左边的内容
    UIButton *leftButton = [[UIButton alloc] init];
    
    [leftButton setTitle:@"客服" forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    
    [leftButton sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    
    //右边的内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"Mylottery_config"] style:0 target:self action:@selector(setting)];
    
}

-(void)setting
{

    NSLog(@"---");
    WJSettingViewController *settingVc = [[WJSettingViewController alloc] init];
    settingVc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:settingVc animated:YES];
    
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
