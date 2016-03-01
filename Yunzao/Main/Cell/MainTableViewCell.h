//
//  MainTableViewCell.h
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, readonly)float cellHeight;

- (void)updateCell:(ItemModel*)item;

@end
