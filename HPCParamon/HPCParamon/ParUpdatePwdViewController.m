//
//  ParUpdatePwdViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-30.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParUpdatePwdViewController.h"

@interface ParUpdatePwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwd;
@property (weak, nonatomic) IBOutlet UITextField *passwdAgain;

@end

@implementation ParUpdatePwdViewController
-(BOOL) isSamePasswd
{
    NSString *pass = _passwd.text;
    NSString *pass2 = _passwdAgain.text;
    return [pass isEqualToString:pass2];
    
}
- (IBAction)CheckPasswd:(id)sender {
    [self isSamePasswd];
}
- (IBAction)sendServer:(id)sender {
    if ([self isSamePasswd]) {
        NSLog(@"发送 新的密码到 服务器");
        return;
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
