//
//  ParWorkMSGViewController.h
//  HPCParamon
//
//  Created by 张小静  on 14-9-14.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParWorkData.h"
#import <QuartzCore/QuartzCore.h>
#import "Header.h"
#import "UIPopoverListView.h"
#import "ParWorkView.h"
#import "ASFTableView.h"
@interface ParWorkMSGViewController : UIViewController <UIPopoverListViewDataSource, UIPopoverListViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *ParView;


@property (nonatomic, retain) QBTitleView *titleView;
@property (strong,nonatomic) NSDictionary* workDetailMsg;

@property (strong,nonatomic) ParWorkData* workDetailData;
@property(nonatomic,retain) UIBarButtonItem *rightBarButtonItem;

@property(nonatomic,retain)UIButton *workText;
@property(nonatomic,retain)UIButton *alarmText;
@property (weak, nonatomic) IBOutlet ASFTableView *mASFTableView;

@end
