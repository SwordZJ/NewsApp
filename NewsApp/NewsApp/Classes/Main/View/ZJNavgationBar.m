//
//  ZJNavgationBar.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/17.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJNavgationBar.h"

@implementation ZJNavgationBar

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    for (UIButton *btn in self.subviews) {
        if (![btn isKindOfClass:[UIButton class]]) continue;
        if (btn.centerX < self.width * 0.5) { // 左边按钮
            btn.x = 0;
        }else if (btn.centerX > self.width * 0.5){ //右边按钮
            btn.x = self.width - btn.width;
        }
    }
}

@end
