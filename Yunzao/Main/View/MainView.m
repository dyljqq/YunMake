//
//  MainView.m
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "MainView.h"
#import "MainTableViewCell.h"

#define CELL @"CELL"

@interface MainView () <UIActionSheetDelegate>

@end

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell* cell = (MainTableViewCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.cellHeight;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* reuse = [NSString stringWithFormat:@"%@%ld", CELL, indexPath.row];
    MainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if(cell == nil){
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    [cell updateCell:_dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ItemModel* model = _dataArray[indexPath.row];
    if(self.block)
        self.block(model.itemId, model.status);
}

#pragma Private Method

- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APPLICATION_SIZE.width, APPLICATION_SIZE.height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

@end
