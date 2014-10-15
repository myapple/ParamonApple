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
//  TestDataShowBoard.m
//  Company
//
//  Created by azayyl on 13-7-16.
//    Copyright (c) 2013年 azayyl. All rights reserved.
//

#import "TestDataShowBoard.h"
#import "TestDataShowMode.h"


#import "Bee_Runtime.h"

#pragma mark -

@implementation TestDataShowBoard


- (void)load
{
	[super load];
    //申请新容器
	_datas = [[NSMutableArray alloc] init];
    
    //设置需要显示的列名、显示的列
    if (!_colNameList) {
        _colNameList=[[NSMutableArray alloc] init];
        [_colNameList addObject:@{@"testname":@"姓名"}];
        [_colNameList addObject:@{@"testsex":@"性别"}];
        [_colNameList addObject:@{@"testage":@"年龄"}];
        [_colNameList addObject:@{@"testtel":@"电话"}];
        [_colNameList addObject:@{@"testaddress":@"地址"}];
    }
    
    serverlist=[[NSMutableArray alloc] init];
    int i =0;
    for (; ;) {
        
        //“_hide”后缀不需要创建列宽字段  如：testid_hide  新建字段为：testid
        //其他字段需建立列宽 如：testname 新建字段为：testname   testnamewidth
        //请参照estDataShowMode.h
        [serverlist addObject:
         @{@"testid_hide":[NSString stringWithFormat:@"%d",1000+i]
         ,@"testname": [NSString stringWithFormat:@"小米%d",i]
         ,@"testsex":@"男",@"testage":@100
         ,@"testtel":@"15601877506"
         ,@"testaddress":@"地球村世界上的某个地方，test信息"}];
        
        i++;
        NSLog(@"%d",serverlist.count);
        if (serverlist.count>20) {
            
            
            [serverlist addObject:
             @{@"testid_hide":[NSString stringWithFormat:@"%d",1001+i]
             ,@"testname": [NSString stringWithFormat:@"小米%d",i+1]
             ,@"testsex":@"女",@"testage":@100
             ,@"testtel":@"15601877506"
             ,@"testaddress":@"悠长的历史之中,人类曾一度因被巨人捕食而崩溃.幸存下来的人们建造了一面巨大的墙壁,防止了巨人的入侵.不过,作为\"和平\"的代价,人类失去了到墙壁的外面去这一\"自由\"主人公艾伦·耶格尔对还没见过的外面的世界抱有兴趣.在他正做着到墙壁的外面去这个梦的时候,毁坏墙壁的大巨人出现了!"}];
            [serverlist addObject:
             @{@"testid_hide":[NSString stringWithFormat:@"%d",1002+i]
             ,@"testname": [NSString stringWithFormat:@"小米%d",i+2]
             ,@"testsex":@"女",@"testage":@100
             ,@"testtel":@"1560187750615601877506156018775061560187750615601877506"
             ,@"testaddress":@"地球村世界上的某个地方，test信息"}];
            //
            break;
        }
    }
    
    
    
    //解析宽度
    NSEnumerator *enumerator = [serverlist reverseObjectEnumerator];
    
    id object;
    CGSize labelStrSize;  //单列数据的宽高
    float allWidth = 0.0;//总宽度
    NSString *tempname;
    NSString *tempval;
    unsigned int showcount=0;
    if ( [BeeDatabase openSharedDatabase:@"TestData.db"] )
	{
		TestDataShowMode.DB.EMPTY();
    }
    while (object = [enumerator nextObject]) {
        allWidth = 0.0;
        showcount=0;
        BeeDatabase *data=TestDataShowMode.DB;
        for(id key in object)
        {
            NSLog(@"%@",key);
            tempname= [key stringByReplacingOccurrencesOfString:@"_hide" withString:@""] ;//列名
            tempval=[NSString stringWithFormat:@"%@", [object objectForKey:key] ] ;//内容
            
            
            //默认设置最大宽度300  高度80
            labelStrSize= [ tempval sizeWithFont:[UIFont systemFontOfSize:16.0] constrainedToSize:CGSizeMake(500, _table.rowHeight) lineBreakMode:UILineBreakModeWordWrap];
            
            data.SET( tempname, [tempval copy] );//添加数据
            
            NSRange  nr=[key rangeOfString:@"hide"];//服务器端控制列：判断是否带后缀_hide  存在则计入列宽
            
            if (nr.location==NSNotFound) {
                
                if (labelStrSize.width<=60) {//设置最小宽度
                    labelStrSize.width=60;
                }
                allWidth+=labelStrSize.width;
                
                NSString *temp=[NSString stringWithFormat:
                                @"%@width",tempname];
                
                data.SET( temp, __INT(labelStrSize.width) );//添加单列的宽度
                
                ++showcount;
            }
            
        }
        //  NSLog(@"%d",showcount);
        data
        .SET(@"testcellwidth",[NSString stringWithFormat:@"%f",allWidth])
        .SET(@"testcellshow",[NSString stringWithFormat:@"%d",showcount])
        .INSERT();
        
    }
    
    //设置view的宽度
    CGRect viewRect=self.view.frame;
    viewRect.size.width= [self currentviewWidth];
    
    
    
    [self updateColumnWidth];
    [self currentviewWidth];
    [self createTableHeaderName];
    
    //把每列最大宽度取出来设置
    if ( 0 == _datas.count )
    {
        TestDataShowMode.DB.ORDER_DESC_BY(@"rid").GET();
        
        if ( TestDataShowMode.DB.succeed )
        {
            //       NSLog(@"%@",TestDataShowMode.DB.resultArray);
            [_datas addObjectsFromArray:TestDataShowMode.DB.resultArray];
            
        }
        //     NSLog(@"%@",_datas);
        //  [self asyncReloadData];
    }
    
    
}
//设置view的width
-(CGFloat)currentviewWidth{
    //    NSDictionary *dicNameHeight=    TestDataShowMode.DB.SELECT_MAX_ALIAS( @"testcellwidth",@"testcellwidth" ).firstRecord;
    //    NSString *testcellwidth=[NSString stringWithFormat:@"%@",[dicNameHeight valueForKey:@"testcellwidth"] ];
    //    CGFloat result=[testcellwidth floatValue];
    //    cellwidth=result;
    //    return result;
    CGFloat result= [self updateColumnWidth];
    cellwidth=result;
    return result;
}

