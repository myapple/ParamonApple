//
//  ParWorkMSGViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-14.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParWorkMSGViewController.h"
#import "NSString+FontAwesome.h"
#import "UIBarButtonItem+Badge.h"
#import "AMSmoothAlertView.h"
#import "PopoverView.h"

#import "ICarouseViewController.h"
@interface ParWorkMSGViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnSetUser;
@property (weak, nonatomic) IBOutlet UIButton *btnAlarm;
@property (weak, nonatomic) IBOutlet UIButton *btnWorkMsg;
@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnAlarmNum;
@property (strong, nonatomic) IBOutlet ParWorkView *workView;




@property (strong, nonatomic)AMSmoothAlertView * alert;
@property (nonatomic, retain) NSMutableArray *rowsArray;
@property (nonatomic, retain) NSMutableArray *rowsManageUserArray;
@end

@implementation ParWorkMSGViewController
@synthesize workDetailData;

-(void) initManageUserViews
{
    /*NSInteger y =_btnAlarm.frame.origin.y+50;
    CGRect rect =CGRectMake(self.view.frame.size.width/2, y, self.view.frame.size.width/2, self.view.frame.size.height -y-20) ;
    self.mTableWorkMsg.frame = rect;
   // [self.view  reload];
    */
    NSArray *cols = @[@"作业用户",@"操作"];
    NSArray *weights = @[@(0.25f),@(0.25f)];
    NSDictionary *options = @{kASF_OPTION_CELL_TEXT_FONT_SIZE : @(12),
                              kASF_OPTION_CELL_TEXT_FONT_BOLD : @(true),
                              kASF_OPTION_CELL_BORDER_COLOR : [UIColor lightGrayColor],
                              kASF_OPTION_CELL_BORDER_SIZE : @(2.0),
                              kASF_OPTION_BACKGROUND : [UIColor colorWithRed:230/255.0 green:244/255.0 blue:254/255.0 alpha:1.0]};
    
    [_mTableWorkMsg setDelegate:self];
    [_mTableWorkMsg setBounces:NO];
    [_mTableWorkMsg setSelectionColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0f]];
    [_mTableWorkMsg setTitles:cols
                  WithWeights:weights
                  WithOptions:options
                    WitHeight:32 Floating:YES];
    
    [_rowsArray removeAllObjects];
    for (int i=0; i<25; i++) {
        [_rowsArray addObject:@{
                                kASF_ROW_ID :
                                    @(i),
                                
                                kASF_ROW_CELLS :
                                    @[@{kASF_CELL_TITLE : @"Sample ID", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentCenter)},
                                      @{kASF_CELL_TITLE : @"Sample Name", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentLeft)},
                                     ],
                                
                                kASF_ROW_OPTIONS :
                                    @{kASF_OPTION_BACKGROUND : [UIColor whiteColor],
                                      kASF_OPTION_CELL_PADDING : @(5),
                                      kASF_OPTION_CELL_BORDER_COLOR : [UIColor lightGrayColor]},
                                
                                @"some_other_data" : @(123)}];
    }
    
    [_mTableWorkMsg setRows:_rowsArray];
    
}
-(void) initWorkViews
{
    NSArray *cols = @[@"作业号",@"作业用户",@"结束状态",@"操作"];
    NSArray *weights = @[@(0.25f),@(0.25f),@(0.25f),@(0.25f)];
    NSDictionary *options = @{kASF_OPTION_CELL_TEXT_FONT_SIZE : @(12),
                              kASF_OPTION_CELL_TEXT_FONT_BOLD : @(true),
                              kASF_OPTION_CELL_BORDER_COLOR : [UIColor lightGrayColor],
                              kASF_OPTION_CELL_BORDER_SIZE : @(2.0),
                              kASF_OPTION_BACKGROUND : [UIColor colorWithRed:230/255.0 green:244/255.0 blue:254/255.0 alpha:1.0]};
    
    [_mTableWorkMsg setDelegate:self];
    [_mTableWorkMsg setBounces:NO];
    [_mTableWorkMsg setSelectionColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0f]];
    [_mTableWorkMsg setTitles:cols
                  WithWeights:weights
                  WithOptions:options
                    WitHeight:32 Floating:YES];
    
    [_rowsArray removeAllObjects];
    for (int i=0; i<25; i++) {
        [_rowsArray addObject:@{
                                kASF_ROW_ID :
                                    @(i),
                                
                                kASF_ROW_CELLS :
                                    @[@{kASF_CELL_TITLE : @"Sample ID", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentCenter)},
                                      @{kASF_CELL_TITLE : @"Sample Name", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentLeft)},
                                      @{kASF_CELL_TITLE : @"Sample Phone No.", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentCenter)},
                                      @{kASF_CELL_TITLE : @"Sample Gender", kASF_OPTION_CELL_TEXT_ALIGNMENT : @(NSTextAlignmentCenter)}],
                                
                                kASF_ROW_OPTIONS :
                                    @{kASF_OPTION_BACKGROUND : [UIColor whiteColor],
                                      kASF_OPTION_CELL_PADDING : @(5),
                                      kASF_OPTION_CELL_BORDER_COLOR : [UIColor lightGrayColor]},
                                
                                @"some_other_data" : @(123)}];
    }
    
    [_mTableWorkMsg setRows:_rowsArray];

}

