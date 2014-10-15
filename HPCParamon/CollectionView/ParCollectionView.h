//
//  ParCollectionView.h
//  HPCParamon
//
//  Created by 张小静  on 14-10-13.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic)NSMutableArray *dataMArr;// 数据源
-(void)setUpCollection;
-(void)setDeletAttribuString:(UIButton *)btnButton  forColor:(UIColor *)color;
-(void)setworkStateAttribuString:(UILabel *)label   forState:(BOOL) normal;
@end
