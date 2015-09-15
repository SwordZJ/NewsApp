//
//  UIImage+Circle.h
//
//  Created by liuzhouji on 15/7/29.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Circle)
/**
 *  根据传入的图片和指定圆环的宽度和颜色，生成一张带有圆环的圆形图片
 *
 *  @param name        需要裁减的图片名称
 *  @param borderWidth 圆环宽度
 *  @param color       圆环颜色
 *
 *  @return 返回裁减的圆环形图片
 */
+(instancetype)circleImageWithImageName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;
/**
 *  根据传入的圆环宽度和颜色，生成一张带有圆环的圆形图片(此为对象方法)
 *
 *  @param borderWidth 圆环宽度
 *  @param color       圆环颜色
 *
 *  @return 返回裁减的圆环形图片
 */
-(instancetype)circleImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;

/**
 *  图片对象调用该方法生成一张圆形的图片返回
 *
 *  @return 返回圆形图片
 */
-(instancetype)circleImage;
/**
 *  根据传入的图片名称生成一张圆形图片
 *
 *  @param name 图片名称
 *
 */
+(instancetype)circleImageNamed:(NSString *)name;

/**
 *  根据传入的圆角半径生成一张圆角图片
 *
 *  @param radius 圆角半径
 *
 *  @return 生成一张圆角图片返回
 */
-(instancetype)cornerImageWithRadius:(CGFloat)radius;
/**
 *  根据图片名称和圆角半径生成一张圆角图片
 *
 *  @param name   图片名称
 *  @param radius 圆角半径
 *
 *  @return 生成一张圆角图片返回
 */
+(instancetype)cornerImageNamed:(NSString *)name radius:(CGFloat)radius;
@end
