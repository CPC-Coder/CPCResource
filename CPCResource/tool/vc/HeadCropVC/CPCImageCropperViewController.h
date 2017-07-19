//
//  NJImageCropperViewController.h
//  HeadPortrait
//
//  Created by 池鹏程 on 2016/11/14.
//  Copyright © 2016年 池鹏程. All rights reserved.
//


#import <UIKit/UIKit.h>

@class CPCImageCropperViewController;

@protocol CPCImageCropperViewControllerDelegate <NSObject>

- (void)imageCropper:(CPCImageCropperViewController *) cropperViewController didFinished:(UIImage *)editedImage;
- (void)imageCropperDidCancel:(CPCImageCropperViewController *)cropperViewControlelr;

@end

@interface CPCImageCropperViewController : UIViewController

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) id<CPCImageCropperViewControllerDelegate> delegate;
@property (nonatomic, assign) CGRect cropFrame;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end
