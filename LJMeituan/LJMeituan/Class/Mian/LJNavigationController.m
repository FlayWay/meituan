//
//  LJNavigationController.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "LJNavigationController.h"

@interface LJNavigationController ()

@end

@implementation LJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (viewController.childViewControllers.count >0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIViewController *vc = viewController;
        
        NSString *title = @"返回";
        if (self.childViewControllers.count == 1) {
            
            title  = self.childViewControllers.firstObject.title ? self.childViewControllers.firstObject.title : @"返回";
        }
        
        vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(popToParent)];
        
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)popToParent {
    
    [self popViewControllerAnimated:YES];
}

@end
