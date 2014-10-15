//
//  ParUserMsgCollectionView.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-15.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParUserMsgCollectionView.h"
#import "NSString+FontAwesome.h"

#import "UserMsgCell.h"
@implementation ParUserMsgCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setUpCollection{
    self.dataMArr = [NSMutableArray array];
    int testID =0;
    testID++;
    
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
    
    static NSString *UserMsgCellID = @"UserMsgCellID";
    UserMsgCell *cell = (UserMsgCell *)[collectionView dequeueReusableCellWithReuseIdentifier:UserMsgCellID forIndexPath:indexPath];
    
    //NSDictionary *dic    = self.dataMArr[indexPath.row];
    NSString * workUser = [NSString stringWithFormat:@"%@",_dataMArr[indexPath.row]];
    cell.workUser.text =workUser;
    
    cell.Operation.tag=indexPath.row ;
    [self setDeletAttribuString:cell.Operation forColor:[UIColor redColor]];
     
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
