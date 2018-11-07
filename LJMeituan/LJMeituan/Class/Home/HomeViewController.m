//
//  HomeViewController.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(nextAction)];
    
    
}

// 详情
- (void)nextAction {
    
    MenuViewController *menuVc = [[MenuViewController alloc]init];
    
    [self.navigationController pushViewController:menuVc animated:YES];
    
}

#pragma mark -- 创建tableView
- (void)setupTableView {

}



@end
