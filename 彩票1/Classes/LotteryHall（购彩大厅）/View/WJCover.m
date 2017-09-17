
//
//  WJCover.m
//  彩票1
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJCover.h"


@implementation WJCover

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(void)show
{
    // 弹出蒙版，蒙版上有pop菜单
        WJCover *cover = [[WJCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
        cover.backgroundColor = [UIColor blackColor];
        cover.alpha = 0.3;
    
    //创建菜单

    
    
    //    //在开发中，只要把一个控件显示在最外边，就把它添加到主窗口上，
    //    //获取主窗口
        [[UIApplication sharedApplication].keyWindow addSubview:cover];
}

+(void)hide
{
    //移除蒙版
    for (UIView *childView in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            [childView removeFromSuperview];
        }
    }
}
@end
