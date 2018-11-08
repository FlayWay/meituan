//
//  LJShopScrollView.h
//  LJMeituan
//
//  Created by ljkj on 2018/11/8.
//  Copyright © 2018年 ljkj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJShopScrollView;

@protocol LJShopScrollViewDelegate <NSObject>

- (void)ListScrollViewDropDown:(LJShopScrollView *)shopView;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LJShopScrollView : UIScrollView

@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, weak) id<LJShopScrollViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withVC:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
