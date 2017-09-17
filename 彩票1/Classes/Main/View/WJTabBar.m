//
//  WJTabBar.m
//  彩票1
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 apple. All rights reserved.
//  模仿系统的tabBar



//如何封装控件：先看外界怎么用
#import "WJTabBar.h"
#import "WJTabBarButton.h"
#import "UIView+Frame.h"

@interface WJTabBar ()

@property(nonatomic, weak) UIButton *selectBtn;
@end
@implementation WJTabBar


-(void)setItems:(NSArray *)items
{
    _items = items;
    
    int i = 0;
    
    for (UITabBarItem *item in items) {
        //创建按钮
        WJTabBarButton *btn = [WJTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        //监听按钮
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
    
        i++;
        if (btn.tag == 0) {
            [self btnClick:btn];
            
        }
  
        [self addSubview:btn];
        
    }

}


//点击按钮的时候调用
-(void)btnClick:(UIButton *)btn
{
    _selectBtn.selected = NO;
    
    btn.selected = YES;
    
    _selectBtn = btn;
    
    //切换界面
    //通知tabBarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:btn.tag];
    }
    
    
    
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)_items.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
  
    
    CGFloat w = self.width / count;
    CGFloat h = self.height;
    
    
    //设置按钮的位置
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        x = w * i;
        
        btn.frame = CGRectMake(x, y, w, h);
        
    }
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
