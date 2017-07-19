//
//  UIImage+CPCExtension.h
//
//  Copyright © 2015年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CPCExtension)
/**
 *  返回圆形图片
 */
- (instancetype)circleImage;
/**
 *  返回圆形图片
 */
+ (instancetype)circleImage:(NSString *)name;


/**
 根据颜色生成一张尺寸为1*1的相同颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;



/**
 * 图片调整尺寸 降低像素 适合用于头像(自适应大小)
 *
 */
#define ORIGINAL_MAX_WIDTH 640.0f   //通过这个设置最大尺寸
- (UIImage *)c_imageByScalingToMaxSize;
/**
 *  变化图片到默认大小(自适应大小)
 */
- (UIImage *)c_imageByScalingAndCroppingTOTargetSize:(CGSize)targetSize;


///**
// 变化图片 (仅改变尺寸)
// */
//-(UIImage*)c_scaleOnlyToSize:(CGSize)size;



/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;





/**
 *  直接截屏
 */
+(UIImage *)cutScreen;





/**
 *  从给定UIImage和指定Frame截图：
 */
-(UIImage *)cutWithFrame:(CGRect)frame;


/**
 *  不渲染的图片
 */
+ (instancetype)imageOriginalWithName:(NSString *)imageName;


@end
