//
//  PhotoImageView.h
//  CorePhotoBroswerVC
//
//  Created by 池鹏程 on 16/9/19.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoImageView : UIImageView

/** 设置图片后的回调 */
@property (nonatomic,copy) void (^ImageSetBlock)(UIImage *image);


@property (nonatomic,assign) CGRect calF;

@end
