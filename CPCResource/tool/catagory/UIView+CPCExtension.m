//
//  
//
//
//  Created by timetree on 15/11/6.
//  Copyright © 2015年 池鹏程 All rights reserved.
//

#import "UIView+CPCExtension.h"

@implementation UIView (CPCExtension)

- (CGSize)c_size
{
    return self.frame.size;
}

- (void)setC_size:(CGSize)c_size
{
    CGRect frame = self.frame;
    frame.size = c_size;
    self.frame = frame;
}

- (CGFloat)c_width
{
    return self.frame.size.width;
}

- (CGFloat)c_height
{
    return self.frame.size.height;
}

- (void)setC_width:(CGFloat)c_width
{
    CGRect frame = self.frame;
    frame.size.width = c_width;
    self.frame = frame;
}

- (void)setC_height:(CGFloat)c_height
{
    CGRect frame = self.frame;
    frame.size.height = c_height;
    self.frame = frame;
}

- (CGFloat)c_x
{
    return self.frame.origin.x;
}

- (void)setC_x:(CGFloat)c_x
{
    CGRect frame = self.frame;
    frame.origin.x = c_x;
    self.frame = frame;
}

- (CGFloat)c_y
{
    return self.frame.origin.y;
}

- (void)setC_y:(CGFloat)c_y
{
    CGRect frame = self.frame;
    frame.origin.y = c_y;
    self.frame = frame;
}

- (CGFloat)c_centerX
{
    return self.center.x;
}

- (void)setC_centerX:(CGFloat)c_centerX
{
    CGPoint center = self.center;
    center.x = c_centerX;
    self.center = center;
}

- (CGFloat)c_centerY
{
    return self.center.y;
}

- (void)setC_centerY:(CGFloat)c_centerY
{
    CGPoint center = self.center;
    center.y = c_centerY;
    self.center = center;
}

- (CGFloat)c_right
{
//    return self.xmg_x + self.xmg_width;
    return CGRectGetMaxX(self.frame);
}
-(CGFloat)c_top{
    return self.c_y;
}
-(void)setC_top:(CGFloat)c_top{
    self.c_y=c_top;
}
-(CGFloat)c_left{
    return self.c_x;
}
-(void)setC_left:(CGFloat)c_left{
    self.c_x=c_left;
}

- (CGFloat)c_bottom
{
//    return self.xmg_y + self.xmg_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setC_right:(CGFloat)c_right
{
    self.c_x = c_right - self.c_width;
}

- (void)setC_bottom:(CGFloat)c_bottom
{
    self.c_y = c_bottom - self.c_height;
}

+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}



#pragma mark  圆角处理
-(void)setRadius:(CGFloat)r{
    
    if(r<=0) r=self.frame.size.width * .5f;
    
    //圆角半径
    self.layer.cornerRadius=r;
    
    //强制
    self.layer.masksToBounds=YES;
}

-(CGFloat)radius{
    c_Log(@"radius可能存在错误");
    return self.layer.cornerRadius;
}



-(void)c_cornerRadius:(CGFloat)Radius BorderWidth:(CGFloat)Width color:(UIColor*)Color{
    

    [self.layer setCornerRadius:(Radius)];
    [self.layer setMasksToBounds:YES];
    [self.layer setBorderWidth:(Width)];
    [self.layer setBorderColor:[Color CGColor]];
}

-(void)c_cornerRadiusQuickly:(CGFloat)radius{
    
    [self c_cornerRadius:radius BorderWidth:0.5 color:[UIColor lightGrayColor]];
    
}


-(void)c_setFrameWithW:(CGFloat)w h:(CGFloat)h center:(CGPoint)center{

    self.frame=[UIView c_frameWithW:w h:h center:center];
}
+(CGRect)c_frameWithW:(CGFloat)w h:(CGFloat)h center:(CGPoint)center{
    CGFloat x = center.x - w *.5f;
    CGFloat y = center.y - h * .5f;
    CGRect frame = (CGRect){CGPointMake(x, y),CGSizeMake(w, h)};
    return frame;
}




/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width{
    
    UIView *line=[[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor=color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views=NSDictionaryOfVariableBindings(line);
    NSDictionary *metrics=@{@"w":@(width),@"y":@(self.c_height - width),@"x":@(self.c_width - width)};
    
    
    NSString *vfl_H=@"";
    NSString *vfl_W=@"";
    
    //上
    if(UIViewBorderDirectTop==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:|-0-[line(==w)]";
    }
    
    //左
    if(UIViewBorderDirectLeft==direct){
        vfl_H=@"H:|-0-[line(==w)]";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    //下
    if(UIViewBorderDirectBottom==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:[line(==w)]-0-|";
    }
    
    //右
    if(UIViewBorderDirectRight==direct){
        vfl_H=@"H:|-x-[line(==w)]";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_H options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_W options:0 metrics:metrics views:views]];
}
@end
