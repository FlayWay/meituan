//
//  TableViewController.m
//  clms
//
//  Created by ljkj on 2018/9/30.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "TableViewController.h"

static NSString *cellId = @"cellid";
@interface TableViewController ()<UIGestureRecognizerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGFloat scrollViewoffsetY;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.scrollEnabled = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isScrollEnable:) name:@"isCanscrollable" object:nil];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureActoin:)];
    gesture.delegate = self;
    [self.tableView addGestureRecognizer:gesture];
    
}

- (void)gestureActoin:(UIPanGestureRecognizer *)pangesture {
    
    if (pangesture.state == UIGestureRecognizerStateBegan) {
        
        CGFloat currentY = [pangesture translationInView:self.tableView].y;
NSLog(@"currentY==%f==%f==%f",currentY,self.scrollViewoffsetY,self.tableView.contentOffset.y);
        // 大于0 向下滑动
        if (currentY >= 0) {
            if (self.scrollViewoffsetY >= 150) {
                if (self.tableView.contentOffset.y >= 0) {
                    self.tableView.scrollEnabled = YES;
                }else {
                    self.tableView.scrollEnabled = NO;
                }
            }else {
                self.tableView.scrollEnabled = YES;
            }
        }else {
            if (self.scrollViewoffsetY >= 150) {
                self.tableView.scrollEnabled = YES;
            }else {
                self.tableView.scrollEnabled = NO;
            }
        }
    }
    
}

- (void)isScrollEnable:(NSNotification *)noti {
    
    CGFloat offsetY = [noti.userInfo[@"offsetY"] floatValue];
    self.scrollViewoffsetY = offsetY;
    NSLog(@"offsetY========%f",offsetY);
    if (offsetY>= 150) {
        
        self.tableView.scrollEnabled = YES;
        
    }else {
        
        self.tableView.scrollEnabled = NO;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行 --------%@",indexPath.row,self.title];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 30;
}


#pragma mark --------UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
////    NSLog(@"%s",__func__);
//    if ([scrollView isKindOfClass:[UITableView class]]) {
//
//        if (scrollView.contentOffset.y <= 0) {
//            NSLog(@"禁止下拉");
////            self.tableView.scrollEnabled = NO;
//
//        }else if(scrollView.contentOffset.y >=0){
//            NSLog(@"允许上拉");
//        }
//    }
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}

@end
