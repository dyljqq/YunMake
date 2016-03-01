//
//  ItemRequest.m
//  Yunzao
//
//  Created by 季勤强 on 16/2/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "ItemRequest.h"
#import "ItemModel.h"

/**
 id: 1,                  // Number
 user_id: 1,             // Number
 title: "title",         // String
 content: "content",     // String
 status: 0,              // Enum: 0(default), 1(finished)
 create_time: 0,         // Timestamp
 update_time: 0          // Timestamp
 **/

@implementation ItemRequest

+ (void)getItemListRequest:(ItemRequestSuccess)callback{
    Request* request = [[Request alloc] initWithServlet:[ApiConfig ITEM_LIST_URL]];
    [request callBack:^(Response* response){
        if(response.code == SUCCESS_CODE){
            NSArray* items = response.data[@"data"];
            NSMutableArray* array = [NSMutableArray array];
            for (NSDictionary* dic in items) {
                ItemModel* item = [ItemModel new];
                item.itemId = [dic[@"id"] unsignedIntegerValue];
                item.userId = [dic[@"user_id"] unsignedIntegerValue];
                item.title = dic[@"title"];
                item.content = dic[@"content"];
                item.status = [dic[@"status"] intValue];
                item.createTime = [dic[@"create_time"] longLongValue];
                item.updateTime = [dic[@"update_time"] longLongValue];
                [array addObject:item];
            }
            if(callback){
                callback([array copy]);
            }
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD showErrorWithStatus:response.message];
            });
        }
    }];
}

+ (void)createItemRequest:(NSString *)title withContent:(NSString *)content callback:(ItemRequestComplete)callback{
    Request* request = [[Request alloc] initWithServlet:[ApiConfig ITEM_CREATE_URL]];
    [request setParam:title setKey:@"title"];
    [request setParam:content setKey:@"content"];
    [request callBack:^(Response* response){
        NSString* message = nil;
        if(response.code == SUCCESS_CODE){
            message = @"添加事项成功";
            if(callback)
                callback();
        }else{
            message = response.message;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:message];
        });
    }];
}

+ (void)updateItemRequest:(NSUInteger)uid withTitle:(NSString *)title withContent:(NSString *)content callback:(ItemRequestComplete)callback{
    Request* request = [[Request alloc] initWithServlet:[ApiConfig ITEM_CREATE_URL]];
    [request setParam:title setKey:@"title"];
    [request setParam:content setKey:@"content"];
    [request callBack:^(Response* response){
        NSString* message = nil;
        if(response.code == SUCCESS_CODE){
            message = @"更新事项成功";
            if(callback)
                callback();
        }else{
            message = response.message;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:message];
        });
    }];
}

+ (void)deleteItenRequest:(NSUInteger)itemId callback:(ItemRequestSuccess)callback{
    [self commenMethod:itemId withService:[ApiConfig ITEM_UPDATE_URL] withSuccessMessage:@"删除事项成功"];
}

+ (void)finishItemRequest:(NSUInteger)itemId callback:(ItemRequestSuccess)callback{
    [self commenMethod:itemId withService:[ApiConfig ITEM_UPDATE_URL] withSuccessMessage:@"完成事项成功"];
}

+ (void)revertItemRequest:(NSUInteger)itemId callback:(ItemRequestSuccess)callback{
    [self commenMethod:itemId withService:[ApiConfig ITEM_REVERT_URL] withSuccessMessage:@"撤销完成事项成功"];
}

#pragma Private Method

+ (void)commenMethod:(NSUInteger)itemId withService:(Service*)service withSuccessMessage:(NSString*)msg{
    Request* request = [[Request alloc] initWithServlet:service];
    [request setParam:[NSNumber numberWithUnsignedLong:itemId] setKey:@"id"];
    [request callBack:^(Response* response){
        NSString* message = nil;
        if(response.code == SUCCESS_CODE){
            message = msg;
        }else{
            message = response.message;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD showErrorWithStatus:message];
        });
    }];
}

@end
