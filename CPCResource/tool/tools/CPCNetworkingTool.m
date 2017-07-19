//
//  CPCNetworkingTool.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/7.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCNetworkingTool.h"





@implementation CPCNetworkingTool
#pragma mark -
#pragma mark 单例方法
+ (instancetype)sharedTool{
    
    static CPCNetworkingTool *tool;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 设置网络会话统一配置
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        // 超常时长
        config.timeoutIntervalForRequest = 30;
        
        tool = [[self alloc] initWithSessionConfiguration:config];
        
        
        
        //支持的序列化格式
        tool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    
    return tool;
}
#pragma mark -
#pragma mark 根据参数和网址  拼接URL
+(NSString*)getURLWithparams:(NSDictionary*)params  service:(NSString*)service isBackFullPath:(BOOL)isFull{
    
    
    NSMutableString *strM = [NSMutableString string];
    
    
    [strM appendString:service];
    
    
    // 将字典中的参数取出来!拼接成字符串! 参数和参数之间以 & 间隔
    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        // nameKey: 服务器接收参数的 key 值.
        // nameValue : 上传给服务器的参数内容.
        NSString *nameKey = key;
        NSString *nameValue = obj;
        
        [strM appendString:[NSString stringWithFormat:@"&%@=%@",nameKey,nameValue]];
        
    }];
    
    
    c_Log(@"发送%@请求\nURL如下:\n%@\n\n",service,[c_URL stringByAppendingString:strM]);
    
    
    if (isFull) {
        return [c_URL stringByAppendingString:strM];
    } else {
        return strM;
    }
    
    
}

#pragma mark -
#pragma mark 根方法-网络数据请求成功后处理数据(*经常改动*)

-(NSDictionary*)successWithDict:(NSData *)responseObject{
    //解析数据
    //NSDictionary * rootDict =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary * rootDict=(NSDictionary*)responseObject;
    
    //以下自定义喽
    NSDictionary *data = [rootDict objectForKey:@"data"];
    NSNumber *ret =[rootDict objectForKey:@"ret"];
    
    
    //200  服务器连接成功
    if([ret isEqualToNumber:@200]){
        
        
        NSDictionary *infos = [data objectForKey:@"info"];
        NSNumber *code =[data objectForKey:@"code"];
        if ([code isEqualToNumber:@0]){
            //请求成功
            return infos;
        }
        else{//ret为200  但code不为0   显示服务器发来的状态
            [SVProgressHUD showInfoWithStatus:[data objectForKey:@"msg"]];
        }
        
        
        
    }
    //服务器连接失败
    else if([ret isEqualToNumber:@406]){
        
        [SVProgressHUD showInfoWithStatus:@"账号或密码异常,请重新登录"];
        
        
    }else if([ret isEqualToNumber:@400]){
        [SVProgressHUD showInfoWithStatus:@"亲,您填写错误了吧"];
    }else{
        c_Log(@"\n\n服务器问题,请稍后重试\n%@\n\n",rootDict);
        [SVProgressHUD showInfoWithStatus:@"服务器问题,请稍后重试"];
    }
    
    
    
    return nil;
    
}
//根方法-成功后执行
-(void)baseSuccess:(NSURLSessionDataTask *)task responseObject:(id)responseObject success:(CPCSuccessBlock)success{
    [SVProgressHUD dismiss];
    NSDictionary*  infos=[self successWithDict:responseObject];
    if (infos&&success) {
        success(infos,task);
        
    }
}
//根方法-失败后执行
-(void)baseFailure:(NSURLSessionDataTask *)task error:(NSError*)error failure:(CPCFailureBlock)failure{
    if (failure) {
        failure(error);
    }
    [SVProgressHUD showInfoWithStatus:@"连接服务器失败"];
}

#pragma mark -
#pragma mark 根方法-网络连接

-(void)baseToolWithRequest:(CPCMethod)method  Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success  failure:(CPCFailureBlock)failure isShowHUD:(BOOL)isShow userActivity:(BOOL)isCan{
    
    NSString* url=[NSString stringWithFormat:@"%@%@",c_URL,service];
   
    [CPCNetworkingTool getURLWithparams:params service:service isBackFullPath:NO];
    
    if (isShow) {
        [SVProgressHUD show];
    }
    if (isCan) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
    
    
    if (method == post) {//post方法
        [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            [self baseSuccess:task responseObject:responseObject success:success];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self baseFailure:task error:error failure:failure];
        }];
    } else if(method == get){//get方法
        [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            [self baseSuccess:task responseObject:responseObject success:success];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self baseFailure:task error:error failure:failure];
        }];
    }
    

   
}
#pragma mark -
#pragma mark 网络连接--公开方法
+(CPCNetworkingTool*)postService:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)block{
    CPCNetworkingTool*  tool=[self sharedTool];
    [tool baseToolWithRequest:post Service:service params:params success:block failure:nil isShowHUD:NO userActivity:NO];
    return tool;
}

