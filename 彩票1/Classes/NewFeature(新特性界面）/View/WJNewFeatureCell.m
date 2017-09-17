//
//  WJNewFeatureCell.m
//  彩票1
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJNewFeatureCell.h"
#import "UIView+Frame.h"
#import "WJTabBarController.h"


@interface WJNewFeatureCell ()

@property(nonatomic, weak) UIButton *startButton;
@property (nonatomic, weak) UIImageView *imageView;

@end
@implementation WJNewFeatureCell

-(UIButton *)startButton
{
    if (_startButton == nil) {
        //添加立即体验
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [btn sizeToFit];
        btn.center = CGPointMake(self.width * 0.5, self.height * 0.95);
        
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        _startButton = btn;
    }
    return _startButton;

}
//点击立即体验按钮
-(void)start
{
    //跳转到主框架界面
    
    //切换界面，push,model,tarBarVC
    
    //修改窗口的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = [[WJTabBarController alloc] init];

}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:imageV];
        
        _imageView = imageV;
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
    self.imageView.frame = self.bounds;
}


-(void)setIndexPath:(NSIndexPath *)indexPath count:(int)count
{
    if (indexPath.item == count - 1) {

        self.startButton.hidden = NO;
        
    }else{//如果不是最后一个cell
    
        self.startButton.hidden = YES;
        
    }
}
@end
