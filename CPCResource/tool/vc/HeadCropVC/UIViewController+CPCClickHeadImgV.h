//
//  UIViewController+CPCClickHeadImgV.h
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/14.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CPCClickHeadImgV)
//@property(nonatomic,strong)void(^headBlock)();
//@property(nonatomic,strong)void(^headBlock2)();
/**
 需要设置<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
和<CPCImageCropperViewControllerDelegate>
代理方法-imageCropper: didFinished 和 -imagePickerControllerDidCancel
 */
-(void)c_setHeadClickWithView:(UIView*)headView;
@end
