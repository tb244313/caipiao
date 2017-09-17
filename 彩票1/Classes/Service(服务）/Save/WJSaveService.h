//
//  WJSaveService.h
//  彩票1
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 apple. All rights reserved.
//  存储业务

#import <Foundation/Foundation.h>

@interface WJSaveService : NSObject
+ (void)setObject:(id)value forKey:(NSString *)defaultName;
+ (id)objectForKey:(NSString *)defaultName;


@end
