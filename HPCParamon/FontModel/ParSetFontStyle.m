//
//  ParSetFontStyle.m
//  HPCParamon
//
//  Created by 张小静  on 14-9-28.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import "ParSetFontStyle.h"

@implementation ParSetFontStyle
+(ParSetFontStyle *) Creat
{
    static ParSetFontStyle *_sharedStyle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStyle =[[ParSetFontStyle alloc]init];
    });
    
    return _sharedStyle;
}
-(NSMutableAttributedString *) changeStyle:(FAIcon)value size:(int)size range:(NSRange)range  backColor:(UIColor *)backColor  foreColor:(UIColor *) foreColor
{
    NSMutableAttributedString* attributedString=
    attributedString=[[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAIconUser]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:size] range:range];
    //设置颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:backColor range:range];
    //动态创建

    return self;
}

@end
