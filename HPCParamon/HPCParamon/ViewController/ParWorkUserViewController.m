//
//  ParWorkUserViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-15.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParWorkUserViewController.h"
#import "ParUserMsgCollectionView.h"
#import "AMSmoothAlertView.h"
#import "PopoverView.h"

@interface ParWorkUserViewController ()
@property (strong,nonatomic) NSDictionary* workDetailMsg;
@property (weak, nonatomic) IBOutlet UIButton *btnSetUser;
@property (weak, nonatomic) IBOutlet UIButton *btnAlarm;
@property (weak, nonatomic) IBOutlet UIButton *btnWorkMsg;
@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@property (weak, nonatomic) IBOutlet ParUserMsgCollectionView *mWorkCollectview;
@property (weak, nonatomic) IBOutlet UIView *mCollectionTitle;


@end

@implementation ParWorkUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark -buttonEvents
- (IBAction)showSetMangerView:(UIButton *)sender {
  
    PopoverView *pop = [super getSetMangerPopview:sender];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%d", index);
        switch (index) {
            case 0:
                NSLog(@"修改 密码");
                [self showUpdatePwdView:sender];
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

-(void)showUpdatePwdView:(id) sender{
    
    [self performSegueWithIdentifier:@"UpdatePwdView" sender:sender];
    
}

- (IBAction)showAlarmMsgView:(id)sender {
    static int num=1;
    [self addAlarmText:(++num)];
    [self popClickAction:sender];
    
    
}
#pragma Alarm 相关的设置
- (void)addAlarmText:(int) msgNum
{
    NSString * strNum=[NSString stringWithFormat:@"+%d",msgNum];
    [super.alarmText setTitle:strNum forState:UIControlStateNormal];
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



#pragma mark -initCtrl
- (void)initCtrl
{

    [super initCtrl:self
           andTitle:_btnTitle
           andAlarmNum :_btnAlarm
           andAlarm: _btnAlarm
           andWorkMsg: _btnWorkMsg
           andSetUser: _btnSetUser];
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCtrl];
    [self initCollectionView];
}

#pragma mark -collectionview
- (IBAction)deleteSelectRows:(id)sender {
    UIButton* mSender =(UIButton *)sender;
    NSLog(@"发送删除 %d 请求",mSender.tag);
    
    [self.mWorkCollectview.dataMArr removeObjectAtIndex:mSender.tag];
    [self.mWorkCollectview reloadData];
    if([self.mWorkCollectview.dataMArr count]==0)
    {
        _mCollectionTitle.hidden = YES;
    }
    


}

-(void)initCollectionView{
    //当rows 为0 时 删除标题
    [self.mWorkCollectview  setUpCollection];
    if([self.mWorkCollectview.dataMArr count]==0)
    {
        _mCollectionTitle.hidden = YES;
    }
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
