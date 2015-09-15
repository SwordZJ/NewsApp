//
//  UIImage+Circle.m
//  带边框圆形图片裁剪
//
//  Created by liuzhouji on 15/7/29.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)

+(instancetype)circleImageWithImageName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color{

    // 0.加载原图
    UIImage *me = [UIImage imageNamed:name];
    // 1.生成圆环图片
    return [me circleImageWithBorderWidth:borderWidth borderColor:color];
}

-(instancetype)circleImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color{
    // 1.开启图片上下文
    CGFloat imageW = self.size.width + borderWidth * 2;
    CGFloat imageH = self.size.height + borderWidth * 2;
    CGSize newSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    
    // 2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 3.画大圆
    CGContextAddArc(ctx, self.size.width * 0.5 + borderWidth , self.size.width * 0.5 + borderWidth, self.size.width * 0.5 + borderWidth, 0, M_PI * 2, 0);
    // 3.1设置填充色为白色
    [color set];
    // 3.2填充大圆
    CGContextFillPath(ctx);
    
    // 4.画小圆
    CGRect rect = CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    // 5.裁剪
    CGContextClip(ctx);
    // 6.画图
    [self drawInRect:rect];
    // 7.取出新图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 8.结束图片上下文
    UIGraphicsEndImageContext();
    
    return newImage;


}


// 设置圆形图片
-(instancetype)circleImage{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 获取当前圆形区域
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 画圆
    CGContextAddEllipseInRect(ctx, rect);
    // 裁剪
    CGContextClip(ctx);
    // 画图
    [self drawInRect:rect];
    // 返回新图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}


+(instancetype)circleImageNamed:(NSString *)name{
    
    return [[self imageNamed:name] circleImage];

}


// 设置圆角图片
-(instancetype)cornerImageWithRadius:(CGFloat)radius{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 移动到初始点
    CGContextMoveToPoint(ctx, radius, 0);
    
    // 绘制第1条线和第1个1/4圆弧
    CGContextAddLineToPoint(ctx, width - radius, 0);
    CGContextAddArc(ctx, width - radius, radius, radius, -0.5 * M_PI, 0.0, 0);
    
    // 绘制第2条线和第2个1/4圆弧
    CGContextAddLineToPoint(ctx, width, height - radius);
    CGContextAddArc(ctx, width - radius, height - radius, radius, 0.0, 0.5 * M_PI, 0);
    
    // 绘制第3条线和第3个1/4圆弧
    CGContextAddLineToPoint(ctx, radius, height);
    CGContextAddArc(ctx, radius, height - radius, radius, 0.5 * M_PI, M_PI, 0);
    
    // 绘制第4条线和第4个1/4圆弧
    CGContextAddLineToPoint(ctx, 0, radius);
    CGContextAddArc(ctx, radius, radius, radius, M_PI, 1.5 * M_PI, 0);
    
    // 闭合路径
    CGContextClosePath(ctx);
    CGContextClip(ctx);
    [self drawInRect:CGRectMake(0, 0, width, height)];

    // 返回新图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return newImage;

}


+(instancetype)cornerImageNamed:(NSString *)name radius:(CGFloat)radius{
    
    return [[self imageNamed:name] cornerImageWithRadius:radius];
    
}
@end
