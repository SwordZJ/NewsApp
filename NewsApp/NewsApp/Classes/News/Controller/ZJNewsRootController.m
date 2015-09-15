//
//  ZJNewsRootController.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJNewsRootController.h"
#import "ZJTitleView.h"
@interface ZJNewsRootController ()
// 内容视图
@property (nonatomic, weak) UIScrollView *contentScrollView;
// 标签视图
@property (nonatomic, weak) UIScrollView *tabTagsScrollView;

@end

@implementation ZJNewsRootController


#pragma mark - 初始化操作
- (void)viewDidLoad {
    [super viewDidLoad];
//    // 设置内容视图
//    [self setupContentScrollView];
//    // 设置标签栏
//    [self setupTabTagsView];
}

//-(void)setupContentScrollView{
//    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
//    contentScrollView.frame = self.view.bounds;
//    contentScrollView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:contentScrollView];
//    self.contentScrollView = contentScrollView;
//}
//
//-(void)setupTabTagsView{
//    NSArray *titles = @[
//                        
//                        ];
//    
//    UIScrollView *tabTagsScrollView = [[UIScrollView alloc] init];
//    tabTagsScrollView.frame = CGRectMake(0, 0, kScreenWidth, ZJTabTitlesViewHeight);
//    [self.view addSubview:tabTagsScrollView];
//    self.tabTagsScrollView = tabTagsScrollView;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
