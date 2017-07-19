//
//  UIViewController+EXtension.m
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "UIViewController+CPCExtension.h"

@implementation UIViewController (CPCExtension)
-(void)Alert2WithTitle:(NSString*)title message:(NSString*)message style:(UIAlertControllerStyle)style block:(void(^)())block{
    UIAlertController* vc=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    
//    UIAlertActionStyleDefault = 0,
//    UIAlertActionStyleCancel,
//    UIAlertActionStyleDestructive
    UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        block();
    }];
    UIAlertAction* cancer=[UIAlertAction actionWithTitle:@"取消" style:0 handler:nil];
    
    
    [vc addAction:cancer];
    [vc addAction:sure];
    [self presentViewController:vc animated:YES completion:nil];
    
}





-(void)Alert1WithTitle:(NSString*)title message:(NSString*)message block:(void(^)())block{
    
    UIAlertController* vc=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    //    UIAlertActionStyleDefault = 0,
    //    UIAlertActionStyleCancel,
    //    UIAlertActionStyleDestructive
    UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block();
    }];
    
    
    
    
    [vc addAction:sure];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

@end
