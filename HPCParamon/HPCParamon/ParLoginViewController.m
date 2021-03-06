//
//  ParLoginViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-16.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParLoginViewController.h"
#import "AFTwitterAPIClient.h"
#import "Header.h"
#import "UIBarButtonItem+Badge.h"
#import "NSString+FontAwesome.h"
#import "SSCheckBoxView.h"
@interface ParLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *button_2;
@property (nonatomic) _Block_H_ BOOL isRememberKey;
@property (nonatomic) BOOL isLockPasswd;
@property (weak,nonatomic) IBOutlet UIButton *barLock;

@end

@implementation ParLoginViewController


-(void) initCtrl{
    _isRememberKey=TRUE;
    SSCheckBoxView *cb2 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(_passWord.frame.origin.x,_passWord.frame.origin.y+50, 100, 30) style:3 checked:YES];
    [cb2 setText:@"记住密码"];
    [cb2 setStateChangedBlock:^(SSCheckBoxView *cbv) {
        NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
        _isRememberKey=cbv.checked;
    }];
    [self.view addSubview:cb2];
    
    NSMutableAttributedString *coffeeAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconCoffee]];
    [coffeeAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    [_coffeeIndictor setTitle:coffeeAttributedString.string forState:UIControlStateNormal];
    [_coffeeIndictor setAttributedTitle:coffeeAttributedString forState:UIControlStateNormal];
    //user 图标
    //设置属性
    NSMutableAttributedString *userAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconUser]];
    [userAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    //设置颜色
    [userAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    //动态创建
    UIButton *barUser =[UIButton buttonWithType:UIButtonTypeCustom];
    [barUser setFrame:CGRectMake(_userName.frame.origin.x+_userName.frame.size.width-32, _userName.frame.origin.y, 30, 30)];
    [barUser setTitle:userAttributedString.string forState:UIControlStateNormal];
    [barUser setAttributedTitle:userAttributedString forState:UIControlStateNormal];
    [self.view addSubview:barUser];
    
    // lock 图标
    NSMutableAttributedString *lockAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconLock]];
    [lockAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    [lockAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
   
    //_barLock =[UIButton buttonWithType:UIButtonTypeCustom];
   // [_barLock setFrame:CGRectMake(_passWord.frame.origin.x+_userName.frame.size.width-32, _passWord.frame.origin.y, 30, 30)];
    
    [_barLock setTitle:lockAttributedString.string forState:UIControlStateNormal];
    [_barLock setAttributedTitle:lockAttributedString forState:UIControlStateNormal];
    

    _isLockPasswd =TRUE;
    
   // [self.view addSubview:_barLock];

    NSString *loginTitle =[[NSString alloc] initWithFormat:@"%@ %@",[NSString fontAwesomeIconStringForEnum:FAIconKey],@"登录"];
    
    NSMutableAttributedString *loginbtnAttributedString = [[NSMutableAttributedString alloc] initWithString:loginTitle];
    
    [loginbtnAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    [loginbtnAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 4)];
    
    [_loginBtn setTitle:loginbtnAttributedString.string forState:UIControlStateNormal];
    [_loginBtn setAttributedTitle:loginbtnAttributedString forState:UIControlStateNormal];
    
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconStar]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    [_button_2 setTitle:attributedString.string forState:UIControlStateNormal];
    [_button_2 setAttributedTitle:attributedString forState:UIControlStateNormal];

    //_label_2.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-bell"];
    //_label_2.text = [NSString fontAwesomeIconStringForEnum:FAGooglePlus];
    
    
}

- (IBAction)PasswdStateChanged:(id)sender {
   
    if (_isLockPasswd) {
        [self setPasswdFAIconUnLockState:sender];
        _isLockPasswd =FALSE;
    }
    else
    {
        [self setPasswdFAIconLockState:sender];
        _isLockPasswd =TRUE;

    }
}