//更新table每列最大的宽度
-(int)updateColumnWidth{
    
    NSString *colname=@"";
    NSString *colWidthName=@"";
    int addwidth=0;  //cellwidth  最大宽度
    for(int i = 0; i < [_colNameList count]; i++) {
        
        NSDictionary *namek_v=[_colNameList objectAtIndex:i];
        
        id keys = [namek_v allKeys];
        colname = [keys objectAtIndex: 0];  //表列名
        colWidthName=[NSString stringWithFormat:@"%@width",colname];
        
        NSString *colwidth= [self selectColMaxWidthByName:colWidthName];
        
        TestDataShowMode.DB.SET(colWidthName,colwidth).UPDATE();
        addwidth+=[colwidth intValue];
    }
    return addwidth;
}

//得到列宽
-(NSString*)selectColMaxWidthByName:(NSString *)colName{
    NSString *result=@"0";
    NSDictionary *tempDic= TestDataShowMode.DB.
    SELECT_MAX_ALIAS(colName,colName).firstRecord;
    
    NSString *tempWidth=[NSString stringWithFormat:@"%@",[tempDic valueForKey:colName] ];
    if (tempWidth) {
        result=tempWidth;
    }
    return result;
}

- (void)unload
{
	[_datas removeAllObjects];
	[_datas release];
    
    [_colNameList removeAllObjects];
    [_colNameList release];
    
    [serverlist removeAllObjects];
    [serverlist release];
	[super unload];
}


- (void)handleUISignal_BeeUIBoard:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
    
	if ( [signal is:BeeUIBoard.CREATE_VIEWS] )
	{
		[self setTitleString:@"Test"];
		[self showNavigationBarAnimated:NO];
        //NSLog(@"%f",CGRectGetWidth(self.view.frame));
        
        _scroll = [[UIScrollView alloc]init];
        _table=[[UITableView alloc] init];
        
        
        //_table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.delegate = self;
        _table.dataSource = self;
        //_table.rowHeight = 40;
        
        _table.showsVerticalScrollIndicator = YES;
        _table.showsHorizontalScrollIndicator = NO;
        _table.bounces = YES;
        _table.separatorColor =[UIColor grayColor];
        [_scroll addSubview:_table];
        
        [self.view addSubview:_scroll];
        
        _headView=[[UIView alloc] init];
        _headView.backgroundColor=[UIColor redColor];
        
        [_scroll addSubview:_headView];
        
        /*边框*/
        CALayer *layer = [_table layer];
        layer.borderColor = [[UIColor grayColor] CGColor];
        layer.borderWidth = 1;
        
        /* title阴影*/
        _headView.layer.shadowColor = [UIColor grayColor].CGColor;
        _headView.layer.shadowOpacity = 1.0;
        _headView.layer.shadowRadius = 5.0;
        _headView.layer.shadowOffset = CGSizeMake(0,5);
        
        
        
        
    }
	else if ( [signal is:BeeUIBoard.DELETE_VIEWS] )
	{
        SAFE_RELEASE_SUBVIEW(_scroll);
        SAFE_RELEASE_SUBVIEW(_table);
        SAFE_RELEASE_SUBVIEW(_headView);
	}
	else if ( [signal is:BeeUIBoard.LAYOUT_VIEWS] )
	{
        CGRect tableFrame=self.view.frame;
        CGRect scrollFrame=self.view.frame;
        
        
        tableFrame.size.width=cellwidth;
        tableFrame.size.height=self.viewSize.height-40;
        tableFrame.origin.y=40;
        
        _scroll.frame=scrollFrame;
        _table.frame=tableFrame;
        _scroll.contentSize=CGSizeMake(cellwidth, self.viewSize.height);
        
        _headView.frame=CGRectMake(0, 0, cellwidth, 40);
        
        
	}
    
}