#pragma mark - ASFTableViewDelegate
- (void)ASFTableView:(ASFTableView *)tableView DidSelectRow:(NSDictionary *)rowDict WithRowIndex:(NSUInteger)rowIndex {
    NSLog(@"%d == %d ", rowIndex,_mTableWorkMsg.selectedRowIndex);
    NSLog(@"%@", rowDict);
}
- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        _rowsArray = [[NSMutableArray alloc] init];
    }
    return self;
}
- (IBAction)showSetMangerView:(UIButton *)sender {
   
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);

    NSMutableAttributedString *userAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconUser]];
    [userAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:8] range:NSMakeRange(0, 1)];
    //设置颜色
    [userAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    //动态创建

    NSString *item1 =[NSString stringWithFormat:@"%@ %@",userAttributedString.string,@" 修改密码"] ;
    
    
    NSString *item2 =[NSString stringWithFormat:@"%@ %@",userAttributedString.string,@" 修改作业系统用户信息"];

    NSMutableAttributedString *helpAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconQuestionSign]];
    [helpAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:8] range:NSMakeRange(0, 1)];
    //设置颜色
    [helpAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    //动态创建
    
    NSString *item3 =[NSString stringWithFormat:@"%@ %@",helpAttributedString.string,@" 帮助"] ;
    
    NSMutableAttributedString *quitAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconOff]];
    [quitAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:8] range:NSMakeRange(0, 1)];
    //设置颜色
    [quitAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    //动态创建
    
    NSString *item4 =[NSString stringWithFormat:@"%@ %@",quitAttributedString.string,@" 退出"] ;
   

    NSArray *titles = @[item1,item2,item3,item4];//, @"选项2", @"选项3"];
    
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%d", index);
        switch (index) {
            case 0:
                NSLog(@"修改 密码");
                [self showUpdatePwdView:sender];
                /*if (!_alert || !_alert.isDisplayed) {
                    _alert = [[AMSmoothAlertView alloc]initDropAlertWithTitle:@"修改用户密码" andText:@"新密码\n\n重复新密码!\n\n" andCancelButton:YES forAlertType:AlertInfo];
                    [_alert setTitleFont:[UIFont fontWithName:@"Verdana" size:25.0f]];
                    
                    _alert.cornerRadius = 3.0f;
                    [_alert show];
                }else{
                    [_alert dismissAlertView];
                }*/
                

            
                break;
            case 1:
                NSLog(@"修改作业用户系统信息");
                break;
            case 2:
                NSLog(@"帮助");
                break;
            case 3:
                NSLog(@"退出");
            default:
                break;
        }
    };
    [pop show];
    
   

}
-(void)showUpdatePwdView:(id) sender
{
    [self performSegueWithIdentifier:@"UpdatePwdView" sender:sender];
    // UIStoryboard* theStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //ParUpdatePwdViewController* destView = [theStoryBroad instantiateViewControllerWithIdentifier:@"UpdatePwdView"];
    //ParUpdatePwdViewController *destView =[[ParUpdatePwdViewController alloc] init];
	//[self.navigationController pushViewController:destView animated: YES];
    
    //[self showUpdatePwdView];
    /*ViewController *leftController = [theStoryBroad instantiateViewControllerWithIdentifier:@"UpdatePwdView"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:leftController];     //[destView show];
    
    ParUpdatePwdViewController *leftController = [theStoryBroad instantiateViewControllerWithIdentifier:@"UpdatePwdView"];
     */
}

