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

// 点击顶部视图，让该视图平移向下消失
- (void)ListScrollViewDropDown:(LJShopScrollView *)shopView;
- (void)listScrollViewDidScrollView:(LJShopScrollView *)shopView tableViewOffsetY:(CGFloat)offSetY;
@end

NS_ASSUME_NONNULL_BEGIN

@interface LJShopScrollView : UIScrollView

@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, weak) id<LJShopScrollViewDelegate> scrollDelegate;

- (instancetype)initWithFrame:(CGRect)frame withVC:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
