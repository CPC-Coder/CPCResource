//
//  UIView+CPCExtension.h
//
//
//  Created by timetree on 15/11/6.
//  Copyright © 2015年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CPCExtension)
@property (nonatomic, assign) CGSize c_size;
@property (nonatomic, assign) CGFloat c_width;
@property (nonatomic, assign) CGFloat c_height;
@property (nonatomic, assign) CGFloat c_x;
@property (nonatomic, assign) CGFloat c_y;
@property (nonatomic, assign) CGFloat c_centerX;
@property (nonatomic, assign) CGFloat c_centerY;

@property (nonatomic, assign) CGFloat c_right;
@property (nonatomic, assign) CGFloat c_bottom;
@property(nonatomic,assign)CGFloat c_left;//left是自己加
@property(nonatomic,assign)CGFloat c_top;//自己加的



@property (nonatomic,assign) CGFloat radius;







+ (instancetype)viewFromXib;

- (BOOL)intersectWithView:(UIView *)view;




/**
 设置 view 圆角和边框
 */
-(void)c_cornerRadius:(CGFloat)Radius BorderWidth:(CGFloat)Width color:(UIColor*)Color;
/**
 快速设置 view 圆角和边框
 */
-(void)c_cornerRadiusQuickly:(CGFloat)radius;


/**
 设置 宽 高 中心


 */
-(void)c_setFrameWithW:(CGFloat)w h:(CGFloat)h center:(CGPoint)center;
+(CGRect)c_frameWithW:(CGFloat)w h:(CGFloat)h center:(CGPoint)center;








typedef enum{
    
    //上
    UIViewBorderDirectTop=0,
    
    //左
    UIViewBorderDirectLeft,
    
    //下
    UIViewBorderDirectBottom,
    
    //右
    UIViewBorderDirectRight,
    
    
}UIViewBorderDirect;
/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width;

@end