- (IBAction)loadWorkMsg:(id)sender {
    
   /* UIStoryboard* theStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ParWorkMSGViewController* destView = [theStoryBroad instantiateViewControllerWithIdentifier:@"WorkMsgView"];
    
	[self.navigationController pushViewController:destView animated: YES];
    */
  //  [self performSegueWithIdentifier:@"WorkMsgView" sender:sender];
    
}
- (IBAction)showAlarmMsgView:(id)sender {
    static int num=1;
    [self addAlarmText:(++num)];
    /*if (!_alert || !_alert.isDisplayed) {
        _alert = [[AMSmoothAlertView alloc]initDropAlertWithTitle:@"Notice !" andText:@"告警信息1\n告警信息2\n告警信息3\n 告警信息3 \n  是否查看更多？!" andCancelButton:YES forAlertType:AlertInfo];
        [_alert setTitleFont:[UIFont fontWithName:@"Verdana" size:25.0f]];
        
        _alert.cornerRadius = 3.0f;
        [_alert show];
    }else{
        [_alert dismissAlertView];
    }*/
    [self popClickAction:sender];
    
    
}

#pragma mark - Delegates
- (void)alertView:(AMSmoothAlertView *)alertView didDismissWithButton:(UIButton *)button {
	if (alertView == _alert) {
		if (button == _alert.defaultButton) {
			NSLog(@"Default button touched!");
		}
		if (button == _alert.cancelButton) {
			NSLog(@"Cancel button touched!");
		}
	}

}
- (void)initCtrl
{
    //
    NSMutableAttributedString *btnTitleAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconAlignJustify]];
    [btnTitleAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    
    [btnTitleAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 1)];
    [_btnTitle setTitle:btnTitleAttributedString.string forState:UIControlStateNormal];
    [_btnTitle setAttributedTitle:btnTitleAttributedString forState:UIControlStateNormal];
    //告警按钮
    NSMutableAttributedString *btnAlarmAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconBell]];
    [btnAlarmAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    //数字按钮
    
    
    //设置按钮的  形状
    _btnAlarmNum= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /*
     buttonWithType:  定义button按钮的外形
     六种定义button类型： 下面有图解
     UIButtonTypeCustom = 0,    无类型
     UIButtonTypeRoundedRect,    四个角是圆弧   型的
     UIButtonTypeDetailDisclosure,
     UIButtonTypeInfoLight,
     UIButtonTypeInfoDark,
     UIButtonTypeContactAdd,
     */
     CALayer *backLayer = [CALayer layer];
    
    backLayer.backgroundColor = [UIColor orangeColor].CGColor;
    backLayer.bounds = CGRectMake(10, 10, 20, 20); //设置layer的区域
    backLayer.position = CGPointMake(_btnAlarm.frame.origin.x+_btnAlarm.frame.size.width-CGRectGetHeight(backLayer.frame)+5 , _btnAlarm.frame.origin.y+CGRectGetHeight(backLayer.frame) ); //设置layer坐标
    [backLayer setCornerRadius:CGRectGetHeight(backLayer.frame) / 2]; //矩形椭圆角的弧度半径
    
    _alarmText=[[UIButton alloc] init];
    [_alarmText setFrame:backLayer.frame];
    [_alarmText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_alarmText setFont:[UIFont fontWithName:@"American Typewriter" size:10]];
    [_alarmText setTitle:@"+41" forState:UIControlStateNormal];
    backLayer.contents = (id)_alarmText;
    
    [self.view.layer addSublayer:backLayer];
    [self.view addSubview:_alarmText];
    //定义button按钮在frame上的坐标（位置），和这个按钮的宽／高
    
    
    
    [btnAlarmAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 1)];
    [_btnAlarm setTitle:btnAlarmAttributedString.string forState:UIControlStateNormal];
    [_btnAlarm setAttributedTitle:btnAlarmAttributedString forState:UIControlStateNormal];
    

    //作业信息
    
    NSMutableAttributedString *btnWorkAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconEnvelope]];
    [btnWorkAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    //设置颜色
    //[btnWorkAttributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 1)];
    [btnWorkAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 1)];
    [_btnWorkMsg setTitle:btnWorkAttributedString.string forState:UIControlStateNormal];
    [_btnWorkMsg setAttributedTitle:btnWorkAttributedString forState:UIControlStateNormal];

    CALayer *workLayer = [CALayer layer];
    
    workLayer.backgroundColor = [UIColor orangeColor].CGColor;
    workLayer.bounds = CGRectMake(10, 10, 20, 20); //设置layer的区域
    workLayer.position = CGPointMake(_btnWorkMsg.frame.origin.x+_btnWorkMsg.frame.size.width-CGRectGetHeight(workLayer.frame)+5 , _btnWorkMsg.frame.origin.y+CGRectGetHeight(workLayer.frame)); //设置layer坐标
    [workLayer setCornerRadius:CGRectGetHeight(workLayer.frame)/2];
                                               
    _workText=[[UIButton alloc] init];
    [_workText setFrame:workLayer.frame];
    [_workText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_workText setFont:[UIFont fontWithName:@"American Typewriter" size:10]];
    [_workText setTitle:@"+1" forState:UIControlStateNormal];
    workLayer.contents = (id)_workText;
    
    [self.view.layer addSublayer:workLayer];
    [self.view addSubview:_workText];

    //设置按钮
    NSMutableAttributedString *btnSetAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconCog]];
    [btnSetAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    //设置颜色
    //[btnSetAttributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 1)];
    [btnSetAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 1)];
    [_btnSetUser setTitle:btnSetAttributedString.string forState:UIControlStateNormal];
    [_btnSetUser setAttributedTitle:btnSetAttributedString forState:UIControlStateNormal];
    
    //动态创建

    UIButton* barLeft =[UIButton buttonWithType:UIButtonTypeSystem];

    [barLeft setFrame:CGRectMake(0,_btnAlarm.frame.origin.y,_btnAlarm.frame.origin.x,_btnAlarm.frame.size.height)];
    [barLeft setBackgroundColor:[UIColor colorWithRed:48/255.0 green:105/255.0 blue:140/255.0 alpha:1.0]];
    
    [self.view addSubview:barLeft];
    
    UIButton* barRight =[UIButton buttonWithType:UIButtonTypeSystem];
    //int width =self.view.frame.size.width-barLeft.frame.size.width-_btnAlarm.frame.size.width-_btnSetUser.frame.size.width-_btnWorkMsg.frame.size.width;
    [barRight setFrame:CGRectMake(_btnSetUser.frame.origin.x+_btnSetUser.frame.size.width,_btnSetUser.frame.origin.y,barLeft.frame.size.width,_btnAlarm.frame.size.height)];
    [barRight setBackgroundColor:[UIColor colorWithRed:48/255.0 green:105/255.0 blue:140/255.0 alpha:1.0]];
    
    [self.view addSubview:barRight];


}
#pragma Alarm 相关的设置
- (void)addAlarmText:(int) msgNum
{
    NSString * strNum=[NSString stringWithFormat:@"+%d",msgNum];
    [_alarmText setTitle:strNum forState:UIControlStateNormal];
}

