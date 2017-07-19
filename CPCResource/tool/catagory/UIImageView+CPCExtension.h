//
//  UIImageView+CPCExtension.h
//
//  Copyright © 2015年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
@interface UIImageView (CPCExtension)


/**
 设置头像(圆的)
 */
- (void)setHeader:(NSString *)url;



/**
 给相册设置图片(先根据缓存找图,没有则会根据网络情况 下载大图或小图,)

 @param originImageURL 原图
 @param thumbnailImageURL 缩略图
 @param placeholder 默认图
 @param WWANDownOrigin 是否在3G 4G情况下下载大图
 @param completedBlock 回调
 */
- (void)setOriginImage:(NSString *)originImageURL thumbnailImage:(NSString *)thumbnailImageURL placeholder:(UIImage *)placeholder isWWANDownOrigin:(BOOL)WWANDownOrigin completed:(SDWebImageCompletionBlock)completedBlock;


@end
