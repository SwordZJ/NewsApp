//
//  ZJNewsRootController.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJNewsRootController.h"
#import "ZJTitleView.h"
#import "ZJTitleTagsView.h"
#define ZJTitleTagViewHeight 30



@interface ZJNewsRootController ()
/** 内容视图 */
@property (nonatomic, weak) UIScrollView *contentScrollView;
/** 标签条视图 */
@property (nonatomic, weak) ZJTitleTagsView *titleTagsView;
/** add按钮 */
@property (nonatomic, weak) UIButton *addBtn;
/** 标签容器视图*/
@property (nonatomic, weak) UIView *containerView;
/** 切换标签标题视图 */
@property (nonatomic, weak) UIView *channelTitleView;
/** 切换栏目标签*/
@property (nonatomic, weak) UILabel *switchChannelLabel;
/** 排序按钮 */
@property (nonatomic, weak) UIButton *sortBtn;
@end

@implementation ZJNewsRootController
#pragma mark - lazy
-(UIView *)channelTitleView{
    if (!_channelTitleView) {
        // 创建频道切换标签视图
        UIView *channelTitleView = [[UIView alloc] init];
        channelTitleView.frame = _titleTagsView.bounds;
        channelTitleView.backgroundColor = [UIColor whiteColor];
        [_containerView addSubview:channelTitleView];
        
        // 切换标签
        UILabel *switchChannelLabel = [[UILabel alloc] init];
        switchChannelLabel.text = @"切换栏目";
        switchChannelLabel.font = [UIFont systemFontOfSize:13];
        [switchChannelLabel sizeToFit];
        switchChannelLabel.x = 10;
        switchChannelLabel.centerY = channelTitleView.centerY;
        self.switchChannelLabel = switchChannelLabel;
        [channelTitleView addSubview:switchChannelLabel];
        
        // 创建排序按钮
        UIButton *sortBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [sortBtn setTitle:@"排序删除" forState:UIControlStateNormal];
        sortBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        // 设置按钮内容属性
        [sortBtn setBackgroundImage:[UIImage imageNamed:@"channel_edit_button_bg"] forState:UIControlStateNormal];
        [sortBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [sortBtn setBackgroundImage:[UIImage imageNamed:@"channel_edit_button_selected_bg"] forState:UIControlStateHighlighted];
        [sortBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sortBtn addTarget:self action:@selector(sortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [sortBtn sizeToFit];
        sortBtn.centerY = channelTitleView.centerY;
        sortBtn.x = channelTitleView.width - 10 - sortBtn.width;
        [channelTitleView addSubview:sortBtn];
        self.sortBtn = sortBtn;
        
        _channelTitleView = channelTitleView;
        // 默认隐藏
        _channelTitleView.hidden = YES;
    }
    return _channelTitleView;
}

#pragma mark - 初始化操作
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置内容视图
    [self setupContentScrollView];
    
    // 设置标签栏
    [self setupTagTitlesView];
    
}

-(void)setupContentScrollView{
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.frame = self.view.bounds;
    contentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentScrollView];
    self.contentScrollView = contentScrollView;
}

-(void)setupTagTitlesView{
    // 创建容器视图
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    containerView.frame = CGRectMake(0, 0, kScreenWidth, ZJTitleTagViewHeight);
    self.containerView = containerView;
    [self.view addSubview:containerView];
    
    
    NSArray *titles = @[
                        @"头条",
                        @"娱乐",
                        @"热点",
                        @"体育",
                        @"本地",
                        @"医疗",
                        @"教育"
                        ];
    // 创建标签条视图
    ZJTitleTagsView *titleTagsView = [[ZJTitleTagsView alloc] init];
    titleTagsView.frame = CGRectMake(0, 0, containerView.width - ZJTitleTagViewHeight, ZJTitleTagViewHeight);
    titleTagsView.titles = titles;
    self.titleTagsView = titleTagsView;
    [containerView addSubview:titleTagsView];
    
    // 创建标签切换头部视图
    [self channelTitleView];
    
    // 创建add按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(CGRectGetMaxX(titleTagsView.frame), 0, ZJTitleTagViewHeight, ZJTitleTagViewHeight);
    [addBtn setImage:[UIImage imageNamed:@"channel_nav_arrow"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.addBtn = addBtn;
    [containerView addSubview:addBtn];
    
}
#pragma mark - 监听事件
- (void)addBtnClick:(UIButton *)addBtn{
    // 显示隐藏标签栏
    self.sortBtn.tag = 100;
    [self sortBtnClick:self.sortBtn];
    self.channelTitleView.hidden = !self.channelTitleView.hidden;
    
    // 创建标签视图
    UIView *tagSwitchView = [[UIView alloc] init];
    
    
    
    
    
}

- (void)sortBtnClick:(UIButton *)sortBtn{
    if (sortBtn.tag == 99) { // 判断是否点击
        sortBtn.tag = 100;
        [self.sortBtn setTitle:@"完成" forState:UIControlStateNormal];
        self.switchChannelLabel.text = @"拖动排序";
    }else if(sortBtn.tag == 100){
        sortBtn.tag = 99;
        [self.sortBtn setTitle:@"排序删除" forState:UIControlStateNormal];
        self.switchChannelLabel.text = @"切换栏目";
    }
    
}
@end