- (void)popClickAction:(id)sender
{
    CGFloat xWidth = self.view.bounds.size.width - 20.0f;
    CGFloat yHeight =280.0f;
    CGFloat yOffset = (self.view.bounds.size.height - yHeight)/2.0f;//_btnAlarm.frame.origin.y;//+_btnAlarm.frame.size.height+2;
    //(self.view.bounds.size.height - yHeight)/2.0f;
    UIPopoverListView *poplistview = [[UIPopoverListView alloc] initWithFrame:CGRectMake(10, yOffset, xWidth, yHeight)];
    poplistview.delegate = self;
    poplistview.datasource = self;
    poplistview.listView.scrollEnabled = FALSE;
    [poplistview setTitle:@"🔔告警信息"];
    [poplistview show];
}

#pragma mark - UIPopoverListViewDataSource

- (UITableViewCell *)popoverListView:(UIPopoverListView *)popoverListView
                    cellForIndexPath:(NSIndexPath *)indexPath
{
   // static NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"🔔告警信息"];
    int row = indexPath.row;
    if(row == 0){
        cell.textLabel.text = @"告警信息1";
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }else if (row == 1){
        cell.textLabel.text = @"告警信息2";
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }else if (row == 2){
        cell.textLabel.text = @"告警信息3";
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }else if (row == 3){
        cell.textLabel.text = @"告警信息4";
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }
    else  {
        [cell.textLabel setBackgroundColor:[UIColor blueColor]];
        cell.textAlignment = UITextAlignmentCenter;
        cell.textColor =[UIColor blueColor];
        
        cell.textLabel.text = @"查看所有未读告警信息➡";
       // cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }
    
    return cell;
}

- (NSInteger)popoverListView:(UIPopoverListView *)popoverListView
       numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

#pragma mark - UIPopoverListViewDelegate
- (void)popoverListView:(UIPopoverListView *)popoverListView
     didSelectIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s : %d", __func__, indexPath.row);
    if (indexPath.row==4) {
        // 跳转告警信息 页面
        
        
    }
    
}

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView
   heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)getWorkMSGformServer:(NSString *)pageSize andPage:(NSString *)page
{
    //创建实例对象
    if (g_userKey==nil) {
       NSLog(@"%@g_userKey=",g_userKey);
        return;
    }
   
    NSDictionary *dictWork =@{@"userKey":g_userKey,@"size":pageSize,@"no":page};
   
    [[AFTwitterAPIClient sharedClient] postPath:g_getWorkMSGPort parameters:dictWork success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         
         
         NSDictionary* dict =(NSDictionary* )JSON;
        
         _workDetailMsg =dict;
         
         [workDetailData setAllMsgValue:dict];
        
         NSLog(@"%d",[workDetailData print]);
         //[_workDetailData setAllMsgValue:dict];
         NSString * updatetime=_workDetailMsg[@"entityByRequest"][@"updateDatetime"];
         NSLog(@"updatetime :%@",updatetime);
         
         
                  
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
#if __IPHONE_OS_VERSION_MIN_REQUIRED
         [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
#else
         [[NSAlert alertWithMessageText:NSLocalizedString(@"Error", nil) defaultButton:NSLocalizedString(@"OK", nil) alternateButton:nilotherButton:nil informativeTextWithFormat:[error localizedDescription]] runModal];
#endif
         return;
     }];

}
- (void)viewDidLoad
{
    /*UITableView *tv=[[UITableView alloc]initWithFrame:CGRectMake(0,44, 320, 416) style:UITableViewStylePlain];
    self.mTableManageUser = tv;
    
    [_mTableManageUser setDelegate:self];
    [_mTableManageUser setDataSource:self];
    [self.view addSubview:_mTableManageUser];
    */    
    workDetailData=[[ParWorkData alloc ] init];
    NSLog(@"%d",[workDetailData print]);
    [self getWorkMSGformServer:@"10" andPage:@"1"];
    //[self sendMsgToServer:g_getWorkMSGPort andParameters:dictCheck];
    NSLog(@"updateTime :%@" ,[workDetailData updateTime] );
    
    [self initCtrl];
    if (g_workSystemUser) {
        [self initWorkViews];
    }
    else
    {
        [self initManageUserViews];
    }
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