-(void) setPasswdFAIconLockState:(id) sender
{
    NSMutableAttributedString *lockAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconLock]];
    [lockAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    [lockAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    [_barLock setTitle:lockAttributedString.string forState:UIControlStateNormal];
    [_barLock setAttributedTitle:lockAttributedString forState:UIControlStateNormal];
    _passWord.secureTextEntry = YES;

}
-(void) setPasswdFAIconUnLockState:(id) sender
{
    
    NSMutableAttributedString *lockAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconUnlock]];
    [lockAttributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:20] range:NSMakeRange(0, 1)];
    [lockAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 1)];
    [_barLock setTitle:lockAttributedString.string forState:UIControlStateNormal];
    [_barLock setAttributedTitle:lockAttributedString forState:UIControlStateNormal];
    
    _passWord.secureTextEntry = NO;
}
- (IBAction)focusToPasswdFeild:(id)sender {
    [_userName resignFirstResponder];
    [_passWord becomeFirstResponder];
    
}
- (IBAction)onLogin:(id)sender {
    [self loginParamon:sender];
}
-(BOOL)isFirstLoginParamo
{
    //判断指定目录下的文件是否存在
    //获取分类的沙盒路径
    NSArray* myPath =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *myDocPath= [myPath objectAtIndex:0];
    NSString *path=[myDocPath stringByAppendingPathComponent:@"hpcparamoninfo.plist"];
    NSFileManager *file_manager = [NSFileManager defaultManager];
    return ![file_manager fileExistsAtPath:path];
}

