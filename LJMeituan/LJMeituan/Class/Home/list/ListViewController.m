//
//  ListViewController.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/22.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "ListViewController.h"
#import "LJSimpleManagerDemo.h"

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titlesArr;

@end

@implementation ListViewController

- (UITableView *)tableView {
 
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavBarHeight, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    if (@available(iOS 11.0,*)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.titlesArr = @[@"基础版-刷新控件在顶部\nLTSimple",
                       @"进阶版-刷新控件在中间\nLTAdvanced",
                       @"下拉放大-导航渐变\nLTPersonalMainPage",
                       @"切换视图\nLTPageView"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titlesArr[indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titlesArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            LJSimpleManagerDemo *demoVC = [[LJSimpleManagerDemo alloc]init];
            demoVC.title = self.titlesArr[indexPath.row];
            [self.navigationController pushViewController:demoVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}


@end
