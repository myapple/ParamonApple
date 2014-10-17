//
//  ParMainViewController.h
//  HPCParamon
//
//  Created by 张小静  on 14-10-15.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPopoverListView.h"
#import "PopoverView.h"
#import "NSString+FontAwesome.h"
#define AlARMMSG_SHOWNUM 5
#import "ParWorkData.h"
@interface ParMainViewController : UIViewController <UIPopoverListViewDataSource, UIPopoverListViewDelegate>

@property(nonatomic,retain) UIButton *workText;
@property(nonatomic,retain) UIButton *alarmText;

@property (strong,nonatomic) ParWorkData* workDetailMsg;
@property (strong,nonatomic) NSMutableArray* mShoworkMsg;
@property (strong,nonatomic) NSMutableArray *alarmDetailMsg;
- (void)initCtrl:(UIViewController *) mViewController andTitle: (UIButton *)_btnTitle andAlarmNum:_btnAlarmNum andAlarm:(UIButton *)_btnAlarm  andWorkMsg:(UIButton *)_btnWorkMsg  andSetUser:(UIButton *)_btnSetUser
;
- (PopoverView *)getSetMangerPopview:(UIButton *)sender ;
- (PopoverView *)getUnNormalPopview:(UIButton *)sender ;
-(void)showMessageBox:(NSString*) title andText:text andCancel:(BOOL)isHave;
-(void)getPrevPage:(NSString *)mPort andPageSize:(int)pageSize//andSource:(ParWorkData *)data
;
-(void)getNextPage:(NSString *)mPort andPageSize:(int)pageSize//
;
-(void)getFirstPage:(NSString *)mPort andPageSize:(int)pageSize//
;
-(void)getLastPage:(NSString *)mPort andPageSize:(int)pageSize//
;
-(void)quitApplication;
@end
