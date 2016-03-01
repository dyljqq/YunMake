//
//  OperateItemView.m
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "OperateItemView.h"

@interface OperateItemView ()

@property (nonatomic, strong)UITextField* titleTextField;

@property (nonatomic, strong)UITextField* contentTextField;

@property (nonatomic, strong)UIButton* commitButton;

@end

@implementation OperateItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = BACKGROUND_COLOR;
    
    [self addSubview:self.titleTextField];
    [self addSubview:self.contentTextField];
    [self addSubview:self.commitButton];
    
    self.titleTextField.frame = CGRectMake(15, 20, APPLICATION_SIZE.width - 30, 50);
    self.contentTextField.frame = CGRectMake(15, 80, APPLICATION_SIZE.width - 30, 50);
    self.commitButton.frame = CGRectMake(15, 150, APPLICATION_SIZE.width - 30, 50);
}

#pragma Action

- (void)commitAction{
    NSString* title = self.titleTextField.text;
    NSString* content = self.contentTextField.text;
    if(![BaseMethod isStringNotNull:title]){
        [SVProgressHUD showErrorWithStatus:@"请输入事项标题"];
        return ;
    }else if(![BaseMethod isStringNotNull:content]){
        [SVProgressHUD showErrorWithStatus:@"请输入事项内容"];
        return ;
    }
    if(self.block){
        self.block(_status, title, content);
    }
}

#pragma Private Method

- (UITextField *)titleTextField{
    if(_titleTextField == nil){
        _titleTextField = [self commonTextField:@"请输入事项标题"];
    }
    return _titleTextField;
}

- (UITextField *)contentTextField{
    if(_contentTextField == nil){
        _contentTextField = [self commonTextField:@"请输入事项内容"];
    }
    return _contentTextField;
}

- (UIButton *)commitButton{
    if(_commitButton == nil){
        _commitButton = [UIButton new];
        [_commitButton setTitle:@"添加事项" forState:UIControlStateNormal];
        [_commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _commitButton.titleLabel.font = FONT(15);
        _commitButton.backgroundColor = BUTTON_COLOR;
        _commitButton.layer.cornerRadius = 5;
        _commitButton.layer.masksToBounds = YES;
        [_commitButton addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitButton;
}

- (UITextField*)commonTextField:(NSString*)placeHold{
    UITextField* textField = [UITextField new];
    
    textField.placeholder = placeHold;
    textField.textColor = FONT_COLOR;
    textField.font = FONT(15);
    textField.backgroundColor = [UIColor whiteColor];
    
    textField.layer.cornerRadius = 5;
    textField.layer.masksToBounds = YES;
    
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    return textField;
}

- (void)setStatus:(int)status{
    switch (status) {
        case ADD:
            [self.commitButton setTitle:@"添加事项" forState:UIControlStateNormal];
            break;
            
        case EDIT:
            [self.commitButton setTitle:@"修改事项" forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    _status = status;
}

@end
