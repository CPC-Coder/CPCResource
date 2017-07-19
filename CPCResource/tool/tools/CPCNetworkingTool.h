//
//  CPCNetworkingTool.h
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/7.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
typedef NS_ENUM(NSUInteger, CPCMethod) {
    post=0,
    get,
    
    
};
typedef void(^CPCBlock)(NSDictionary* infos);
typedef void(^CPCSuccessBlock)(NSDictionary* infos,NSURLSessionDataTask *  task);
typedef void(^CPCFailureBlock) (NSError* error);




@interface CPCNetworkingTool : AFHTTPSessionManager
/**
 *  单例方法
 *
 */
+ (instancetype)sharedTool;
/**
 *  根据参数和网址  拼接URL
 *
 */
+(NSString*)getURLWithparams:(NSDictionary*)params  service:(NSString*)service isBackFullPath:(BOOL)isFull;


/**
 *  常用网络请求
 *
 */
+(CPCNetworkingTool*)postService:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)block;
+(CPCNetworkingTool*)getService:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)block;
+(CPCNetworkingTool*)request:(CPCMethod)method  Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success  failure:(CPCFailureBlock)failure isShowHUD:(BOOL)isShow userActivity:(BOOL)isCan;
/**
 *  上传头像 fileName(可瞎写 或者后端有要求)
 *
 */
+(CPCNetworkingTool*)uploadWithImg:(UIImage*)img fileName:(NSString*)fileName Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success;

/**
 *  多图片上传 fileName(可瞎写 或者后端有要求)
 */
+(void)uploadWithImgArr:(NSArray*)arr  fileName:(NSString*)fileName  Service:(NSString*)service params:(NSDictionary*)params success:(CPCSuccessBlock)success;
//上传文件
+(CPCNetworkingTool*)baseToolUploadWithData:(NSData*)data fileName:(NSString*)fileName  mimeType:(NSString*)mineType Service:(NSString*)service params:(NSDictionary*)params  success:(CPCSuccessBlock)success  failure:(CPCFailureBlock)failure;

/**
 *  网络状态
 *
 */
+ (BOOL)isNetWorkingResponse:(void (^)())response orNotResponse:(void (^)())responseNot;
@end
