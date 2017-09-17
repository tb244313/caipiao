//
//  WJTitleButton.m
//  彩票1
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJTitleButton.h"
#import "UIView+Frame.h"

@implementation WJTitleButton


//自己的frame改变，就会

//布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //修改内部子控件位置
    //设置label
    if (self.titleLabel.x > self.imageView.x)
    {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }

    
//    NSLog(@"titleLabel:%f imageView:%f",self.titleLabel.x,self.imageView.x);
}

//重写目的，不需要覆盖之前的做法

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{

    [super setTitle:title forState:state];
    //自动计算尺寸的功能
    // 重新计算按钮的尺寸
    [self sizeToFit];
    
}


-(void)setImage:(UIImage *)image forState:(UIControlState)state
{

    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