- (void) saveUserAccessToken:(NSDictionary *) dataSource
{
    if([dataSource count]>0)
    {
        //获取分类的沙盒路径
        NSArray* myPath =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *myDocPath= [myPath objectAtIndex:0];
        NSString *path=[myDocPath stringByAppendingPathComponent:@"hpcparamoninfo.plist"];
       [NSKeyedArchiver archiveRootObject:dataSource toFile:path];
    }
}
- (void) saveUserKey:(NSDictionary *) dataSource
{
    //获取分类的沙盒路径
    NSArray* myPath =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *myDocPath= [myPath objectAtIndex:0];
    NSString *path=[myDocPath stringByAppendingPathComponent:@"hpcparamonUserKey.plist"];
    if (!_isRememberKey) {
        NSError *error;
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        if ([fileMgr removeItemAtPath:path error:&error] != YES)
            NSLog(@"Unable to delete file: %@", [error localizedDescription]);
    }
    else
    {
        if(dataSource!=nil)
            [NSKeyedArchiver archiveRootObject:dataSource toFile:path];
    }
    
}
- (void) getUserKey
{
    //获取分类的沙盒路径
    NSArray* myPath =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *myDocPath= [myPath objectAtIndex:0];
    NSString *path=[myDocPath stringByAppendingPathComponent:@"hpcparamonUserKey.plist"];
    //解归档该路径下得 文件
    NSDictionary * userData =[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSString *userNameValue=[userData valueForKeyPath:@"userName"];
    NSString *passwordValue=[userData valueForKeyPath:@"password"];
    if (userNameValue&&passwordValue) {
        _userName.text=userNameValue;
        _passWord.text=passwordValue;

    }
}

- (NSString *) getAccessToken
{
    //获取分类的沙盒路径
    NSArray* myPath =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *myDocPath= [myPath objectAtIndex:0];
    NSString *path=[myDocPath stringByAppendingPathComponent:@"hpcparamoninfo.plist"];
    //解归档该路径下得 文件
    NSDictionary * userData =[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSString *strRetValue=[userData valueForKeyPath:@"json"];
    NSArray *_arr = [strRetValue componentsSeparatedByString:NSLocalizedString(@";", nil)];
   
    return _arr[1];
}
-(bool) isHaveError :(NSDictionary *)dRets
{
    //得到词典中所有KEY值
    NSEnumerator * enumeratorKey =[dRets keyEnumerator ];
                                     
    for (NSString *object in enumeratorKey) {
                   NSString* strRetValue =object;
            NSRange searchRange = [strRetValue rangeOfString:@"false"];
            if (searchRange.location != NSNotFound) {
                return TRUE;
                NSLog(@"遍历KEY的值: %@ value:%@",object, strRetValue);
           }
        
    }
    return FALSE ;
        
}

- (IBAction)loginParamon:(id)sender {
    // NSDictionary *dictParLogin=@{@"userName" : @"admin", @"password" : @"Para@2014"};
    //设置参数字典
    NSDictionary *dictParLogin=@{@"userName" : _userName.text, @"password" : _passWord.text};
    [[AFTwitterAPIClient sharedClient] postPath:LoginApiPort parameters:dictParLogin success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         id myRequest = [NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingMutableContainers error:nil];
         if ([myRequest isKindOfClass:[NSDictionary class]]) {
             NSDictionary *dict = (NSDictionary *)myRequest;
             NSString* strRetValue =[dict valueForKeyPath:@"json"]  ;
             NSRange searchRange = [strRetValue rangeOfString:@"false"];
             if (searchRange.location == NSNotFound) {
                 [[[UIAlertView alloc] initWithTitle:@"ok" message:@"Success" delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
                 
                 NSLog(@"%@",g_userKey);
                 [self saveUserAccessToken:dict];//保存 accessToken
                 if (_isRememberKey) {
                     [self saveUserKey:dictParLogin];
                 }
                 NSArray *_arr = [strRetValue componentsSeparatedByString:NSLocalizedString(@";", nil)];
                 g_userKey =_arr[1];
                 NSLog(@"%@",g_userKey);
                 //[self performSegueWithIdentifier:@"WorkMsgSegue" sender:sender];
                 [self changeToView:sender forView:g_workSystemUser];
                 return ;
             }
         }
         else
         {
             [[[UIAlertView alloc] initWithTitle:@"Sorry" message:@"UserName does not exist！or password error" delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
         }
         
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
#if __IPHONE_OS_VERSION_MIN_REQUIRED
         // [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
         [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:@"服务器地址端口错误！" delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
#else
         [[NSAlert alertWithMessageText:NSLocalizedString(@"Error", nil) defaultButton:NSLocalizedString(@"OK", nil) alternateButton:nil otherButton:nil informativeTextWithFormat:[error localizedDescription]] runModal];
#endif
         return;
     }];
    
    /*** Test  ****/
    if (_isRememberKey) {
        [self saveUserKey:dictParLogin];
    }
    [self changeToView:sender forView:g_workSystemUser];
}
-(void)sendMsgToServer:(NSString *) apiPort andParameters:(NSDictionary *)parameters
{
    //创建实例对象
    [[AFTwitterAPIClient sharedClient] postPath:apiPort parameters:parameters success:^(AFHTTPRequestOperation *operation, id JSON)
     {
         id myRequest = [NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingMutableContainers error:nil];
         if ([myRequest isKindOfClass:[NSDictionary class]]) {
             NSDictionary *dict = (NSDictionary *)myRequest;
             _retJsonData =dict;
         }
        //NSDictionary* dict =(NSDictionary* )JSON;
       //  NSJSONSerialization JSONObjectWithData
         //[self saveUserMsgtoFile:@"" AndData:dict];
        //[self getUserMsgfromFile:@"" AndData:dict ];
         
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
-(void)changeToView:(id)sender forView:(BOOL) isToWorkMSGView
{
    if (isToWorkMSGView) {
        [self performSegueWithIdentifier:@"WorkMsgSegue" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"UserMsgSegue" sender:self];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    
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
    //[self getUserKey];
    [self initCtrl];
    if (![self isFirstLoginParamo]) {
        //NSLog(@"%@",g_userKey);
        g_userKey =[self getAccessToken ];
        NSLog(@"%@",g_userKey);
        [self performSegueWithIdentifier:@"WorkMsgSegue" sender:self];
        
    }
    else
    {
        [self getUserKey];

    }
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
