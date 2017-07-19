//
//  VersionUpdateTool.m
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCVersionUpdateTool.h"

@implementation CPCVersionUpdateTool
+(BOOL)baseWithNewVersion:(NSString*)newVersion vc:(UIViewController*)vc{
    NSString* currentV=[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    if (![currentV isEqualToString:newVersion]) {
        
        
        [c_UserDefaults setObject:newVersion forKey:@"version"];
        [c_UserDefaults synchronize];//立即保存

        
        return YES;
    }
    return NO;
}

+(void)ShowAlertWithNewVersion:(NSString*)newVersion vc:(UIViewController*)vc openURLstr:(NSString*)URLstr title:(NSString*)title{
    NSURL* url=[NSURL URLWithString:URLstr];
    NSString* msg=[NSString stringWithFormat:@"%@有新功能推出,么么哒",title];
    BOOL needUpdata=  [CPCVersionUpdateTool baseWithNewVersion:newVersion vc:vc];
    
    
    if (needUpdata) {
        [vc Alert2WithTitle:title message:msg style:1 block:^{
            if ([c_Application canOpenURL:url]) {
                [c_Application openURL:url options:@{} completionHandler:nil];
            }else{
                c_Log(@"\n\n----------\n%s, line = %d"   , __FUNCTION__, __LINE__);
                c_Log(@"cpc--版本更新不能打开url");
            }
            
            
        }];
    } else {
        [vc Alert1WithTitle:title message:@"亲,您已经是最新的喽,么么哒" block:nil];
    }
    
    
}
+(void)NOAlertWithNewVersion:(NSString*)newVersion vc:(UIViewController*)vc openURLstr:(NSString*)URLstr title:(NSString*)title{
    
    NSURL* url=[NSURL URLWithString:URLstr];
    BOOL needUpdata=  [CPCVersionUpdateTool baseWithNewVersion:newVersion vc:vc];
    if (needUpdata) {
        [c_Application openURL:url options:@{} completionHandler:nil];
    }
}

@end
