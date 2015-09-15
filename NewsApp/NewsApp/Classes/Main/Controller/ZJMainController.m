//
//  ZJMainController.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJMainController.h"
#import "ZJLeftMenView.h"
#import "ZJTitleView.h"
#import "ZJRightViewController.h"
#import "ZJBaseNavController.h"
#import "ZJNewsRootController.h"
#import "ZJReadingController.h"

typedef enum{
    UIBarButtonItemLeft   = 999,
    UIBarButtonItemRight  = 1000,
}UIBarButtonItemClick;

#define kLeftViewDistanceScale 0.6
#define kLeftViewDistanceTop 64
#define kRightViewDistanceLeft 64
#define kZJCoverTag 100
#define kAnimationDuration 0.5

@interface ZJMainController ()<ZJLeftMenViewDelegate>
@property (nonatomic, weak) ZJLeftMenView *leftView;
@property (nonatomic, weak) ZJRightViewController *rightViewVc;
@property (nonatomic, weak) ZJBaseNavController *showNavController;
@end

@implementation ZJMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建子控制器
    [self setupChildControllers];
    
    // 2.创建左边菜单视图
    [self setupLeftMenuView];
    
    // 3.创建右边菜单视图
    [self setupRightMenuView];
    
    // 4.添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

#pragma mark - 初始化视图和子控件
// 创建子控制器
-(void)setupChildControllers{
    // 根据根控制器创建新闻导航控制器
    ZJNewsRootController *newsVc = [[ZJNewsRootController alloc] init];
    newsVc.view.backgroundColor = ZJRandomColor;
    [self setUpNav:newsVc title:@"新闻"];
    // 1.2订阅控制器
    ZJReadingController *readingVc = [[ZJReadingController alloc] init];
    readingVc.view.backgroundColor = ZJRandomColor;
    [self setUpNav:readingVc title:@"订阅"];
    // 1.3图片控制器
    ZJReadingController *photoVc = [[ZJReadingController alloc] init];
    photoVc.view.backgroundColor = ZJRandomColor;
    [self setUpNav:photoVc title:@"图片"];
    // 1.4视频控制器
    ZJReadingController *vedioVc = [[ZJReadingController alloc] init];
    vedioVc.view.backgroundColor = ZJRandomColor;
    [self setUpNav:vedioVc title:@"视频"];
    // 1.5跟帖控制器
    ZJReadingController *conmentVc = [[ZJReadingController alloc] init];
    conmentVc.view.backgroundColor = ZJRandomColor;
    [self setUpNav:conmentVc title:@"跟帖"];
    // 1.6电台控制器
    ZJReadingController *radioVc = [[ZJReadingController alloc] init];
    radioVc.view.backgroundColor = ZJRandomColor;
    [self setUpNav:radioVc title:@"电台"];
}

// 创建左边菜单视图
-(void)setupLeftMenuView{
    ZJLeftMenView *leftView = [[ZJLeftMenView alloc] init];
    CGFloat leftViewX = 0;
    CGFloat leftViewY = kLeftViewDistanceTop;
    CGFloat leftViewW = kScreenWidth * kLeftViewDistanceScale;
    CGFloat leftViewH = kScreenHeight * kLeftViewDistanceScale;
    leftView.frame = CGRectMake(leftViewX, leftViewY, leftViewW, leftViewH);
    _leftView = leftView;
    [self.view insertSubview:leftView atIndex:1];
    leftView.delegate = self;
}

// 创建右边菜单视图
-(void)setupRightMenuView{
    ZJRightViewController *rigthMenuViewVc = [[ZJRightViewController alloc] init];
    _rightViewVc = rigthMenuViewVc;
    rigthMenuViewVc.view.frame = CGRectMake(kRightViewDistanceLeft, 0, kScreenWidth - kRightViewDistanceLeft, kScreenHeight);
    [self.view insertSubview:rigthMenuViewVc.view atIndex:1];
    [self addChildViewController:rigthMenuViewVc];
}


