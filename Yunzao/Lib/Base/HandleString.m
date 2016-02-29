//
//  HandleString.m
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import "HandleString.h"
#import "BaseMethod.h"

@implementation HandleString

+(float)labelHeight:(NSString *)lableString withSize:(CGSize)startSize withFont:(UIFont *)font{
    
    if(![BaseMethod isStringNotNull:lableString]){
        
        return 0;
    }
    NSDictionary *attribute = @{NSFontAttributeName: font};
    startSize = CGSizeMake(startSize.width, MAXFLOAT);
    CGFloat retHeight = [lableString boundingRectWithSize:startSize
                                                  options:
                         NSStringDrawingTruncatesLastVisibleLine |
                         NSStringDrawingUsesLineFragmentOrigin |
                         NSStringDrawingUsesFontLeading
                                               attributes:attribute
                                                  context:nil].size.height;
    return retHeight + 1;
}

+(float)labelWidth:(NSString *)lableString withSize:(CGSize)startSize withFont:(UIFont *)font{
    
    if(![BaseMethod isStringNotNull:lableString]){
        
        return 0;
    }
    NSDictionary *attribute = @{NSFontAttributeName: font};
    startSize = CGSizeMake(MAXFLOAT, startSize.height);
    CGFloat retWidth = [lableString boundingRectWithSize:startSize
                                                 options:
                        NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading
                                              attributes:attribute
                                                 context:nil].size.width;
    
    return retWidth + 1;
}

/**
 *  判断手机号格式是否正确
 */
+ (BOOL)isRealMobileNumber:(NSString *)mobileNum{
    NSString *MOBILE = @"^1[3|4|5|8][0-9]\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , MOBILE];
    return [regextestmobile evaluateWithObject:mobileNum];
}

@end
