//
//  ZJLeftMenView.h
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJLeftMenView;
@protocol ZJLeftMenViewDelegate <NSObject>
@optional
/**
 *  当按钮被点击时调用，根据点击的按钮切换视图
 *
 *  @param selectedBtn 传入点击的按钮
 *  @param fromIndex   上一个被点击按钮的tag值
 *  @param toIndex     当前点击按钮的tag值
 */
-(void)leftMenuViewDidSelectBtn:(UIButton *)selectedBtn fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end


@interface ZJLeftMenView : UIView

@property (nonatomic, weak) id<ZJLeftMenViewDelegate> delegate;

@end
