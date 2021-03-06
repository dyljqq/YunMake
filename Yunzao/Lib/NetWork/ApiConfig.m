//
//  ApiConfig.m
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import "ApiConfig.h"

//1. 获取所有事项列表
static const NSString* ITEM_LIST_URL = @"/item/list";

//2. 新建事项
static const NSString* ITEM_CREATE_URL = @"/item/create";

//3. 修改事项
static const NSString* ITEM_UPDATE_URL = @"/item/update";

//4. 删除事项
static const NSString* ITEM_DELETE_URL = @"/item/delete";

//5. 完成事项
static const NSString* ITEM_FINISH_URL = @"/item/finish";

//6. 撤销完成事项
static const NSString* ITEM_REVERT_URL = @"/item/revert";

@implementation ApiConfig

+ (Service*)ITEM_LIST_URL{
    return [[Service alloc] initWithServlet:[NSString stringWithFormat:@"%@%@", URL_PREFIX_HEADER, ITEM_LIST_URL] setMethod:@"POST"];
}

+ (Service*)ITEM_CREATE_URL{
    return [[Service alloc] initWithServlet:[NSString stringWithFormat:@"%@%@", URL_PREFIX_HEADER, ITEM_CREATE_URL] setMethod:@"POST"];
}

+ (Service*)ITEM_UPDATE_URL{
    return [[Service alloc] initWithServlet:[NSString stringWithFormat:@"%@%@", URL_PREFIX_HEADER, ITEM_UPDATE_URL] setMethod:@"POST"];
}

+ (Service*)ITEM_DELETE_URL{
    return [[Service alloc] initWithServlet:[NSString stringWithFormat:@"%@%@", URL_PREFIX_HEADER, ITEM_DELETE_URL] setMethod:@"POST"];
}

+ (Service*)ITEM_FINISH_URL{
    return [[Service alloc] initWithServlet:[NSString stringWithFormat:@"%@%@", URL_PREFIX_HEADER, ITEM_FINISH_URL] setMethod:@"POST"];
}

+ (Service*)ITEM_REVERT_URL{
    return [[Service alloc] initWithServlet:[NSString stringWithFormat:@"%@%@", URL_PREFIX_HEADER, ITEM_REVERT_URL] setMethod:@"POST"];
}

@end
