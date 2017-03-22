//
//  ReboundAction.m
//  Rebound
//
//  Created by IOS-开发机 on 15/11/30.
//  Copyright © 2015年 IOS-开发机. All rights reserved.
//

#import "ReboundAction.h"



@implementation ReboundAction
{
    NSInteger       _surplusFrequency;
    NSTimeInterval  _delay;
}


/**
 MARK: - 创建共享实例
 **/
+ (instancetype)shareInstance{
    static dispatch_once_t once;
    static ReboundAction *__shareInstance;
    dispatch_once(&once, ^{
        
        __shareInstance = [[ReboundAction alloc]init];
        
    });
    return __shareInstance;
}



/*
 *MARK: - 回弹动画
 * view                     : 动画回弹控件
 * mobileDirectionType      : 动画回弹方向
 * mobileDistance           : 动画回弹最大距离
 * springbackFrequency      : 动画回弹次数
 * duration                 : 动画回弹总时间
 * delay                    : 动画延时
 */
- (void)performAnimationOnView:(UIView *)view mobileDirectionType:(FZRMobileDirectionType)mobileDirectionType  mobileDistance:(CGFloat)mobileDistance springbackFrequency:(NSInteger)springbackFrequency duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay
{
    _surplusFrequency = springbackFrequency;
    
    [self performAnimationOn:view mobileDirectionType:mobileDirectionType duration:duration mobileDistance:mobileDistance/springbackFrequency springbackFrequency:springbackFrequency];
}


- (void)performAnimationOn:(UIView *)view  mobileDirectionType:(FZRMobileDirectionType)mobileDirectionType duration:(NSTimeInterval)duration mobileDistance:(CGFloat)mobileDistance springbackFrequency:(NSInteger)springbackFrequency
{
    
    if (_surplusFrequency > 0) {
        [UIView animateKeyframesWithDuration:duration/springbackFrequency  delay:_delay options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
            
            NSInteger alreadyFrequency = springbackFrequency - _surplusFrequency;
            
            NSInteger remainder = alreadyFrequency % 2;
            
            CGFloat _float = (remainder==0? mobileDistance *_surplusFrequency:-1*mobileDistance *_surplusFrequency);
            
            if (mobileDirectionType == FZRMobileDirectionTypeLeft ||mobileDirectionType==FZRMobileDirectionTypeUp) {
                _float =(0-_float);
            }

            if(mobileDirectionType == FZRMobileDirectionTypeRight|| mobileDirectionType == FZRMobileDirectionTypeLeft)
            {
                view.transform = CGAffineTransformMakeTranslation(_float , 0);
            }
            else
            {
                view.transform = CGAffineTransformMakeTranslation(0 , _float);
            }
            
            
        } completion:^(BOOL finished) {
            _delay =  0;
            _surplusFrequency--;
            [self performAnimationOn:view mobileDirectionType:mobileDirectionType duration:duration mobileDistance:mobileDistance springbackFrequency:springbackFrequency];
        }];
    }
    
}







@end
