//
//  WorkMsgCell.h
//  HPCParamon
//
//  Created by 张小静  on 14-10-13.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkMsgCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *workID;
@property (weak, nonatomic) IBOutlet UILabel *workUser;
@property (weak, nonatomic) IBOutlet UILabel *endState;
@property (weak, nonatomic) IBOutlet UIButton *Operation;

@end
