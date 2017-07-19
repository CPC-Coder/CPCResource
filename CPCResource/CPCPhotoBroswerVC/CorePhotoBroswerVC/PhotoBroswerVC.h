//
//  PhotoBroswerVC.h
//  CorePhotoBroswer
//
//  Created by 池鹏程 on 16/9/19.
//  Copyright © 2016年 池鹏程. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "PhotoModel.h"
#import "PhotoBroswerType.h"






@interface PhotoBroswerVC : UIViewController





+(void)show:(UIViewController *)handleVC type:(PhotoBroswerVCType)type index:(NSUInteger)index isEasy:(BOOL)isEasy photoModelBlock:(NSArray *(^)())photoModelBlock;

+(void)showBig:(UIViewController *)handleVC imgV:(UIImageView*)imgV;
@end
