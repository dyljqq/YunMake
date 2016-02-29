//
//  BaseMethod.h
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseMethod : NSObject

//判断字符串是否为空
+(BOOL)isStringNotNull:(id)object;

//转化为MD5值
+ (NSString *)getMd5WithString:(NSString *)string;

//将图片转化为MD5
+ (NSString*)getMd5WithImage:(UIImage*)image;

//判断网络是否可用
+ (BOOL)isConnectionAvailable;

@end