#pragma mark -

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdetify = @"testcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    if (cell) {
        [[cell contentView] removeAllSubviews];
        [cell removeAllSubviews];
        cell=nil;
    }
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdetify];
        
        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
        cell.selectedBackgroundView.backgroundColor =
        [UIColor colorWithRed:214/255.0 green:229/255.0 blue:239/255.0 alpha:1];
        
        [self AddCell:indexPath forCell:cell];
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *selectCell=[_datas objectAtIndex:indexPath.row];
    NSString *testid=  [selectCell valueForKey:@"testid"];
    NSString *testname=  [selectCell valueForKey:@"testname"];
    
    NSString *msg=[NSString stringWithFormat:@"testid=%@,\n 名字:%@",testid,testname];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [alert release];
}



- (void)AddCell:(NSIndexPath *)indexPath forCell:(UITableViewCell *)cell
{
    NSDictionary *cellData=[_datas objectAtIndex:indexPath.row];
    
    NSString *tempval=@"";
    // cellwidth
    float x = 0; //x 坐标
    
    NSLog(@"%@",_colNameList);
    
    for(int i = 0; i < [_colNameList count]; i++) {
        NSString *titlename=@"";
        NSString *colname=@"";
        NSDictionary *namek_v=[_colNameList objectAtIndex:i];
        
        
        id keys = [namek_v allKeys];
        
        for (unsigned int i = 0; i < [keys count]; i++)
        {
            colname = [keys objectAtIndex: i];  //表列名
            titlename= [namek_v objectForKey: colname];//显示界面上的列名
        }
        
        
        tempval=[cellData valueForKey:colname];//值
        
        /*列宽px*/
        NSString *tempname=[NSString stringWithFormat:@"%@width",colname];
        NSString *tempwidth=[cellData valueForKey:tempname];
        
        @try {
            
            UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(x, 0, [tempwidth intValue], _table.rowHeight)] autorelease];
            
            label.contentMode = UIViewContentModeCenter;
            label.textAlignment = NSTextAlignmentCenter;
            label.text = tempval;
            label.textColor=[UIColor colorWithRed:96/255.0 green:97/255.0 blue:100/255.0 alpha:1];
            label.font = [UIFont systemFontOfSize:14.0];
            [[cell contentView] addSubview:label];
            
            //线
            UILabel *lineh=[[[UILabel alloc] init] autorelease];
            CGRect cg_lineh=label.frame;
            //cg_lineh.origin.x+=cg_lineh.size.width-1;
            cg_lineh.size.width=1;
            lineh.frame=cg_lineh;
            lineh.backgroundColor=[UIColor grayColor];
            [[cell contentView] addSubview:lineh];
            //            NSLog(@"%@--width",tempwidth);
            //            NSLog(@"%@--value",tempval);
            //            NSLog(@"%f--x",colWidth);
            if (tempwidth!=nil) {
                x+=[tempwidth floatValue];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"ERROR:%@", exception.name);
            
        }
    }
}

//创建Table头 列名
-(void)createTableHeaderName{
    
    NSString *showColName=@"";
    NSString *colname=@"";
    NSString *colWidthName=@"";
    
    CGFloat x=0;
    for(int i = 0; i < [_colNameList count]; i++) {
        
        NSDictionary *namek_v=[_colNameList objectAtIndex:i];
        
        id keys = [namek_v allKeys];
        colname = [keys objectAtIndex: 0];  //表列名
        showColName=[namek_v valueForKey:colname];//显示界面列名
        
        NSString *temp=[NSString stringWithFormat:@"%@",showColName];
        colWidthName=[NSString stringWithFormat:@"%@width",colname];
        
        NSString *colwidth= [self selectColMaxWidthByName:colWidthName];
        NSLog(@"%@--width",colwidth);
        
        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(x, 0, colwidth.floatValue ,40)] autorelease];
        label.backgroundColor=[UIColor clearColor];
        
        
        
        label.contentMode = UIViewContentModeCenter;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = temp;  //列名
        label.font = [UIFont systemFontOfSize:15.0];
        [_headView addSubview:label];
        
        
        //线
        UILabel *lineh=[[[UILabel alloc] init] autorelease];
        CGRect cg_lineh=label.frame;
        //cg_lineh.origin.x+=cg_lineh.size.width-1;
        cg_lineh.size.width=1;
        lineh.frame=cg_lineh;
        lineh.backgroundColor=[UIColor grayColor];
        [_headView addSubview:lineh];
        
        x+=colwidth.floatValue;
    }
    
    
    
    
}

@end
