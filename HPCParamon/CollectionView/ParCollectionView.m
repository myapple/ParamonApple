//
//  ParCollectionView.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-13.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParCollectionView.h"
#import "WorkMsgCell.h"
#import "NSString+FontAwesome.h"
@implementation ParCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // _dataMArr = [[NSMutableArray alloc ] init];
        // 获取数据
        //
        //Test Data
        NSInteger testID =0;
        testID++;
        
        [_dataMArr addObject:@(testID)];
        
    }
    return self;
}

-(void)setUpCollection:(NSMutableArray *)dataArr{
  //  self.dataMArr = NSMutableArray array];
    self.dataMArr = [NSMutableArray  arrayWithObject:dataArr];
    
       int testID =0;
    testID++;
    /*while (testID <=20) {
        [_dataMArr addObject:@(testID)];
    }
    */
    [_dataMArr addObject:@(testID++)];
    [_dataMArr addObject:@(testID++)];
    [_dataMArr addObject:@(testID++)];
    self.delegate = self;
    self.dataSource = self;
    
    
}


#pragma mark - Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataMArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *collectionCellID = @"WorkMsgCellID";
    WorkMsgCell *cell = (WorkMsgCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    //NSDictionary *dic    = self.dataMArr[indexPath.row];
    NSString * workID = [NSString stringWithFormat:@"%@",_dataMArr[indexPath.row]];
    cell.workID.text =workID;
    cell.workUser.text =@"aa";
    cell.endState.text =@"1" ;
    cell.Operation.tag=indexPath.row ;
    [self setDeletAttribuString:cell.Operation forColor:[UIColor redColor]];
    [self setworkStateAttribuString:cell.endState forState:TRUE];
        return cell;
}

-(void)setDeletAttribuString:(UIButton *)btnButton  forColor:(UIColor *)color
{
    NSMutableAttributedString *attribuString =[[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconTrash]];
    [attribuString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    
    [attribuString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, 1)];
    [btnButton setTitle:attribuString.string forState:UIControlStateNormal];
    [btnButton setAttributedTitle:attribuString forState:UIControlStateNormal];
}

-(void)setworkStateAttribuString:(UILabel *)label   forState:(BOOL) normal
{
    NSMutableAttributedString *attribuString =[[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconLightbulb]];
    [attribuString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    if (normal) {
        label.textColor=[UIColor greenColor];
    }
    else
        label.textColor=[UIColor redColor];
    label.font =[UIFont fontWithName:kFontAwesomeFamilyName size:20];
    
    label.text =attribuString.string;
    
}
#pragma mark -UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
