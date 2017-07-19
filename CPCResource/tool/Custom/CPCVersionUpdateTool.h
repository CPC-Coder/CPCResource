//
//  VersionUpdateTool.h
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPCVersionUpdateTool : NSObject
/**
 * 版本更新 无提示直接跳转
 *
 */
+(void)NOAlertWithNewVersion:(NSString*)newVersion vc:(UIViewController*)vc openURLstr:(NSString*)URLstr title:(NSString*)title;
/**
 * 版本更新 提示是否跳转
 *
 */
+(void)ShowAlertWithNewVersion:(NSString*)newVersion vc:(UIViewController*)vc openURLstr:(NSString*)URLstr title:(NSString*)title;
/**
 * 判断是否需要更新
 *
 */
+(BOOL)baseWithNewVersion:(NSString*)newVersion vc:(UIViewController*)vc;
@end
