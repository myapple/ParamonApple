//
//  ParUpdatePwdViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-30.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParUpdatePwdViewController.h"
#import "Reachability.h"
#import "AMSmoothAlertView.h"
#import "Header.h"
@interface ParUpdatePwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwd;
@property (weak, nonatomic) IBOutlet UITextField *passwdAgain;
@property (weak, nonatomic) IBOutlet UILabel *labelError;
@property (weak, nonatomic) IBOutlet UILabel *labelErrorTip;
@property (strong, nonatomic)AMSmoothAlertView * alert;



@end

@implementation ParUpdatePwdViewController
@synthesize isNetNormal;

#pragma mark checkNet
-(BOOL) IsEnableWIFI {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

// 是否3G
-(BOOL) IsEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
    
}

- (BOOL) TestNetisConnect
{
    return [self IsEnableWIFI]||[self IsEnable3G];
}

#pragma mark CheckPasswd
-(BOOL) isSamePasswd
{
    NSString *pass = _passwd.text;
    NSString *pass2 = _passwdAgain.text;
    //BOOL isSame =[pass isEqualToString:pass2];
    /*if (isSame) {
        _labelError.text=@"";
    }
    else
    {
        _labelError.text =@"*";
    }*/
    return [pass isEqualToString:pass2];
    
}

- (IBAction)CheckPasswd:(id)sender {
   

    if (![self isSamePasswd]) {
       _labelError.text =@"*";
       _labelErrorTip.text =@"两次输入的密码不匹配";
    }
    else
    {
        _labelError.text=@"";
        _labelErrorTip.text=@"";
        
    }
    
    [_passwdAgain resignFirstResponder];
    [_passwd resignFirstResponder];
}

#pragma mark sendToServer
- (IBAction)sendServer:(id)sender {
    if (![self TestNetisConnect]) {
        NSLog(@"当前网络为未连接状态");
        [self showMessageBox:@"提醒" andText:@"当前网络为未连接状态" andCancel:FALSE];
        return ;
    }
    else
    {
        NSLog(@"网络为连接状态");
        //[self showMessageBox:@"提醒" andText:@"当前网络为连接状态" andCancel:FALSE];
    }
    if ([self isSamePasswd]) {
        NSLog(@"发送新的密码到 服务器");
        //.....
        [self sendNewPassword:sender];
    }
    
}

-(void)sendNewPassword:(id)sender
{
    NSString *userID =@"testID";
    //NSDictionary *dictPar=@{@"userKey":g_userKey ,@"id" :userID , @"password" :_passwd.text};
    NSDictionary *dictPar=@{@"id" :userID , @"password" :_passwd.text};
    [[AFTwitterAPIClient sharedClient] postPath:UpDatePassWordApiPort parameters:dictPar success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         NSLog(@"发送数据成功");
         if (JSON==nil) {
             NSLog(@"发送数据成功,无返回数据，修改失败");
             [self showMessageBox:@"消息" andText:@"修改密码失败" andCancel:FALSE];
             return ;
         }
         id myRequest = [NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingMutableContainers error:nil];
         if ([myRequest isKindOfClass:[NSDictionary class]]) {
             NSDictionary *dict = (NSDictionary *)myRequest;
             NSString* strRetValue =[dict valueForKeyPath:@"json"];
             if ([strRetValue isEqualToString:@"1"]) {
                 [self showMessageBox:@"消息" andText:@"修改密码失败" andCancel:FALSE];
             }
             else
             {
                 [self showMessageBox:@"消息" andText:@"修改密码成功" andCancel:FALSE];
                 g_userKey =strRetValue;
                 [self performSegueWithIdentifier:@"BackViewSegue" sender:sender];

             }
         }
         
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
#if __IPHONE_OS_VERSION_MIN_REQUIRED
         [self showMessageBox:@"Error" andText:@"服务器地址端口错误" andCancel:FALSE];
         NSLog(@"%@",[error localizedDescription]);

#else
         [self showMessageBox:@"消息" andText:@"修改密码失败" andCancel:FALSE];
         NSLog(@"%@",[error localizedDescription]);
     }

#endif
     }];  
   
}

- (IBAction)backMainView:(id)sender {
    [self performSegueWithIdentifier:@"BackViewSegue" sender:sender];
}

#pragma mark textFeild operation
-(IBAction)focusToPasswdAgainFeild:(id)sender {
    [_passwd resignFirstResponder];
    [_passwdAgain becomeFirstResponder];
}

- (IBAction)passwdAgainDidEnd:(id)sender {
    [_passwdAgain resignFirstResponder];
    [_passwd resignFirstResponder];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_passwdAgain resignFirstResponder];
    [_passwd resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    
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
