//
//  DateUtils.m
//  Template
//
//  Created by 季勤强 on 15/9/18.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

+(NSString*)getDateByTimeStamp:(NSString *)timeStamp{
    
    long long time=[timeStamp longLongValue];
    NSDate* date=[NSDate dateWithTimeIntervalSince1970:time];//表示的是从1970到现在的时间
    NSDateFormatter* formmater=[[NSDateFormatter alloc] init];
    [formmater setDateFormat:@"YYYY-MM-DD HH:MM"];//这个可以自定义
    return [formmater stringFromDate:date];
}

@end
