//
//  LJMainViewController.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "LJMainViewController.h"
#import "LJTabBar.h"
#import "HomeViewController.h"
#import "VisitViewController.h"
#import "MerchantViewController.h"
#import "MineViewController.h"
#import "MoreViewController.h"
#import "LJNavigationController.h"


@interface LJMainViewController ()<LJTabBarDelegate>

@property (nonatomic, strong) LJTabBar *customTabBar;

@end

@implementation LJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 初始化tabbar
    [self setupTabbar];
    
    // 添加子控制器
    [self setupAllChildViewControllers];
    
}

// 移除事件写在viewWillAppear中不启用
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];

    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            
            [child removeFromSuperview];
        }
    }
}

- (void)setupTabbar {
    
    // 自定义tabbarView
    LJTabBar *customTabBar = [[LJTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
//    customTabBar.backgroundColor = [UIColor redColor];
    customTabBar.delegate = self;

    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    
}

#pragma mark ---切换控制器
- (void)tabBar:(LJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to {
    
    self.selectedIndex  = to;
    
}

- (void)setupAllChildViewControllers {
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self setupChildController:homeVC title:@"首页" normalImage:@"icon_tabbar_homepage" selectedImage:@"icon_tabbar_homepage_selected"];

    
    VisitViewController *visitVC = [[VisitViewController alloc]init];
    [self setupChildController:visitVC title:@"上门" normalImage:@"icon_tabbar_onsite" selectedImage:@"icon_tabbar_onsite_selected"];
    
    MerchantViewController *chartVC = [[MerchantViewController alloc]init];
    [self setupChildController:chartVC title:@"商家" normalImage:@"icon_tabbar_merchant_normal" selectedImage:@"icon_tabbar_merchant_selected"];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    [self setupChildController:mineVC title:@"我的" normalImage:@"icon_tabbar_mine" selectedImage:@"icon_tabbar_mine_selected"];
    
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    [self setupChildController:moreVC title:@"更多" normalImage:@"icon_tabbar_misc" selectedImage:@"icon_tabbar_misc_selected"];
}

- (void)setupChildController:(UIViewController *)vc title:(NSString *)title normalImage:(NSString *)normalImageName selectedImage:(NSString *)selectedImageName {
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    LJNavigationController *nav = [[LJNavigationController alloc]initWithRootViewController:vc];
    vc.navigationItem.title = title;
    [self addChildViewController:nav];
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}


@end
