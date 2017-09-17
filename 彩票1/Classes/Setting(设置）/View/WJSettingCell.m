//
//  WJSettingCell.m
//  彩票1
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJSettingCell.h"
#import "WJSettingArrowitem.h"
#import "WJSettingSwitchItem.h"


@interface WJSettingCell ()
@property(nonatomic, strong) UISwitch *switchView;



@end
@implementation WJSettingCell


-(UISwitch *)switchView
{

    if (_switchView == nil) {
        UISwitch *switchView = [[UISwitch alloc] init];
        _switchView = switchView;
    }
    return _switchView;
}

+(instancetype)cellWithTableView:(UITableView *)tableView tableViewCellStyle:(UITableViewStyle)tableViewCellStyle
{
    static NSString *ID = @"cell";
    
    WJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:tableViewCellStyle reuseIdentifier:ID];
    }

    return cell;

}

-(void)setItem:(WJSettingitem *)item
{

    _item = item;
   
    [self setUpData];
    
    [self setUpAccessory];
    
}



-(void)setUpData
{
    self.textLabel.text = _item.title;
    
    self.imageView.image = _item.image;
    
    self.detailTextLabel.text = _item.subTitle;
    
}


//设置辅助视图
-(void)setUpAccessory
{
    //设置辅助视图
    if ([_item isKindOfClass:[WJSettingArrowitem class]]) {
        //显示箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if ([_item isKindOfClass:[WJSettingSwitchItem class]]){
        
        self.accessoryView = self.switchView;
        
    }else{
        
        self.accessoryView = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
        
    }

}
@end
