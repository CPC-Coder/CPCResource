//
//  PBScrollView.m
//  CorePhotoBroswerVC
//
//  Created by 池鹏程 on 16/9/19.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "PBScrollView.h"

#import "PBConst.h"
#import "PhotoItemView.h"

@interface PBScrollView ()

@property (nonatomic,assign) BOOL isScrollToIndex;

@end

@implementation PBScrollView






-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    __block CGRect frame = self.bounds;

    CGFloat w = frame.size.width ;

    frame.size.width =w - PBMargin;
    
    [self.subviews enumerateObjectsUsingBlock:^(PhotoItemView *photoItemView, NSUInteger idx, BOOL *stop) {
        
        CGFloat x = w * photoItemView.pageIndex;
        
        frame.origin.x = x;
        
        [UIView animateWithDuration:.01 animations:^{
            photoItemView.frame = frame;
            
        }];
        
    }];
    
    
    if(!_isScrollToIndex){
        
        //显示第index张图
        CGFloat offsetX = w * _index;
        
        [self setContentOffset:CGPointMake(offsetX, 0) animated:NO];
        
        _isScrollToIndex = YES;
    }
    
}



-(void)setPhotoModels:(NSArray *)photoModels{
    
    _photoModels = photoModels;
}




@end
