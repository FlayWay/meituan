//
//  HomeViewController.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuViewController.h"
#import "list/ListViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(nextAction)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(nextClick)];
}

// 详情
- (void)nextAction {
    
    MenuViewController *menuVc = [[MenuViewController alloc]init];
    
    [self.navigationController pushViewController:menuVc animated:YES];
    
}

- (void)nextClick {
    
    ListViewController *listVC = [[ListViewController alloc]init];
    [self.navigationController pushViewController:listVC animated:YES];
}

#pragma mark -- 创建tableView
- (void)setupTableView {

}



@end
