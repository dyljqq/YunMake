//
//  Response.h
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject

//表示返回的所有数据
@property(nonatomic,strong)NSDictionary* data;

//表示返回的状态码
@property(nonatomic)int code;

//表示返回的正确或者错误的信息
@property(nonatomic,copy)NSString* message;

@end
