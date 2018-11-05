//
//  LJTabBar.h
//  LJMeituan
//
//  Created by ljkj on 2018/11/5.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJTabBar;

@protocol LJTabBarDelegate <NSObject>

- (void)tabBar:(LJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LJTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@property (nonatomic, weak)id <LJTabBarDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
