//
//  Header.h
//  HPCParamon
//
//  Created by 张小静  on 14-9-21.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#ifndef HPCParamon_Header_h
#define HPCParamon_Header_h

#import "AFTwitterAPIClient.h"
#import "ViewController.h"
#import "QBTitleView.h"
#import "UIImage+tintedImage.h"
#import "ParWorkData.h"



//#define min(X, Y)  ((X) < (Y) ? (X) : (Y))
//#define CheckStringIsNull(str) checkStringIsnull:
#define g_getWorkMSGPort @"findPage-APPJOB"
#define  g_loginApiPort @"loginAppUser-APPUSER"
extern NSString * g_userKey;

extern int loadCount;
extern NSMutableArray * _workdata;
//NSString * g_userKey =nil;
//const NSString * g_loginApiPort =@"checkAppUser-APPUSER";
//const NSString * g_getWorkMSGPort =@"findPage-APPJOB";
#endif
