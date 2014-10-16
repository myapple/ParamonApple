//
//  ParMainViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-15.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParMainViewController.h"
#import "NSString+FontAwesome.h"
#import "UIBarButtonItem+Badge.h"
#import "AMSmoothAlertView.h"


#import "ICarouseViewController.h"
@interface ParMainViewController ()
@property (strong, nonatomic)AMSmoothAlertView * alert;
@property (strong, nonatomic)NSMutableArray* unNormalWork;

@end

@implementation ParMainViewController
@synthesize workDetailMsg;
@synthesize workText=_workText;
@synthesize alarmText=_alarmText;
@synthesize alarmDetailMsg;
@synthesize mShoworkMsg;
#pragma mark - set  popView
- (PopoverView *)getSetMangerPopview:(UIButton *)sender {
    
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
    return pop;
    
    
    
    
}

#pragma mark - get UnNormal Pop view
- (PopoverView *)getUnNormalPopview:(UIButton *)sender{
    
    [self getUnNormalWorkMsg];
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);
    
    NSMutableAttributedString *eMailAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconUser]];
    [eMailAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:8] range:NSMakeRange(0, 1)];
    //设置颜色
    [eMailAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    //动态创建
    
    NSString *item1 =[NSString stringWithFormat:@"%@ %d%@",eMailAttributedString.string,[_unNormalWork count],@" 作业任务消息"];
    
    NSMutableAttributedString *clockAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconQuestionSign]];
    [clockAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:8] range:NSMakeRange(0, 1)];
    //设置颜色
    [clockAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    NSMutableArray  *titles =[[NSMutableArray alloc]initWithCapacity:([_unNormalWork count]+1)];
    [titles addObject:item1];
    //动态创建
    for (NSArray *workmsg in _unNormalWork) {
        NSString *item2 =[NSString stringWithFormat:@"作业%@异常结束%@ %@",workmsg[0],clockAttributedString.string,workmsg[1]] ;

        [titles addObject:item2];
    }
   /* for (NSDictionary *workmsg in _unNormalWork) {
        NSString *item2 =[NSString stringWithFormat:@"作业%@异常结束\n%@ %@",[workmsg valueForKeyPath:@"userName"],clockAttributedString.string,@"xxx-xx-xx"] ;
        
        [titles addObject:item2];
    }
*/
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    return pop;
    
}

#pragma mark -get UnNormal end workMessage from Server
-(void)getUnNormalWorkMsg
{
    [_unNormalWork removeAllObjects];
    
    //获取异常作业结束数据
    if ([workDetailMsg.workData count]==0) {
        [self getMSGfromServer:WorkMSGApiPort forSize:nil andPage:nil];
    }
    
    for (NSArray *workmsg in workDetailMsg.workData) {
        int endstate=(int)workmsg[ENDSTATEIndex];
        if (endstate==ENDUnNorMalMark) {
            NSString* workID=workDetailMsg.workData[WORKIDIIndex];
            NSString* endTime=workDetailMsg.endTime;
            NSArray *msg =@[workID,endTime];
            [_unNormalWork addObject:msg];
            [_unNormalWork addObject:msg];
            
        }
        
    }

}
#pragma mark -get workMessage from Server
-(void) setWorkMessage
{
    [mShoworkMsg removeAllObjects];
    //获取异常作业结束数据
    if ([workDetailMsg.workData count]==0) {
        [self getMSGfromServer:WorkMSGApiPort forSize:nil andPage:nil];
    }
    for (NSArray *workmsg in workDetailMsg.workData) {
        NSString* workID=workDetailMsg.workData[WORKIDIIndex];
        int endstate=(int)workmsg[ENDSTATEIndex];
        NSString* workUser=workDetailMsg.workData[WORKUSERIndex];
        NSArray *msg =@[workID,workUser,@(endstate)];
        [mShoworkMsg addObject:msg];
        [mShoworkMsg addObject:msg];
    }

}


-(void)showUpdatePwdView:(id) sender
{
    [self performSegueWithIdentifier:@"UpdatePwdView" sender:sender];
}

