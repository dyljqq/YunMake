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

+ (Service*)ITEM_LIST_URL;

+ (Service*)ITEM_CREATE_URL;

+ (Service*)ITEM_UPDATE_URL;

+ (Service*)ITEM_DELETE_URL;

+ (Service*)ITEM_FINISH_URL;

+ (Service*)ITEM_REVERT_URL;

@end
