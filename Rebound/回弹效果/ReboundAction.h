//
//  ReboundAction.h
//  Rebound
//
//  Created by IOS-开发机 on 15/11/30.
//  Copyright © 2015年 IOS-开发机. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, FZRMobileDirectionType) {
    /** 向左运动  */
    FZRMobileDirectionTypeLeft =0,
    /** 向右运动  */
    FZRMobileDirectionTypeRight,
    /** 向左运动  */
    FZRMobileDirectionTypeUp ,
    /** 向右运动  */
    FZRMobileDirectionTypeDown
    
} __TVOS_PROHIBITED;

@interface ReboundAction : NSObject

/**
 MARK: - 创建共享实例
 **/
+ (instancetype)shareInstance;

/*
 *MARK: - 回弹动画
 * view                     : 动画回弹控件
 * mobileDirectionType      : 动画回弹方向
 * mobileDistance           : 动画回弹最大距离
 * springbackFrequency      : 动画回弹次数
 * duration                 : 动画回弹总时间
 * delay                    : 动画延时
 */
- (void)performAnimationOnView:(UIView *)view mobileDirectionType:(FZRMobileDirectionType)mobileDirectionType  mobileDistance:(CGFloat)mobileDistance springbackFrequency:(NSInteger)springbackFrequency duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay;

@end
