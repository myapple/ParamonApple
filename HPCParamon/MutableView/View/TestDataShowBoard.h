//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  TestDataShowBoard.h
//  Company
//
//  Created by azayyl on 13-7-16.
//    Copyright (c) 2013年 azayyl. All rights reserved.
//
#import "Bee.h"
#import "Bee_UITableBoard.h"

//@interface CellLayout1 : NSObject
//AS_SINGLETON(CellLayout1);
//@end
@interface testCell : BeeUIGridCell{
    BeeUILabel *_lbltestname;
    BeeUILabel *_lbltestsex;
    BeeUILabel *_lbltestage;
    BeeUILabel *_lbltesttel;
    BeeUILabel *_lbltestaddress;
    
}
@end
#pragma mark -

@interface TestDataShowBoard : BeeUIBoard<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_table;
    UIScrollView *_scroll;
    UIView *_headView;
    
    CGFloat cellwidth;
    
    NSMutableArray *serverlist;//获取数据
    NSMutableArray *	_datas;//转换可用数据
    NSMutableArray *_colNameList; //需要显示的数据
    
    
    
}

@end
