//
//  XWScanImage.h
//  AQ-B2C
//
//  Created by 代佳宏 on 2018/8/15.
//  Copyright © 2018年 www.aiqin.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XWScanImage : NSObject
/**
 *  浏览大图
 *
 *  @param currentImageview 图片所在的imageView
 */
+(void)scanBigImageWithImageView:(UIImageView *)currentImageview;

/**
 浏览大图 - 如果图片不是在imageView上可用此方法.
 
 @param image 查看的图片对象
 @param pOldframe 当前imageview的原始尺寸->将像素currentImageview.bounds由currentImageview.bounds所在视图转换到目标视图window中，返回在目标视图window中的像素值 [currentImageview convertRect:currentImageview.bounds toView:window];
 */
+(void)scanBigImageWithImage:(UIImage *)image frame:(CGRect)pOldframe;
@end
