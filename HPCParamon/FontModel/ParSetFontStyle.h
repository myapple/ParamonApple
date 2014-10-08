//
//  ParSetFontStyle.h
//  HPCParamon
//
//  Created by 张小静  on 14-9-28.
//  Copyright (c) 2014年 张小静 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+FontAwesome.h"
@interface ParSetFontStyle : NSMutableAttributedString

-(ParSetFontStyle *) changeStyle:(FAIcon)value size:(int)size range:(NSRange)range  backColor:(UIColor *)backColor  foreColor:(UIColor *) foreColor;

@end
