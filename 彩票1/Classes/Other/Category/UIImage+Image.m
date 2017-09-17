
//
//  UIImage+Image.m
//  彩票1
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+(instancetype)imageWithOriginalImageName:(NSString *)imageName
{
    
    //加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
