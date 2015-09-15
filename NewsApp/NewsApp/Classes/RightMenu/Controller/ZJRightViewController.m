//
//  ZJRightViewController.m
//  仿网易新闻抽屉视图
//
//  Created by liuzhouji on 15/8/16.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJRightViewController.h"
#import "ZJRightCenterRow.h"

@interface ZJRightViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (nonatomic, weak) ZJRightCenterRow *centerRow;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation ZJRightViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    // 1.设置centerView的内容
    [self setupCenterView];

    // 2.设置底部视图
    [self setupBottomView];
}

// 设置底部视图
-(void)setupBottomView{
    



}



-(void)setupCenterView{
    [self addRightCenterRowTitle:@"商城 能赚能花，土豪当家" icon:@"promoboard_icon_mall"];
    [self addRightCenterRowTitle:@"活动 4.0发布会粉丝招募" icon:@"promoboard_icon_activities"];
    [self addRightCenterRowTitle:@"应用 金币从来都是这送的" icon:@"promoboard_icon_apps"];
    self.centerView.height = self.centerRow.height * self.centerRow.subviews.count;
}

-(void)addRightCenterRowTitle:(NSString *)title icon:(NSString *)icon{
    ZJRightCenterRow *centerRow = [ZJRightCenterRow rightCenterRow];
    _centerRow = centerRow;
    centerRow.title = title;
    centerRow.icon = icon;
    centerRow.y = self.centerView.subviews.count * centerRow.height;
    [self.centerView addSubview:centerRow];
}







-(void)didShow{
    [UIView transitionWithView:_iconView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        _iconView.image = [UIImage imageNamed:@"user_defaultgift"];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:_iconView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                _iconView.image = [UIImage imageNamed:@"default_avatar"];
            } completion:^(BOOL finished) {
            }];
        });
    }];
}

@end
