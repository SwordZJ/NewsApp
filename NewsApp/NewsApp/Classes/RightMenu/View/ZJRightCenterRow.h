//
//  ZJRightCenterRow.h
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/17.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJRightCenterRow : UIView

@property (nonatomic, copy) NSString *title;// 按钮内容
@property (nonatomic, copy) NSString *icon;// 图片
+(instancetype)rightCenterRow;
@end
