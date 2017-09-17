//
//  WJPopMenu.m
//  彩票1
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJPopMenu.h"


@interface WJPopMenu ()


@end
@implementation WJPopMenu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)hideInPoint:(CGPoint)point completion:(void (^__nullable)())completion
{

    [UIView animateWithDuration:1 animations:^{
        self.center = point;
        
        //形变
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        //移除
        [self removeFromSuperview];
        
        //隐藏蒙版
        completion();
        
    }];

}

//点击关闭按钮
- (IBAction)close:(id)sender
{


    //通知代理，移除菜单，移除蒙版
    if ([_delegate respondsToSelector:@selector(popMenuDidClickClose:)])
    {
        [_delegate popMenuDidClickClose:self];
        
    }

}


+(instancetype)showInPoint:(CGPoint)point;
{

    
   WJPopMenu *menu =  [[NSBundle mainBundle] loadNibNamed:@"WJPopMenu" owner:nil options:nil][0];
    
    menu.center = point;


    [[UIApplication sharedApplication].keyWindow addSubview:menu];

    return menu;
    
}

@end
