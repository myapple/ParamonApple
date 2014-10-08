//
//  ParFirstViewController.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ParFirstViewController.h"

@interface ParFirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end

@implementation ParFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    
}
@end
