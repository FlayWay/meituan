//
//  LJShopScrollView.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/8.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "LJShopScrollView.h"
#import "ChildViewController.h"

@interface LJShopScrollView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

/// 最大偏移量
@property (nonatomic, assign) CGFloat maxOffset_Y;
/// 是否垂直滑动
@property (nonatomic, assign) BOOL isVertical;
/// 子视图View
@property (nonatomic, strong) UIView *childView;

@end


@implementation LJShopScrollView


- (instancetype)initWithFrame:(CGRect)frame withVC:(nonnull UIViewController *)vc
{
    self = [super initWithFrame:frame];
    if (self) {
        
         _maxOffset_Y = 150;
        self.contentSize = CGSizeMake(self.width, self.height + _maxOffset_Y);
//        self.scrollEnabled = NO;
        self.delegate = self;
        // 创建顶部菜单视图 商品,评价,商家
        [self createTopMenuView:vc];
    }
    return self;
}

#pragma mark -- 创建顶部菜单视图
- (void)createTopMenuView:(UIViewController *)vc {
    
    //1:顶部高度为_maxOffset_Y，背景透明，可以点击
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, _maxOffset_Y + 48 - NavBarHeight)];
    topView.userInteractionEnabled = YES;
    [self addSubview:topView];
    // 添加背景透明事件
    UIControl *control = [[UIControl alloc]initWithFrame:topView.frame];
    [control addTarget:self action:@selector(dropDownTap:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:control];
    
    // 菜单
    CGFloat menuVCY = CGRectGetMaxY(topView.frame);
    ChildViewController *childVC = [[ChildViewController alloc]init];
    childVC.view.frame = CGRectMake(0,menuVCY, self.width, self.height - menuVCY -NavBarHeight);
    [vc addChildViewController:childVC];
    self.childView = childVC.view;
    [self addSubview:childVC.view];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewScrollDown:) name:@"tableViewScrollDown" object:nil];
    
}

#pragma mark -- 下拉，显示店铺详情
- (void)dropDownTap:(UIControl *)tap {
    
    if ([self.scrollDelegate respondsToSelector:@selector(ListScrollViewDropDown:)]) {
        [self.scrollDelegate ListScrollViewDropDown:self];
    }
}

#pragma mark --- tableView向下滑动
- (void)tableViewScrollDown:(NSNotification *)noti {

    self.scrollEnabled = YES;
    
}

#pragma mark --------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat contentY = scrollView.contentOffset.y;
    NSLog(@"contentY======%f",contentY);

    [[NSNotificationCenter defaultCenter] postNotificationName:@"isCanscrollable" object:nil userInfo:@{@"offsetY":@(contentY)}];
    
    // 如果滑动超过100 隐藏
    if (contentY < -90) {
        
        if ([self.scrollDelegate respondsToSelector:@selector(ListScrollViewDropDown:)]) {
            [self.scrollDelegate ListScrollViewDropDown:self];
        }
    }
    
    if (contentY >= _maxOffset_Y-NavBarHeight+48) {

        self.childView.frame = CGRectMake(0,contentY, self.width, UIScreen.mainScreen.bounds.size.height - NavBarHeight);
        
    }else {
        
    }
}


@end
