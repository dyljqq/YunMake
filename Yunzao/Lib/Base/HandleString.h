//
//  HandleString.h
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HandleString : NSObject

//动态计算文字的高度
+(float)labelHeight:(NSString *)lableString withSize:(CGSize)startSize withFont:(UIFont *)font;

//动态计算文字的宽度
+(float)labelWidth:(NSString *)lableString withSize:(CGSize)startSize withFont:(UIFont *)font;

//判断手机号是否符合规范
+ (BOOL)isRealMobileNumber:(NSString *)mobileNum;

@end
