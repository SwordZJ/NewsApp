//
//  ZJLeftMenView.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJLeftMenView.h"

@interface ZJLeftMenView ()
// 记录当前选中按钮
@property (nonatomic, weak) UIButton *selectedBtn;
@end



@implementation ZJLeftMenView



-(void)awakeFromNib{
    // 初始化设置
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 初始化设置(创建按钮)
        [self setUp];
    }
    return self;
}
// 初始化设置(创建按钮)
-(void)setUp{
    // 根据传入的图片和title创建按钮
    CGFloat alpha = 0.2;
    [self addBtnWithIconName:@"sidebar_nav_news" title:@"新闻" bgColor:ZJColorRGBA(202, 68, 73, alpha)];
    [self addBtnWithIconName:@"sidebar_nav_reading" title:@"订阅" bgColor:ZJColorRGBA(190, 111, 69, alpha)];
    [self addBtnWithIconName:@"sidebar_nav_photo" title:@"图片" bgColor:ZJColorRGBA(76, 132, 190, alpha)];
    [self addBtnWithIconName:@"sidebar_nav_video" title:@"视频" bgColor:ZJColorRGBA(101, 170, 78, alpha)];
    [self addBtnWithIconName:@"sidebar_nav_comment" title:@"跟帖" bgColor:ZJColorRGBA(170, 172, 73, alpha)];
    [self addBtnWithIconName:@"sidebar_nav_radio" title:@"电台" bgColor:ZJColorRGBA(190, 62, 119, alpha)];
}

/**
 *  根据传入的图片和title创建按钮对象
 *
 *  @param iconName 图片名称
 *  @param title    标题
 */
-(void)addBtnWithIconName:(NSString *)iconName title:(NSString *)title bgColor:(UIColor *)bgColor{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    // 监听按钮点击事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 设置按钮文字和图片
    [btn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    // 设置选中背景
    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateSelected];
    // 设置高亮时图标不变色
    btn.adjustsImageWhenHighlighted = NO;
    
    // 调整btn的位置
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

// 布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    // 遍历子控件
    NSInteger subViewsCount = self.subviews.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.width;
    CGFloat btnH = self.height / subViewsCount;
    for (int i = 0; i < subViewsCount; i++) {
        UIButton *btn = self.subviews[i];
        btn.tag = i;
        btnY = i * btnH;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
        
}

// 在设置代理的时候默认选中第一个按钮
-(void)setDelegate:(id<ZJLeftMenViewDelegate>)delegate{
    _delegate = delegate;
    [self btnClick:[self.subviews firstObject]];
    
}


#pragma mark - 按钮点击事件
-(void)btnClick:(UIButton *)btn{
    // 1.根据点击按钮情况通知控制器切换视图
    if ([_delegate respondsToSelector:@selector(leftMenuViewDidSelectBtn:fromIndex:toIndex:)]) {
        [_delegate leftMenuViewDidSelectBtn:btn fromIndex:self.selectedBtn.tag toIndex:btn.tag];
    }
    
    // 2.设置按选中，并且记录当前选中按钮
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;

}






@end
