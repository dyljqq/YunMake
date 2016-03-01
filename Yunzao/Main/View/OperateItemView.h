//
//  OperateItemView.h
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ADD,
    EDIT,
} OPERATE_ITEM;

typedef void (^OperateItemViewBlock)(int status, NSString* title, NSString* content);

@interface OperateItemView : UIView

@property (nonatomic)int status;

@property (nonatomic, strong)OperateItemViewBlock block;

@end