+(CPCNetworkingTool*)getService:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)block{
    CPCNetworkingTool*  tool=[self sharedTool];
    [tool baseToolWithRequest:get Service:service params:params success:block failure:nil isShowHUD:NO userActivity:NO];
    return tool;
}

+(CPCNetworkingTool*)request:(CPCMethod)method  Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success  failure:(CPCFailureBlock)failure isShowHUD:(BOOL)isShow userActivity:(BOOL)isCan{
    CPCNetworkingTool*  tool=[self sharedTool];
    [tool baseToolWithRequest:method Service:service params:params success:success failure:failure isShowHUD:isShow userActivity:isCan];
    return tool;
}


#pragma mark -
#pragma mark 根方法 上传文件
-(void)baseToolUploadWithData:(NSData*)data fileName:(NSString*)fileName  mimeType:(NSString*)mineType Service:(NSString*)service params:(NSDictionary*)params  success:(CPCSuccessBlock)success  failure:(CPCFailureBlock)failure{
    
    NSString* url=[NSString stringWithFormat:@"%@%@",c_URL,service];
    
    //formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
    [self POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
        
        
        //上传
        /*
         此方法参数
         1. 要上传的[二进制数据]
         2. 对应网站上[upload.php中]处理文件的[字段"file"]
         3. 要保存在服务器上的[文件名]
         4. 上传文件的[mimeType]
         */
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:mineType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //        //上传进度
        //        // @property int64_t totalUnitCount;     需要下载文件的总大小
        //        // @property int64_t completedUnitCount; 当前已经下载的大小
        //        //
        //        // 给Progress添加监听 KVO
        //        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        //        // 回到主队列刷新UI,用户自定义的进度条
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //            self.progressView.progress = 1.0 *
        //            uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        //        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        c_Log(@"%@上传成功 %@",fileName, responseObject);
        [self baseSuccess:task responseObject:responseObject success:success];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        c_Log(@"%@上传失败 %@",fileName, error);
        [self baseFailure:task error:error failure:failure];
    }];
    
    
}

#pragma mark -
#pragma mark 上传文件--公开方法
+(CPCNetworkingTool*)uploadWithImg:(UIImage*)img fileName:(NSString*)fileName Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success{
    
   CPCNetworkingTool* tool= [CPCNetworkingTool sharedTool];
    
    NSData *data = UIImageJPEGRepresentation(img, 1.0);
    [tool baseToolUploadWithData:data fileName:fileName mimeType:@"image/jpeg" Service:service params:params success:success failure:nil];
    return tool;
}
+(CPCNetworkingTool*)baseToolUploadWithData:(NSData*)data fileName:(NSString*)fileName  mimeType:(NSString*)mineType Service:(NSString*)service params:(NSDictionary*)params  success:(CPCSuccessBlock)success  failure:(CPCFailureBlock)failure{
    
    CPCNetworkingTool* tool= [CPCNetworkingTool sharedTool];
    [tool baseToolUploadWithData:data fileName:fileName mimeType:mineType Service:service params:params success:success failure:failure];
    return tool;
    
    
}
+(void)uploadWithImgArr:(NSArray*)arr  fileName:(NSString*)fileName  Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success{
    CPCNetworkingTool* tool= [CPCNetworkingTool sharedTool];
    for (int i=0; i<arr.count; i++) {
        
        NSData* data=UIImageJPEGRepresentation(arr[i], 1.0);
        NSString* name=[fileName stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        
        [tool baseToolUploadWithData:data fileName:name mimeType:@"image/jpeg"  Service:service params:params success:success failure:nil];
    }
    
}
#pragma mark -
#pragma mark 网络情况
+ (BOOL)isNetWorkingResponse:(void (^)())response orNotResponse:(void (^)())responseNot {
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                break;
        }
    }];
    
    // 3.开始监控
    [mgr startMonitoring];
    
    if ([AFNetworkReachabilityManager sharedManager].isReachable) {
        if (response) {
            response();
        }
    } else {
        if (responseNot) {
            responseNot();
        }
    }
    
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}
@end