/**
 *  根据传入的根控制器创建导航控制器
 *
 *  @param vc    根控制器
 *  @param title 导航条标题
 */
-(void)setUpNav:(UIViewController *)vc title:(NSString *)title{
    // 设置导航条内容
    ZJTitleView *titleView = [[ZJTitleView alloc] init];
    titleView.title = title;
    vc.navigationItem.titleView = titleView;
    
    // 创建左边按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(navBarBtnClick:) tag:UIBarButtonItemLeft];
    
    // 创建右边按钮
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" target:self action:@selector(navBarBtnClick:) tag:UIBarButtonItemRight];
    
    // 创建导航控制器
    ZJBaseNavController *newsNav = [[ZJBaseNavController alloc] initWithRootViewController:vc];
    _showNavController = newsNav;
    [self addChildViewController:newsNav];

}

// 手势拖拽事件
-(void)pan:(UIPanGestureRecognizer *)pan{
//    CGFloat offset = [pan tran]
    
}


#pragma mark - 设置状态栏样式
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 左右菜单按钮点击事件
// 根据左菜单移动当前显示的导航控制器
// 移动到最右边时，nav的高度为self.view.height - 2倍的菜单Y值，根据视图长宽比，计算缩放比例
// nav的中心点偏移位置 = (菜单宽度 + 缩放后视图宽的的一半 - 主视图跨度的一半)/scale
// 若是显示右边菜单，则偏移位置取反
-(void)navBarBtnClick:(UIButton *)btn{
    // 计算缩放比例
    CGFloat navEndH = kScreenHeight - 2 * kLeftViewDistanceTop;
    CGFloat scale   = navEndH / kScreenHeight;
    CGFloat scaleW  = kScreenWidth * scale * 0.5;
    CGFloat offsetX = 0;
    // 判断点击的按钮
    if (btn.tag == UIBarButtonItemLeft) { // 点击左菜单
        _rightViewVc.view.hidden = YES;
        _leftView.hidden  = NO;
        offsetX = scaleW + _leftView.width - kScreenWidth * 0.5;
    }else if(btn.tag == UIBarButtonItemRight){ // 点击右菜单
        _rightViewVc.view.hidden = NO;
        _leftView.hidden  = YES;
        offsetX = -(scaleW + _rightViewVc.view.width - kScreenWidth * 0.5);
    }
    //  执行形变动画
        [UIView animateWithDuration:kAnimationDuration animations:^{
            CGAffineTransform form = CGAffineTransformMakeScale(scale, scale);
            self.showNavController.view.transform = CGAffineTransformTranslate(form, offsetX/scale, 0);
            
            // 创建蒙板视图
            UIButton *cover = [UIButton buttonWithType:UIButtonTypeCustom];
            cover.frame = self.showNavController.view.bounds;
            cover.tag = kZJCoverTag;
            [self.showNavController.view addSubview:cover];
            [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        } completion:^(BOOL finished) {
            if (btn.tag == UIBarButtonItemRight) {
                [_rightViewVc didShow];
            }
        }];
}

#pragma mark - 蒙板点击事件
// 还原导航控制器视图，并且移除蒙板
-(void)coverClick:(UIView *)cover{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.showNavController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
}

#pragma mark - ZJLeftMenViewDelegate
-(void)leftMenuViewDidSelectBtn:(UIButton *)selectedBtn fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    // 1.移除旧控制器的view
    ZJBaseNavController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    // 2.显示新控制器的View
    ZJBaseNavController *newNav = self.childViewControllers[toIndex];
    [self.view addSubview:newNav.view];
    newNav.view.transform = oldNav.view.transform;
    // 3.记录当前显示控制器
    _showNavController = newNav;
    // 4.移除当前控制器的形变(显示nav)
    [self coverClick:[newNav.view viewWithTag:kZJCoverTag]];

}



@end
