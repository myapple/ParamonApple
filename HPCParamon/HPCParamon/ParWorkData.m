//
//  ParWorkData.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-22.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParWorkData.h"

@implementation ParWorkData
@synthesize hasNext;
@synthesize hasPre ;
@synthesize prePage;
@synthesize nextPage;
@synthesize totalCount;
@synthesize totalPage;
@synthesize workData;
@synthesize updateTime;
-(void)setAllMsgValue:(NSDictionary *) dataSource{
    if (![dataSource count]) {
        return;
    }
   /* hasNext = (BOOL)dataSource[@"json"][@"hasNext"];
    hasPre  = (BOOL) dataSource[@"json"][@"hasPre"];
    prePage = (int )dataSource[@"json"][@"prePage"];
    nextPage= (int )dataSource[@"json"][@"nextPage"];
    totalPage =  (int )dataSource[@"json"][@"totalPages"];
    totalCount=  (int )dataSource[@"json"][@"totalCount"];
    //workData =[NSMutableArray  arrayWithObject:dataSource[@"json"][@"result"]];
    //updateTime=dataSource[@"entityByRequest"][@"updateDatetime"];
    */
    NSDictionary* firstData = dataSource[@"json"];
    [self setJsonDic:firstData];
    
    [self setupdateDatetime:dataSource[@"entityByRequest"]];
    
    
}
-(void)setJsonDic:(NSDictionary *) dataJson
{
    if (![dataJson count]) {
        return;
    }
    hasNext = (BOOL)dataJson[@"hasNext"];
    hasPre  = (BOOL)dataJson[@"hasPre"];
    prePage = (int )dataJson[@"prePage"];
    nextPage= (int )dataJson[@"nextPage"];
    totalPage =(int )dataJson[@"totalPages"];
    totalCount= (int )dataJson[@"totalCount"];
    workData =[NSMutableArray  arrayWithObject:dataJson[@"result"]];
}
-(void) setupdateDatetime:(NSDictionary *) dataJson
{
    if (![dataJson count]) {
        return;
    }
     updateTime=dataJson[@"updateDatetime"];
}
-(int )print
{
    NSLog(@"111");
    return 1;
}

-(id)init
{
    if (self = [super init]) {
        workData = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void) addData
{
    [workData removeAllObjects];
    for (int i=0; i<25; i++) {
        [workData addObject:@{
                              @"workid" :@(i),
                              @"workName":@"Sample name",
                              @"state":@"sample state",
                              @"oper" :@"delete "
                              }
         ];
    }
    
}
@end
