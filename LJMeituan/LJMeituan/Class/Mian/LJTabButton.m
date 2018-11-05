//
//  LJTabButton.m
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#define LJTabBarButtonImageRatio 0.6

#import "LJTabButton.h"

@implementation LJTabButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height *LJTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * LJTabBarButtonImageRatio;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item {
    
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

@end
