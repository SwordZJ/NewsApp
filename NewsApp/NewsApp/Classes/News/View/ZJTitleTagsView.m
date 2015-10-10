//
//  ZJTitleTagsView.m
//  NewsApp
//
//  Created by liuzhouji on 15/9/29.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ZJTitleTagsView.h"
#import "ZJTagTitleBtn.h"
#define ZJStartScrollCount 2
#define ZJTagCountOnePage 5
#define ZJTitleTagViewHeight 30


@interface ZJTitleTagsView ()
/** 标签按钮数组 */
@property (nonatomic, strong) NSMutableArray *tagBtns;
/** 当前选中标签 */
@property (nonatomic, weak) ZJTagTitleBtn *selectedTagBtn;

@end

@implementation ZJTitleTagsView

#pragma mark - 懒加载
- (NSMutableArray *)tagBtns{
    if (!_tagBtns) {
        _tagBtns = [NSMutableArray array];
    }
    return _tagBtns;
}


#pragma mark - 初始化操作
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 初始化设置
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}


// 添加标签按钮
- (void)addTagtitleBtns{
    for (int i = 0; i < self.titles.count; i++) {
       // 创建标签按钮视图
        ZJTagTitleBtn *tagBtn = [ZJTagTitleBtn buttonWithType:UIButtonTypeCustom];
        [tagBtn setTitle:self.titles[i] forState:UIControlStateNormal];
        [self addSubview:tagBtn];
        // 保存到标签按钮数组中
        [self.tagBtns addObject:tagBtn];
        // 添加点击事件
        [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 默认选中第一个标签
    [self tagBtnClick:[self.tagBtns firstObject]];
}



#pragma mark - 重写setter方法，添加标签按钮
-(void)setTitles:(NSArray<NSString *> *)titles{
    _titles = titles;
    
    [self addTagtitleBtns];
    
    self.contentSize = CGSizeMake(titles.count * self.width / ZJTagCountOnePage, 0);
}

#pragma mark - 监听事件
- (void)tagBtnClick:(ZJTagTitleBtn *)tagBtn{
    // 设置标签选中状态
    _selectedTagBtn.enabled = YES;
    tagBtn.enabled = NO;
    _selectedTagBtn = tagBtn;
    // 设置标签视图滚动
    // 判断当前标签按钮的索引（前三个和最后三个不滚动，其余按钮点击后会滚动到最中间）
    NSInteger index = [self.tagBtns indexOfObject:tagBtn];
    NSInteger tagCount = self.tagBtns.count;
    if (index >= ZJStartScrollCount && index < tagCount - ZJStartScrollCount) { // 需要滚动
        CGPoint offset = self.contentOffset;
        offset.x = tagBtn.x - ZJStartScrollCount * tagBtn.width;
        [self setContentOffset:offset animated:YES];
    }
    
    // 切换对应的新闻视图
    
}




#pragma mark - 布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    // 布局标签按钮
    CGFloat tagBtnW = self.width / ZJTagCountOnePage;
    CGFloat tagBtnH = self.height;
    CGFloat tagBtnY = 0;
    CGFloat tagBtnX = 0;
    for (int i = 0; i < self.titles.count; i++) {
        // 创建标签按钮视图
        ZJTagTitleBtn *tagBtn = self.tagBtns[i];
        tagBtnX = tagBtnW * i;
        tagBtn.frame = CGRectMake(tagBtnX, tagBtnY, tagBtnW, tagBtnH);
    }    
}


@end
