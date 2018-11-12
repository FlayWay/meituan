//
//  TableViewController.m
//  clms
//
//  Created by ljkj on 2018/9/30.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "TableViewController.h"

static NSString *cellId = @"cellid";
@interface TableViewController ()<UIGestureRecognizerDelegate>

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    pan.delegate = self;
    [self.tableView addGestureRecognizer:pan];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行 --------%@",indexPath.row,self.title];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
}



#pragma mark --- 手势事件
- (void)panGesture:(UIPanGestureRecognizer *)pangesture {

    // 只有row = 0 显示到顶部才可滚动
    CGFloat contentY = self.tableView.contentOffset.y;
    
//    CGFloat current1Y = [pangesture translationInView:self.tableView].y;
//    CGFloat current1X = [pangesture translationInView:self.tableView].x;
    if (contentY>0) {
//        if (current1Y < 0 && current1X > 0) {
//            switch (pangesture.state) {
//                case UIGestureRecognizerStateChanged:
//                {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationScrollUp object:@{@"tableScrollOffY":@(current1Y)}];
//
//                    if (current1Y > 80) {
//                        self.tableView.scrollEnabled = YES;
//                    }else {
//                        self.tableView.scrollEnabled = NO;
//
//                    }
//                }
//                    break;
//                    
//            }
//        }
        return;
    }
    switch (pangesture.state) {
        case UIGestureRecognizerStateBegan:
        {

        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat currentY = [pangesture translationInView:self.tableView].y;
            CGFloat currentX = [pangesture translationInView:self.tableView].x;
            NSLog(@"currindeY=====%f===currentX==%f",currentY,currentX);
            //判断如果currenty>0，currentX<0; 向下滑动
            if (currentY > 0 && currentX < 0) {

                [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationScrollDown object:@{@"tableScrollOffY":@(currentY)}];
            }
            // 向上滑动 判断商品 评价 商家 有没有滑动到顶部 否则 tableView不可滚动
           
            
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {

            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat currentY = [pangesture translationInView:self.tableView].y;
            CGFloat currentX = [pangesture translationInView:self.tableView].x;

            [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationScrollEnd object:@{@"tableScrollOffY":@(currentY)}];

        }
            break;

        default:
            break;
    }
}


#pragma mark --------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%s",__func__);
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
        if (scrollView.contentOffset.y <= 0) {
            
            scrollView.bounces = NO;
            NSLog(@"禁止下拉");
        }else if(scrollView.contentOffset.y >=0){
            scrollView.bounces = YES;
            NSLog(@"允许上拉");
            
        }
    }
}



#pragma mark 手势 多个手势共存
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
