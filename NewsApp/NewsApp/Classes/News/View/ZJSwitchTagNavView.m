//
//  ZJSwitchTagNavView.m
//  NewsApp
//
//  Created by liuzhouji on 15/10/1.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ZJSwitchTagNavView.h"

@interface ZJSwitchTagNavView ()
/**  更多标签按钮 */
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIView *tagNavbarView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *switchBtn;

@end


@implementation ZJSwitchTagNavView

#pragma mark - 初始化方法
-(void)awakeFromNib{
    

}

#pragma mark - 监听事件
- (IBAction)switchBtnClick:(UIButton *)switchBtn {
    
    
}
- (IBAction)addBtnClick:(UIButton *)addBtn {
    
    
}

@end
