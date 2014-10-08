//
//  ParNavigationBar.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-22.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParNavigationBar.h"

@implementation ParNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundImage:[UIImage imageNamed:@"logol"] forBarMetrics:UIBarMetricsDefault];
    }
    return self;
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
