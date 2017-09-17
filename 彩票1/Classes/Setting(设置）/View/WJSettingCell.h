//
//  WJSettingCell.h
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJSettingitem;


@interface WJSettingCell : UITableViewCell

//快速的创建cell
+(instancetype)cellWithTableView:(UITableView *)tableView tableViewCellStyle:(UITableViewStyle)tableViewCellStyle;


@property(nonatomic, strong) WJSettingitem *item;


@end
