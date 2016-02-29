//
//  Service.m
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import "Service.h"

@implementation Service

-(instancetype)initWithServlet:(NSURL *)url setMethod:(NSString *)method{
    
    self=[super init];
    if(self){        
        self.url=url;
        self.method=method;
    }
    return self;
}

@end
