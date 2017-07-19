//
//  PBScrollView.h
//  CorePhotoBroswerVC
//
//  Created by 池鹏程 on 16/9/19.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBScrollView : UIScrollView

@property (nonatomic,assign) NSUInteger index;


/** 照片数组 */
@property (nonatomic,strong) NSArray *photoModels;



@end
