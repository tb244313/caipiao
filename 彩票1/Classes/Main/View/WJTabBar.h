//
//  WJTabBar.h
//  彩票1
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJTabBar;

@protocol WJTabBarDelegate <NSObject>

@optional
-(void)tabBar:(WJTabBar *)tabBar didClickBtn:(NSInteger)buttonIndex;




@end



@interface WJTabBar : UIView

@property(nonatomic, weak) id<WJTabBarDelegate> delegate;

@property(nonatomic, strong) NSArray *items;

@end
