//
//  ParUIBaseViewController.h
//  HPCParamon
//
//  Created by 张小静  on 14-10-9.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParUIBaseViewController : UIViewController
@property (weak, nonatomic)  UIButton *btnSetUser;
@property (weak, nonatomic)  UIButton *btnAlarm;
@property (weak, nonatomic)  UIButton *btnWorkMsg;
@property (weak, nonatomic)  UIButton *btnTitle;
@property (weak, nonatomic)  UIButton *btnAlarmNum;
@property(nonatomic,retain)UIButton *workText;
@property(nonatomic,retain)UIButton *alarmText;
@end
