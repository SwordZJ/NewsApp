//
//  ZJTagTitleBtn.m
//  NewsApp
//
//  Created by liuzhouji on 15/9/29.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ZJTagTitleBtn.h"
#define ZJAnimationDuration 0.5
#define ZJTagTitleNormalFont 12
#define ZJTagTitleSelectedFont 17

@implementation ZJTagTitleBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 初始化设置
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    }
    return self;
}


// 重置高亮状态
-(void)setHighlighted:(BOOL)highlighted{
    
}

// 重写setEnabled方法
-(void)setEnabled:(BOOL)enabled{
    if (enabled == YES) {
        [UIView animateWithDuration:ZJAnimationDuration animations:^{
            self.titleLabel.font = [UIFont systemFontOfSize:ZJTagTitleNormalFont];
        }];
    }else{
        [UIView animateWithDuration:ZJAnimationDuration animations:^{
            self.titleLabel.font = [UIFont systemFontOfSize:ZJTagTitleSelectedFont];
        }];
    }
    [super setEnabled:enabled];
}
@end
