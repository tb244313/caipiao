//
//  WJSettingitem.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJSettingitem.h"

@implementation WJSettingitem


+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{

    WJSettingitem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;

}
@end
