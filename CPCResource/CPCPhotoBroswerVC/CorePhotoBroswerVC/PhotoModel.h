//
//  PBModel.h
//  CorePhotoBroswerVC
//
//  Created by 池鹏程 on 16/9/19.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PhotoBroswerType.h"

@interface PhotoModel : NSObject
//请为每个相册模型对象传入唯一的mid标识，因为保存图片涉及缓存等需要唯一标识,且不能为0
/** mid，保存图片缓存唯一标识，必须传 */
@property (nonatomic,assign) NSUInteger mid;





/*
 *  网络图片
 */

/** 高清图地址 */
@property (nonatomic,copy) NSString *image_HD_U;



/*
 *  本地图片
 */
@property (nonatomic,strong) UIImage *image;



//错误：当PhotoBroswerVCTypeZoom == type时，请传入源imageView控件,即需要传photoModel.sourceImageView属性
/** 源imageView */
@property (nonatomic,weak) UIImageView *sourceImageView;


/** 标题 */
@property (nonatomic,copy) NSString *title;

/** 描述 */
@property (nonatomic,copy) NSString *desc;




/** 源frame */
@property (nonatomic,assign,readonly) CGRect sourceFrame;






/** 是否从源frame放大呈现 */
@property (nonatomic,assign) BOOL isFromSourceFrame;
/*
 *  检查数组合法性
 */
+(NSString *)check:(NSArray *)photoModels type:(PhotoBroswerVCType)type;



/**
 *  读取
 *
 *  @return 是否已经保存到本地
 */
-(BOOL)read;



/*
 *  保存
 */
-(void)save;





@end
