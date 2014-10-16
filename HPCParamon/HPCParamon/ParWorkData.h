//
//  ParWorkData.h
//  HPCParamon
//
//  Created by 张小静  on 14-9-22.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParWorkData : NSObject
@property (nonatomic) BOOL hasNext;
@property (nonatomic) BOOL hasPre ;
@property (strong ,nonatomic) NSMutableArray * workData;
@property (nonatomic) int  nextPage;
@property (nonatomic) int  prePage;
@property (nonatomic) int  totalCount;
@property (nonatomic) int  totalPage ;
@property (strong ,nonatomic) NSString * updateTime;
@property (strong ,nonatomic) NSString * endTime;
-(void)setAllMsgValue:(NSDictionary *) dataSource;
-(int )print;
@end
