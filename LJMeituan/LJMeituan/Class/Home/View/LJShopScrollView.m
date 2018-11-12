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

@end


@implementation LJShopScrollView


- (instancetype)initWithFrame:(CGRect)frame withVC:(nonnull UIViewController *)vc
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.scrollEnabled = NO;
        self.delegate = self;
        // 创建顶部菜单视图 商品,评价,商家
        [self createTopMenuView:vc];
    }
    return self;
}

#pragma mark -- 创建顶部菜单视图
- (void)createTopMenuView:(UIViewController *)vc {
    
    //1:顶部高度为_maxOffset_Y，背景透明，可以点击
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 150 + 48 - NavBarHeight)];
    topView.userInteractionEnabled = YES;
    [self addSubview:topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dropDownTap:)];
    tap.delegate = self;
    [topView addGestureRecognizer:tap];
    
    // 菜单
    CGFloat menuVCY = CGRectGetMaxY(topView.frame);
    ChildViewController *childVC = [[ChildViewController alloc]init];
    childVC.view.frame = CGRectMake(0,menuVCY, self.width, self.height - menuVCY -NavBarHeight);
    [vc addChildViewController:childVC];
    [self addSubview:childVC.view];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    [self addGestureRecognizer:pan];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewScrollDownAction:) name:KNotificationScrollDown object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewScrollEndAction:) name:KNotificationScrollEnd object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewScrollUpAction:) name:KNotificationScrollUp object:nil];
    
}

#pragma mark -- 下拉，显示店铺详情
- (void)dropDownTap:(UITapGestureRecognizer *)tap {
    
    if ([self.scrollDelegate respondsToSelector:@selector(ListScrollViewDropDown:)]) {

        [self.scrollDelegate ListScrollViewDropDown:self];
    }
}

#pragma mark --------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%s",__func__);
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSLog(@"%s",__func__);
}

#pragma mark --- 手势事件
- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)pan {
    
    NSLog(@"%s",__func__);
    LJShopScrollView *shopScrolView = (LJShopScrollView *)pan.view;
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat currentY = [pan translationInView:self.superview].y;
            NSLog(@"currentY=====%f",currentY);
            shopScrolView.y = currentY;
            if ([self.scrollDelegate respondsToSelector:@selector(listScrollViewDidUpScrollView:tableViewOffsetY:)]) {
                [self.scrollDelegate listScrollViewDidUpScrollView:self tableViewOffsetY:currentY];
                
            }
            
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {

        }
            break;
        default:
            break;
    }
    
    [pan setTranslation:CGPointZero inView:pan.view];
    

}

#pragma mark --- 向上滑动通知
- (void)tableViewScrollUpAction:(NSNotification *)noti {
    
    NSDictionary * infoDic = [noti object];
    NSLog(@"Up====%s====%@",__func__,infoDic[@"tableScrollOffY"]);
    NSString *offSetY = infoDic[@"tableScrollOffY"];
    if ([self.scrollDelegate respondsToSelector:@selector(listScrollViewDidUpScrollView:tableViewOffsetY:)]) {
        [self.scrollDelegate listScrollViewDidUpScrollView:self tableViewOffsetY:[offSetY floatValue]];
    }
}

#pragma mark ---- tableView 向下滑动通知
- (void)tableViewScrollDownAction:(NSNotification *)noti {

    NSDictionary * infoDic = [noti object];
    NSLog(@"down====%s====%@",__func__,infoDic[@"tableScrollOffY"]);
    NSString *offSetY = infoDic[@"tableScrollOffY"];
    if ([self.scrollDelegate respondsToSelector:@selector(listScrollViewDidScrollView:tableViewOffsetY:)]) {
        [self.scrollDelegate listScrollViewDidScrollView:self tableViewOffsetY:[offSetY floatValue]];
    }
}

- (void)tableViewScrollEndAction:(NSNotification *)noti {
    
    NSDictionary * infoDic = [noti object];
    CGFloat offSetY = [infoDic[@"tableScrollOffY"] floatValue];
    
    if ([self.scrollDelegate respondsToSelector:@selector(listScrollViewDidEndScrollView:tableViewOffsetY:)]) {
        
        [self.scrollDelegate listScrollViewDidEndScrollView:self tableViewOffsetY:offSetY];
    }
}

#pragma mark 手势 多个手势共存
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
