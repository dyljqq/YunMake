//
//  Request.m
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import "Request.h"
#import "BaseMethod.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD.h>

@interface Request (){
    
}

@property(nonatomic,strong)NSMutableDictionary* dic;

@end

@implementation Request

-(instancetype)initWithServlet:(Service *)service{
    
    self=[super init];
    if(self){        
        self.service=service;
        self.isJson=YES;
        [self dic];
        UIDevice* device = [UIDevice currentDevice];
        [self setParam:[device identifierForVendor].UUIDString setKey:@"deviceUUID"];
        [self setParam:[device model] setKey:@"deviceTypeName"];
        [self setParam:[device systemName] setKey:@"os"];
        [self setParam:[device systemVersion] setKey:@"osVer"];
        [self setParam:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] setKey:@"appVer"];
        if([BaseMethod isStringNotNull:[DataBase nowUser].authToken]){
            [self setParam:[DataBase nowUser].authToken setKey:@"authToken"];
        }
    }
    return self;
}

-(NSMutableDictionary*)dic{
    if(!_dic){
        _dic = [NSMutableDictionary dictionary];
    }
    return _dic;
}

-(void)setParam:(NSObject *)value setKey:(NSString *)key{
    
    //首先判断是否为空
    if([value isEqual:[NSNull null]] || ![BaseMethod isStringNotNull:key]){
        return ;
    }
    [_dic setValue:value forKey:key];
}

//网络请求成功
-(void)successOperate:(NSDictionary*)dic setCallBack:(void (^)(Response *response))callBack{
    
    Response* response=[[Response alloc] init];
    response.data=dic;
    response.code=[dic[@"Code"] intValue];
    if([BaseMethod isStringNotNull:dic[@"ErrorMsg"]]){
        response.message=dic[@"ErrorMsg"];
    }
    if(callBack){
        callBack(response);
    }
}

-(void)callBack:(void (^)(Response *response))callBack{
    if(![BaseMethod isConnectionAvailable]){
        [ApplicationDelegate popController];
        [SVProgressHUD showInfoWithStatus:@"当前网络不可用"];
        return ;
    }
    [SVProgressHUD show];
    if([_service isEqual:[NSNull null]]){
        
        NSLog(@"Request Service is null");
        return ;
    }
    NSLog(@"url:%@,method:%@",_service.url,_service.method);
    NSLog(@"%@",_dic);
    AFHTTPRequestOperationManager* manager=[AFHTTPRequestOperationManager manager];
    //如果需要传递json，那么就将类型变为json
    if(_isJson){
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        manager.responseSerializer=[AFJSONResponseSerializer serializer];
    }
    
    if([_service.method isEqualToString:@"POST"]){
        [manager POST:_service.url parameters:_dic success:^ void(AFHTTPRequestOperation * operation, NSDictionary* dic) {
            [SVProgressHUD dismiss];
            NSLog(@"response data:%@",dic);
            int code = [dic[@"Code"] intValue];
            if (code == TOKEN_ERROR) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD showErrorWithStatus:@"请重新登录"];
                    [ApplicationDelegate logout];
                });
                return ;
            }
            [self successOperate:dic setCallBack:callBack];
            
        } failure:^ void(AFHTTPRequestOperation * operation, NSError * error) {
            
            NSLog(@"AFNetwork POST Error:%@",error);
            [SVProgressHUD dismiss];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD showErrorWithStatus:@"网络异常"];
            });
        }];
    }else if([_service.method isEqualToString:@"GET"]){
        
        [manager POST:_service.url parameters:_dic success:^ void(AFHTTPRequestOperation * operation, NSDictionary* dic) {
            
            [self successOperate:dic setCallBack:callBack];
            
        } failure:^ void(AFHTTPRequestOperation * operation, NSError * error) {
            
            NSLog(@"AFNetwork POST Error:%@",error);
            [SVProgressHUD dismiss];
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD showErrorWithStatus:@"网络异常"];
            });
        }];
    }
}

-(void)uploadCallBack:(void (^)(Response *response))callBack setImage:(UIImage*)image{
    
    NSLog(@"url:%@,method:%@ dic:%@",_service.url,_service.method,_dic);
    
    NSData* data=[NSData dataWithData:UIImagePNGRepresentation(image)];
    long time=[[NSDate date] timeIntervalSince1970];
    NSString* imageName=[NSString stringWithFormat:@"%ld.png",time];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:_service.url parameters:_dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data
                                    name:@"image"
                                fileName:imageName
                                mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
        NSLog(@"Success: %@", responseObject);
        [self successOperate:responseObject setCallBack:callBack];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:@"网络异常"];
        NSLog(@"Error: %@", error);
    }];
}

@end
