//
//  ZJTitleView.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJTitleView.h"

@implementation ZJTitleView

-(void)awakeFromNib{
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    self.userInteractionEnabled = NO;
    [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal
     ];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:22];
    self.height = self.currentImage.size.height;
}

-(void)setTitle:(NSString *)title{

    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
    [self.titleLabel sizeToFit];
    // 计算按钮视图的宽度
    self.width = self.titleLabel.width + self.titleEdgeInsets.left + self.currentImage.size.width;
}

@end
