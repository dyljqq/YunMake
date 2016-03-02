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
#import <MJRefresh/MJRefresh.h>

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
    
    __weak typeof(self) weakSelf = self;
    mainView.block = ^(NSUInteger itemId, BOOL finished){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf addAlertController:itemId isFinished:finished];
    };
    
    mainView.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf refreshTableView];
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshTableView];
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

- (void)addAlertController:(NSUInteger)itemId isFinished:(BOOL)finished{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"事项操作" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    __weak typeof(self) weakSelf = self;
    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action){
        __strong typeof(self) strongSelf = weakSelf;
        [ItemRequest deleteItenRequest:itemId callback:^{
            [strongSelf refreshTableView];
        }];
    }];
    UIAlertAction* editAction = [UIAlertAction actionWithTitle:@"编辑事项" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        __strong typeof(self) strongSelf = weakSelf;
        OperateItemViewController* controller = [OperateItemViewController new];
        controller.status = 1;
        controller.itemId = itemId;
        [strongSelf.navigationController pushViewController:controller animated:YES];
    }];
    
    NSString* str = @"完成事项";
    if (finished) {
        str = @"撤销完成事项";
    }
    UIAlertAction* alterAction = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        __strong typeof(self) strongSelf = weakSelf;
        if(finished){
            [ItemRequest revertItemRequest:itemId callback:^{
                [strongSelf refreshTableView];
            }];
        }else{
            [ItemRequest finishItemRequest:itemId callback:^{
                [strongSelf refreshTableView];
            }];
        }
    }];
    [alert addAction:editAction];
    [alert addAction:alterAction];
    [alert addAction:deleteAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)refreshTableView{
    [ItemRequest getItemListRequest:^(NSArray* array){
        [mainView.tableView.mj_header endRefreshing];
        mainView.dataArray = array;
        [mainView.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
