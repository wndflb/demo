//
//  YYRefreshHeader.m
//  fuliba
//
//  Created by wangjundong on 2016/8/19.
//  Copyright © 2016年 fuliba. All rights reserved.
//
#import "YYRefreshHeader.h"

@interface YYRefreshHeader ()
@property(nonatomic,weak)UIView *headerFreshView;
@property(nonatomic,weak)UILabel *label;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation YYRefreshHeader

-(void)prepare
{
    [super prepare];
    self.mj_h =75;
    UIView *view =[[UIView alloc]init];
    [self addSubview:view];
    
    self.headerFreshView =view;
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self.headerFreshView addSubview:label];
    self.label = label;
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"arrow"];
    [self.headerFreshView addSubview:imageView];
    self.imageView = imageView;
    

}
- (void)placeSubviews
{
    [super placeSubviews];
    self.headerFreshView.bounds = CGRectMake(0, 0, 110, 20);
    self.headerFreshView.center = CGPointMake(self.mj_w*0.5, self.mj_h*0.5);
    self.label.frame = CGRectMake(30, 0, 80, 20);
    self.imageView.frame = CGRectMake(10, 5, 10, 10);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = @"下拉刷新";
            [self endAnimation];
            break;
        case MJRefreshStatePulling:
            self.label.text = @"松开加载更多";
            [self endAnimation];
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"加载中...";
            [self startAnimation];
            break;
        default:
            break;
    }
}
#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    self.label.textColor = [UIColor blackColor];
}
-(void)startAnimation
{
    CABasicAnimation *basicAni= [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAni.duration = 1;
    basicAni.repeatCount = MAXFLOAT;
    //    basicAni.repeatDuration = 3;
    basicAni.toValue = @(M_PI * 2);
    [self.imageView.layer addAnimation:basicAni forKey:nil];
}
- (void)endAnimation
{
    [self.imageView.layer removeAllAnimations];
}
@end
