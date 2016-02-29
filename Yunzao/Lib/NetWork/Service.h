//
//  Service.h
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

//用来判断请求的方式，包括URL和post/get
#import <Foundation/Foundation.h>

@interface Service : NSObject

//请求的url地址
@property(nonatomic,copy)NSString* url;

//请求的方式
@property(nonatomic,copy)NSString* method;

//初始化的方法
- (instancetype)initWithServlet:(NSURL*)url setMethod:(NSString*)method;

@end
