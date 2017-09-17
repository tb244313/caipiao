//
//  WJGroupItem.h
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WJGroupItem : NSObject

//头部标题
@property(nonatomic, strong) NSString *headTitle;


@property(nonatomic, strong) NSString *footTitle;


//描述当前组有多少行，items：cell对应的模型（WJSettingItem)
@property(nonatomic, strong) NSArray *items;

@end
