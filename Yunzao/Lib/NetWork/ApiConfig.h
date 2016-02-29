//
//  ApiConfig.h
//  Template
//
//  Created by 季勤强 on 15/9/17.
//  Copyright (c) 2015年 季勤强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"
#import "BaseMethod.h"

@interface ApiConfig : NSObject

+ (NSURL*)ITEM_LIST_URL;

+ (NSURL*)ITEM_CREATE_URL;

+ (NSURL*)ITEM_UPDATE_URL;

+ (NSURL*)ITEM_DELETE_URL;

+ (NSURL*)ITEM_FINISH_URL;

+ (NSURL*)ITEM_REVERT_URL;

@end
