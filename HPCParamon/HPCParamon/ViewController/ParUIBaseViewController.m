//
//  ParUIBaseViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-9.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParUIBaseViewController.h"
#import "NSString+FontAwesome.h"
@interface ParUIBaseViewController ()

@end

@implementation ParUIBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)initCtrl
{
    //
    NSMutableAttributedString *btnTitleAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconAlignJustify]];
    [btnTitleAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    
    [btnTitleAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 1)];
    [_btnTitle initWithFrame:CGRectMake(0,0 , 20,self.view.frame.size.width)];
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
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initCtrl];
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
