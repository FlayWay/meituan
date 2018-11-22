//
//  LJSimpleManagerDemo.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/22.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "LJSimpleManagerDemo.h"
#import "LJSimpleManager.h"

@interface LJSimpleManagerDemo ()

@property (nonatomic, strong) LJSimpleManager *managerView;

@end

@implementation LJSimpleManagerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (@available(iOS 11.0,*)) {
        
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self setupSubViews];
}

- (void)setupSubViews {
    
    
    
}


@end
