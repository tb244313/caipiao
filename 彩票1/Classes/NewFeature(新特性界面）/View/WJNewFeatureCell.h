//
//  WJNewFeatureCell.h
//  彩票1
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

//告诉cell是不是最后一个cell
-(void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end
