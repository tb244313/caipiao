
//
//  UIView+Frame.m
//  彩票1
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(CGFloat)width
{

    return self.bounds.size.width;
}
-(void)setwidth:(CGFloat)width
{

    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;

}
-(CGFloat)height
{

    return self.bounds.size.height;
}

-(CGFloat)x
{
    return  self.frame.origin.x;
}

-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)y
{

    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y
{

    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
@end
