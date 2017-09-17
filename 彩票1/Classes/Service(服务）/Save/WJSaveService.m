//
//  WJSaveService.m
//  彩票1
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJSaveService.h"

@implementation WJSaveService
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    // 偏好设置 有新的版本号
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];

}

+ (id)objectForKey:(NSString *)defaultName
{
    return  [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];

}
@end
