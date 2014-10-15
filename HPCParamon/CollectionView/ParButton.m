//
//  ParButton.m
//  HPCParamon
//
//  Created by 张小静  on 14-10-14.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParButton.h"

@implementation ParButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       NSLog(@"%d",  [ParButton countsBtn]);
    }
    return self;
}
-(id)init
{
    if (self =[super init]) {
        NSLog(@"%d",  [ParButton countsBtn]);

    }
    return self;
}
+(int)countsBtn;
{
    static int  i=0;
    
    return i++;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
