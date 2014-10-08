//
//  GlobalVar.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-14.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "GlobalVar.h"

@implementation GlobalVar
+(GlobalVar *)getInstance
{
    //    @synchronized(self) {
    //        if (Global == nil){
    //            Global = [[self alloc] init];
    //        }
    //    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Global = [[self alloc] init];
    });
    return Global;
}@end
