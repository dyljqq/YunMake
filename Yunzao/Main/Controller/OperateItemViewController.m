//
//  OperateItemViewController.m
//  Yunzao
//
//  Created by 季勤强 on 16/3/1.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "OperateItemViewController.h"
#import "OperateItemView.h"

@interface OperateItemViewController ()

@end

@implementation OperateItemViewController{
    OperateItemView* operateView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    switch (_status) {
        case ADD:
            self.title = @"添加事项";
            break;
            
        case EDIT:
            self.title = @"修改事项";
            break;
            
        default:
            break;
    }
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.navigationController.navigationBar.translucent = NO;
    
    operateView = [[OperateItemView alloc] initWithFrame:CGRectMake(0, 0, APPLICATION_SIZE.width, APPLICATION_SIZE.height - 64)];
    operateView.status = _status;
    [self.view addSubview:operateView];
    
    __weak typeof(self) weakSelf = self;
    operateView.block = ^(int status, NSString* title, NSString* content){
        __strong typeof(self) strongSelf = weakSelf;
        if(status == 0){
            [ItemRequest createItemRequest:title withContent:content callback:^{
                [strongSelf.navigationController popViewControllerAnimated:YES];
            }];
        }else if(status == EDIT){
            [ItemRequest updateItemRequest:strongSelf.itemId withTitle:title withContent:content callback:^{
                [strongSelf.navigationController popViewControllerAnimated:YES];
            }];
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
