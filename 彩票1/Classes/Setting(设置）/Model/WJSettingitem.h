//
//  WJSettingitem.h
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum :  NSUInteger{

    WJSettingItemTypeArrow,
    WJSettingItemTypeSwitch,

}WJSettingitemType;

//每一个item对应cell
@interface WJSettingitem : NSObject

@property(nonatomic, strong) UIImage *image;

@property(nonatomic, strong) NSString *title;

@property(nonatomic, strong) NSString *subTitle;

//记录cell辅助试图类型
@property(nonatomic, assign) WJSettingitemType itemType;

//记录开关是否打开
@property(nonatomic, assign) BOOL isOn;

@property(nonatomic, strong) void(^operationBlock)(NSIndexPath *indexPath);


//类型 block变量

+(instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;


@end
