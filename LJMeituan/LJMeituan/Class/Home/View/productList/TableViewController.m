//
//  TableViewController.m
//  clms
//
//  Created by ljkj on 2018/9/30.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "TableViewController.h"

static NSString *cellId = @"cellid";
@interface TableViewController ()


@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行 --------%@",indexPath.row,self.title];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
}

@end
