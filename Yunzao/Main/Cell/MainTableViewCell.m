//
//  MainTableViewCell.m
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "MainTableViewCell.h"
#import "HandleString.h"

typedef enum : NSUInteger {
    DEFAULT,
    FINISH
}ITEM_STATUS;

@interface MainTableViewCell ()

@property (nonatomic, strong)UILabel* titleLabel;

@property (nonatomic, strong)UILabel* contentLabel;

@property (nonatomic, strong)UILabel* statusLabel;

@end

@implementation MainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initCell];
    }
    return self;
}

- (void)initCell{
    self.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.contentLabel];
}

- (void)updateCell:(ItemModel *)item{
    self.titleLabel.frame = CGRectMake(15, 10, APPLICATION_SIZE.width - 30, 16);
    self.titleLabel.text = [NSString stringWithFormat:@"标题:%@", item.title];
    float height = [HandleString labelHeight:item.content withSize:CGSizeMake(APPLICATION_SIZE.width - 30, 13) withFont:FONT(12)];
    self.contentLabel.frame = CGRectMake(15, 35, APPLICATION_SIZE.width - 30, height);
    self.contentLabel.text = [NSString stringWithFormat:@"内容:%@", item.content];
    
    NSString* status = nil;
    switch (item.status) {
        case DEFAULT:
            status = @"状态:未完成";
            self.statusLabel.textColor = FONT_GRAY_COLOR;
            break;
            
        case FINISH:
            status = @"状态:完成";
            self.statusLabel.textColor = [UIColor redColor];
            break;
            
        default:
            break;
    }
    self.statusLabel.text = status;
    self.statusLabel.frame = CGRectMake(APPLICATION_SIZE.width - 115, 12, 100, 13);
    
    _cellHeight = self.contentLabel.frame.origin.y + self.contentLabel.frame.size.height + 10;
}

#pragma Private Method

- (UILabel *)titleLabel{
    if(_titleLabel == nil){
        _titleLabel = [UILabel new];
        _titleLabel.textColor = FONT_COLOR;
        _titleLabel.font = FONT(15);
    }
    return _titleLabel;
}

- (UILabel*)contentLabel{
    if(_contentLabel == nil){
        _contentLabel = [UILabel new];
        _contentLabel.font = FONT(12);
        _contentLabel.textColor = FONT_GRAY_COLOR;
    }
    return _contentLabel;
}

- (UILabel*)statusLabel{
    if(_statusLabel == nil){
        _statusLabel = [UILabel new];
        _statusLabel.textColor = [UIColor redColor];
        _statusLabel.font = FONT(12);
        _statusLabel.textAlignment = NSTextAlignmentRight;
    }
    return _statusLabel;
}

@end
