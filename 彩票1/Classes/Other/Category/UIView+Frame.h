//
//  UIView+Frame.h
//  彩票1
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

//如果@property在分类中使用，不会生成成员属性，只会生成get和set方法,set方法声明
@property(nonatomic, assign) CGFloat width;

@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) CGFloat x;

@property(nonatomic, assign) CGFloat y;


//get方法
//-(CGFloat)width;
//
//-(void)setwidth:(CGFloat)width;
//
//
//-(CGFloat)height;

@end
