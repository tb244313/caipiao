//
//  UIImage+Image.h
//  彩票1
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
//给定一个最原始的图片名称生成一个原始的图片
+(instancetype)imageWithOriginalImageName:(NSString *)imageName;
@end
