//
//  UIViewController+EXtension.h
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CPCExtension)
-(void)Alert2WithTitle:(NSString*)title message:(NSString*)message style:(UIAlertControllerStyle)style block:(void(^)())block;

-(void)Alert1WithTitle:(NSString*)title message:(NSString*)message block:(void(^)())block;

@end
