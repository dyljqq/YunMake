//
//  ItemModel.h
//  Yunzao
//
//  Created by 季勤强 on 16/2/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 id: 1,                  // Number
 user_id: 1,             // Number
 title: "title",         // String
 content: "content",     // String
 status: 0,              // Enum: 0(default), 1(finished)
 create_time: 0,         // Timestamp
 update_time: 0          // Timestamp
**/

@interface ItemModel : NSObject

@property (nonatomic)NSUInteger itemId;
@property (nonatomic)NSUInteger userId;
@property (nonatomic, copy)NSString* title;
@property (nonatomic, copy)NSString* content;
@property (nonatomic)int status;
@property (nonatomic)long long createTime;
@property (nonatomic)long long updateTime;

@end
