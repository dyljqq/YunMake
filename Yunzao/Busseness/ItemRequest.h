//
//  ItemRequest.h
//  Yunzao
//
//  Created by 季勤强 on 16/2/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import <Foundation/Foundation.h>

//完成网络请求
typedef void (^ItemRequestComplete)();

//请求成功
typedef void (^ItemRequestSuccess)(NSArray* array);

@interface ItemRequest : NSObject

+ (void)getItemListRequest:(ItemRequestSuccess)callback;

+ (void)createItemRequest:(NSString*)title withContent:(NSString*)content callback:(ItemRequestComplete)callback;

+ (void)updateItemRequest:(NSUInteger)itemId withTitle:(NSString*)title withContent:(NSString*)content callback:(ItemRequestComplete)callback;

+ (void)deleteItenRequest:(NSUInteger)itemId callback:(ItemRequestSuccess)callback;

+ (void)finishItemRequest:(NSUInteger)itemId callback:(ItemRequestSuccess)callback;

+ (void)revertItemRequest:(NSUInteger)itemId callback:(ItemRequestSuccess)callback;

@end
