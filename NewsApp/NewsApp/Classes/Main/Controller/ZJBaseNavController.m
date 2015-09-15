//
//  ZJNewsNavController.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJBaseNavController.h"
#import "ZJNavgationBar.h"
@interface ZJBaseNavController ()

@end

@implementation ZJBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];

    // KVC设置导航栏
    [self setValue:[[ZJNavgationBar alloc] init] forKeyPath:@"navigationBar"];
}

+(void)initialize{

    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置导航条背景
    [appearance setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
