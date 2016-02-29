//
//  Request.h
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"
#import "Response.h"

@interface Request : NSObject

//传递的参数是否是json类型，默认不是json
@property(nonatomic)BOOL isJson;

@property(nonatomic,strong)Service* service;

//初始化request
-(instancetype)initWithServlet:(Service*)service;

//添加数据
-(void)setParam:(NSObject*)value setKey:(NSString*)key;

//网络请求完成后的回调
-(void)callBack:(void (^)(Response* response))callBack;

//上传图片
-(void)uploadCallBack:(void (^)(Response *response))callBack setImage:(UIImage*)image;

@end
