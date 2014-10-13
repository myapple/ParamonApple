//
//  ParCollectionView.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-13.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParCollectionView.h"
#import "WorkMsgCell.h"
@implementation ParCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataMArr = [[NSMutableArray alloc ] init];
        // 获取数据
        //
        //Test Data
        NSInteger testID =0;
        testID++;
        
        [_dataMArr addObject:@(testID)];
        
    }
    return self;
}
-(void)ViewDidLoad
{
    [self setUpCollection];
}
-(void)setUpCollection{
    self.dataMArr = [NSMutableArray array];
   /* for(NSInteger index = 0;index<9; index++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)index+1]];
        NSString *title = [NSString stringWithFormat:@"{0,%ld}",(long)index+1];
        NSDictionary *dic = @{@"image": image, @"title":title};
        [self.dataMArr addObject:dic];
    }
    */
   // _dataMArr = [[NSMutableArray alloc ] init];
    // 获取数据
    //
    //Test Data
    NSInteger testID =0;
    testID++;
    while (testID <=20) {
        [_dataMArr addObject:@(testID)];
    }
    
    self.myConllection.delegate = self;
    self.myConllection.dataSource = self;
    
    
}
#pragma mark - Collection View Data Source
-(NSInteger)CollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataMArr.count;
}

-(UICollectionViewCell *)ParCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *collectionCellID = @"myCollectionCell";
    WorkMsgCell *cell = (WorkMsgCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    //NSDictionary *dic    = self.dataMArr[indexPath.row];
    NSString * workID = [NSString stringWithFormat:@"%@",_dataMArr[indexPath.row]];
    cell.workID.text =workID;
    cell.workUser.text =@"aa";
    cell.endState.text =@"1" ;
    [cell.Operation setTitle:@"delete" forState:UIControlStateNormal];
    
    return cell;
};/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
