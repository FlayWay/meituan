//
//  LJShopScrollView.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/8.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "LJShopScrollView.h"
#import "ChildViewController.h"

@interface LJShopScrollView ()

@end


@implementation LJShopScrollView


- (instancetype)initWithFrame:(CGRect)frame withVC:(nonnull UIViewController *)vc
{
    self = [super initWithFrame:frame];
    if (self) {
        
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
    [topView addGestureRecognizer:tap];
    
    // 菜单
    CGFloat menuVCY = CGRectGetMaxY(topView.frame);
    ChildViewController *childVC = [[ChildViewController alloc]init];
    childVC.view.frame = CGRectMake(0,menuVCY, self.width, self.height - menuVCY -NavBarHeight);
    [vc addChildViewController:childVC];
    [self addSubview:childVC.view];
}

#pragma mark -- 下拉，显示店铺详情
- (void)dropDownTap:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(ListScrollViewDropDown:)]) {

        [self.delegate ListScrollViewDropDown:self];
    }
}

@end
