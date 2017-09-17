//
//  WJPopMenu.h
//  彩票1
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJPopMenu;

@protocol WJPopMenuDelegate <NSObject>

@optional

-(void)popMenuDidClickClose:(WJPopMenu *)popMenu;


@end

@interface WJPopMenu : UIView
@property(nonatomic, weak) id <WJPopMenuDelegate> delegate;
+(instancetype)showInPoint:(CGPoint)point;
//completion隐藏完成的时候需要做的事情
-(void)hideInPoint:(CGPoint)point completion:(void (^__nullable)())completion;
                                              



@end
