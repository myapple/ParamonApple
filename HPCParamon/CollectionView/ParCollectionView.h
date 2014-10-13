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

-(UICollectionViewCell *)CollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)CollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
    
@end
