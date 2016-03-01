//
//  ViewController.m
//  Yunzao
//
//  Created by 季勤强 on 16/2/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "OperateItemViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    MainView* mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"事项列表";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNavigation];
    
    mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 0, APPLICATION_SIZE.width, APPLICATION_SIZE.height - 64)];
    [self.view addSubview:mainView];
    
    [ItemRequest getItemListRequest:^(NSArray* array){
        mainView.dataArray = array;
        [mainView.tableView reloadData];
    }];
}

#pragma Action

- (void)rightBarAction:(UIBarButtonItem*)item{
    OperateItemViewController* controller = [OperateItemViewController new];
    controller.status = 0;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma Private Method

- (void)createNavigation{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加事项" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarAction:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
