//
//  DateUtils.h
//  Template
//
//  Created by 季勤强 on 15/9/18.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

//时间处理类
#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

//获取时间戳获得指定的时间 如：YYYY-MM-DD HH:MM
+(NSString*)getDateByTimeStamp:(NSString*)timeStamp;

@end
