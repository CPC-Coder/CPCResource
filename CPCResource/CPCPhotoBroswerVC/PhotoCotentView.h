//
//  PhotoCotentView.h
//  CorePhotoBroswerVC
//
//  Created by 池鹏程 on 2016/11/13.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoCotentView : UIView


/** 图片数组 */
@property (nonatomic,strong) NSArray *images;


@property (nonatomic,copy) void (^ClickImageBlock)(NSUInteger index);




@end
