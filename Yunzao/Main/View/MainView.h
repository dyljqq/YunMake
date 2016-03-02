//
//  MainView.h
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MainViewBlock)(NSUInteger itemId, BOOL finished);

@interface MainView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView* tableView;

@property (nonatomic, copy)NSArray* dataArray;

@property (nonatomic, strong)MainViewBlock block;

@end
