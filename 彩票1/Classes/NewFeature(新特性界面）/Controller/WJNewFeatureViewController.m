//
//  WJNewFeatureViewController.m
//  彩票1
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJNewFeatureViewController.h"
#import "WJNewFeatureCell.h"
#import "UIView+Frame.h"
#define  WJScreenW [UIScreen mainScreen].bounds.size.width
#define WJScreenH [UIScreen mainScreen].bounds.size.height
@interface WJNewFeatureViewController ()
@property(nonatomic, weak) UIImageView *guideView;
@property(nonatomic, assign) CGFloat lastoffsetX;

@end

@implementation WJNewFeatureViewController

//使用UICollectionViewController

//1.必须设置一个布局参数（流水布局）
//2.cell必须通过注册
//3.自定义cell


-(instancetype)init
{
    //创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置cell尺寸
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    //设置最小间距10
    layout.minimumLineSpacing = 0;
    
    //每个cell之间的间距
    layout.minimumInteritemSpacing = 0;
    
    //设置每个cell 之间的间距
//    layout.sectionInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    //设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithCollectionViewLayout:layout];
    
    
}

static NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];


    
    [self setUpCollectionView];

    //添加所有的子控件
    [self setUpAllChildView];
}

//添加所有的子控件
-(void)setUpAllChildView
{
    CGFloat screenW = WJScreenW;
    
    CGFloat screenH = WJScreenH;
    
    //guide:足球
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    
    guide.center = CGPointMake(screenW * 0.5, screenH * 0.5);
    
    [self.collectionView addSubview:guide];
    _guideView = guide;
    
    
    
    //线
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 130;
    
    [self.collectionView addSubview:guideLine];
    
    //大文字
    UIImageView *guideLargeT = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    
    guideLargeT.center = CGPointMake(WJScreenW * 0.5, WJScreenH * 0.8);
    
    [self.collectionView addSubview:guideLargeT];
    
    //小文字
    UIImageView *guideSmall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    
    guideSmall.center = CGPointMake(WJScreenW * 0.5, WJScreenH * 0.9);
    
    [self.collectionView addSubview:guideSmall];
    
    
}

//设置collectionview
-(void)setUpCollectionView
{
    //注册cell
    [self.collectionView registerClass:[WJNewFeatureCell class] forCellWithReuseIdentifier:ID];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //开启分页
    self.collectionView.pagingEnabled = YES;


    //隐藏滚动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    
    //取消弹簧效果
    self.collectionView.bounces = NO;
    
    //添加所有的子控件
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollView代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    
    //计算下与之前偏移量的差值
    CGFloat delta = offsetX - _lastoffsetX;
    
    NSLog(@"%f",delta);
    
    //记录下上一次
    _lastoffsetX = offsetX;
    
    
    
    NSLog(@"滚动完成");
    //平移guide,largeT,largeS,
    //平移guide
    _guideView.x += 2 * delta;
    [UIView animateWithDuration:0.25 animations:^{
        _guideView.x -= delta;
    }];
    
}

//item 代表cell
//返回collectionView有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

//返回cell外观
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WJNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
 
    NSLog(@"%@",cell);
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.row + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    cell.backgroundColor = [UIColor redColor];

    
    //给最后一个cell添加按钮
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}




@end
