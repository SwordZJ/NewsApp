//
//  ZJTabBar.m
//  Frame工具类
//
//  Created by liuzhouji on 15/8/31.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 *   声明快速加载xib视图方法
 */
+(instancetype)viewFormXib;
@end
