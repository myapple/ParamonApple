//
//  ParLoginViewController.h
//  HPCParamon
//
//  Created by 张小静  on 14-9-16.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "SSCheckBoxView.h"
@interface ParLoginViewController : UIViewController
//@property (strong ,nonatomic) NSString* userKey;
@property (weak, nonatomic) IBOutlet UIButton *coffeeIndictor;
@property (weak, nonatomic) IBOutlet UILabel *label_2;
@property (strong ,nonatomic) NSDictionary* retJsonData;
@property (weak, nonatomic) IBOutlet SSCheckBoxView *checkSelectBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end
