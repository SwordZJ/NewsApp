//
//  ZJRightCenterRow.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/17.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJRightCenterRow.h"

@interface ZJRightCenterRow ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic, weak)IBOutlet UIButton *titleBtn;

@end


@implementation ZJRightCenterRow

+(instancetype)rightCenterRow{

    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}


-(void)setIcon:(NSString *)icon{
    _icon = icon;
    self.iconView.image = [UIImage imageNamed:icon];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}

@end
