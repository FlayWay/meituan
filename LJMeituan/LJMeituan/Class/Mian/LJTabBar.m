//
//  LJTabBar.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import "LJTabBar.h"
#import "LJTabButton.h"

@interface LJTabBar ()

@property (nonatomic, strong) LJTabButton *selectedButton;

@end

@implementation LJTabBar


- (void)addTabBarButtonWithItem:(UITabBarItem *)item {
    
    LJTabButton *button = [LJTabButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:item.title forState:UIControlStateNormal];
//    [button setImage:item.image forState:UIControlStateNormal];
//    [button setImage:item.selectedImage forState:UIControlStateSelected];
    button.item = item;
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateNormal];
    [self addSubview:button];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    if (self.subviews.count == 1) {
        
        [self buttonClick:button];
    }
    
}

- (void)buttonClick:(LJTabButton *)button {

    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        
        [self.delegate tabBar:self didSelectButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];

    }
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    button.selected = YES;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    for (int i=0; i<self.subviews.count; i++) {
        
        UIButton *btn = self.subviews[i];
        CGFloat buttonX = i * buttonW;
        btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        btn.tag = i;
    }
}

@end