-(void)showMessageBox:(NSString*) title andText:text andCancel:(BOOL)isHave
{
    if (!_alert || !_alert.isDisplayed) {
     _alert = [[AMSmoothAlertView alloc]initDropAlertWithTitle:title andText:text andCancelButton:isHave forAlertType:AlertInfo];
     [_alert setTitleFont:[UIFont fontWithName:@"Verdana" size:25.0f]];
     
     _alert.cornerRadius = 3.0f;
     [_alert show];
     }else{
     [_alert dismissAlertView];
     }

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
#pragma mark -init Ctrl
- (void)initCtrl:(UIViewController *) mViewController andTitle: (UIButton *)_btnTitle andAlarmNum:_btnAlarmNum andAlarm:(UIButton *)_btnAlarm  andWorkMsg:(UIButton *)_btnWorkMsg  andSetUser:(UIButton *)_btnSetUser
{
    //设置title的背景图片
    /*UIImage*img =[UIImage imageNamed:@"tableTitile_green"];
     [_mTitleView setBackgroundColor:[UIColor colorWithPatternImage:img]];*/
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
    
    [mViewController.view.layer addSublayer:backLayer];
    [mViewController.view addSubview:_alarmText];
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
    
    [mViewController.view.layer addSublayer:workLayer];
    [mViewController.view addSubview:_workText];
    
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
    
    [mViewController.view addSubview:barLeft];
    
    UIButton* barRight =[UIButton buttonWithType:UIButtonTypeSystem];
    //int width =self.view.frame.size.width-barLeft.frame.size.width-_btnAlarm.frame.size.width-_btnSetUser.frame.size.width-_btnWorkMsg.frame.size.width;
    [barRight setFrame:CGRectMake(_btnSetUser.frame.origin.x+_btnSetUser.frame.size.width,_btnSetUser.frame.origin.y,barLeft.frame.size.width,_btnAlarm.frame.size.height)];
    [barRight setBackgroundColor:[UIColor colorWithRed:48/255.0 green:105/255.0 blue:140/255.0 alpha:1.0]];
    
    [mViewController.view addSubview:barRight];
    
    
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
    [self getAlarmMsg];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"🔔告警信息"];
    int row = indexPath.row;
    if(row == 0){
        cell.textLabel.text =alarmDetailMsg[0];
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }else if (row == 1){
        cell.textLabel.text = alarmDetailMsg[1];
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }else if (row == 2){
        cell.textLabel.text = alarmDetailMsg[2];
        cell.imageView.image = [UIImage imageNamed:@"msgTip"];
    }else if (row == 3){
        cell.textLabel.text =alarmDetailMsg[3];
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
    return AlARMMSG_SHOWNUM;
}

#pragma mark - getAlarmMsgFromServer
-(void)getAlarmMsg
{
    [alarmDetailMsg removeAllObjects];
    
    //获取告警数据
    //..........
    //[self getMSGfromServer:AlarmMSGApiPort forSize:nil andPage:nil];
    
    //.......
    //Test Data
    NSString *alarmMsg =@"告警信息";
    [alarmDetailMsg addObject:alarmMsg];
    [alarmDetailMsg addObject:alarmMsg];
    [alarmDetailMsg addObject:alarmMsg];
    [alarmDetailMsg addObject:alarmMsg];
    
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


- (void)getMSGfromServer:(NSString *) mPort forSize: (NSString *)pageSize andPage:(NSString *)page
{
    //创建实例对象
    if (g_userKey==nil) {
        NSLog(@"%@g_userKey=",g_userKey);
        return;
    }
    NSDictionary *dictWork =@{@"userKey":g_userKey,@"size":pageSize,@"no":page};
    [[AFTwitterAPIClient sharedClient] postPath:mPort parameters:dictWork success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         if (JSON==nil) {
             NSLog(@"请求成功,无返回数据");
             [self showMessageBox:@"消息" andText:@"获取作业信息失败" andCancel:FALSE];
             return ;
         }
         id myRequest = [NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingMutableContainers error:nil];
         if ([myRequest isKindOfClass:[NSDictionary class]]){
             NSDictionary *dict = (NSDictionary *)myRequest;
             //将数据封装到 ParWorkData 类里面
             [workDetailMsg setAllMsgValue:dict];
             NSLog(@"获取%@端口数据：%@",mPort,dict);
         
         }
         
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化各个数组
    alarmDetailMsg =[[NSMutableArray alloc] init ];
    _unNormalWork =[[NSMutableArray alloc] init ];
    workDetailMsg =[[ParWorkData alloc] init];
    mShoworkMsg=[[NSMutableArray alloc] init ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
