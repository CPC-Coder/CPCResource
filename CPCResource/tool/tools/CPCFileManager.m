//
//  CPCFileManager.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/7.
//  Copyright © 2016年 池鹏程. All rights reserved.
//
#import "CPCFileManager.h"

@implementation CPCFileManager

/// 把对象归档存到沙盒里
+(void)saveObject:(id)object byFileName:(NSString*)fileName
{
    
    NSString*  customPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"];
    NSFileManager *mgr = [NSFileManager defaultManager];
    if (![mgr fileExistsAtPath:customPath]) {//如果文件不存在 则创建文件夹
        [mgr createDirectoryAtPath:customPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    
    NSString *path  = [self appendFilePath:fileName];
    
    
    
    //c_Log(@"保存fileName %@",fileName);
   [NSKeyedArchiver archiveRootObject:object toFile:path];
    //c_Log(@"\n%@\n%d",path,bl);
    
}
/// 通过文件名从沙盒中找到归档的对象
+(id)getObjectByFileName:(NSString*)fileName
{
    
    NSString *path  = [self appendFilePath:fileName];

    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

// 根据文件名删除沙盒中的 plist 文件
+(void)removeFileByFileName:(NSString*)fileName
{
    NSString *path  = [self appendFilePath:fileName];

    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}




/// 拼接文件路径
+(NSString*)appendFilePath:(NSString*)fileName
{
    NSString* path=c_CustomCacheFile;
    
    
     NSString *file = [NSString stringWithFormat:@"%@/%@.archiver",path,fileName];

    return file;
}

/// 存储用户偏好设置 到 NSUserDefults
+(void)saveUserData:(id)data forKey:(NSString*)key
{
    if (data)
    {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
/// 读取用户偏好设置
+(id)readUserDataForKey:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];

}
/// 删除用户偏好设置
+(void)removeUserDataForkey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}






+ (void)removeDirectoryPath:(NSString *)directoryPath
{
    // 获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 抛异常
        // name:异常名称
        // reason:报错原因
        NSException *excp = [NSException exceptionWithName:@"pathError" reason:@"笨蛋 需要传入的是文件夹路径,并且路径要存在" userInfo:nil];
        [excp raise];
        
    }
    
    // 获取cache文件夹下所有文件,不包括子路径的子路径
    NSArray *subPaths = [mgr contentsOfDirectoryAtPath:directoryPath error:nil];
    
    for (NSString *subPath in subPaths) {
        // 拼接完成全路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        
        // 删除路径
        [mgr removeItemAtPath:filePath error:nil];
    }
    
}

// 自己去计算SDWebImage做的缓存
+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSString* fileSize))completion
{
    
    // 获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 抛异常
        // name:异常名称
        // reason:报错原因
        NSException *excp = [NSException exceptionWithName:@"pathError" reason:@"笨蛋 需要传入的是文件夹路径,并且路径要存在" userInfo:nil];
        [excp raise];
        
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 获取文件夹下所有的子路径,包含子路径的子路径
        NSArray *subPaths = [mgr subpathsAtPath:directoryPath];
        
        NSInteger totalSize = 0;
        
        for (NSString *subPath in subPaths) {
            // 获取文件全路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            
            // 判断隐藏文件
            if ([filePath containsString:@".DS"]) continue;
            
            // 判断是否文件夹
            BOOL isDirectory;
            // 判断文件是否存在,并且判断是否是文件夹
            BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExist || isDirectory) continue;
            
            // 获取文件属性
            // attributesOfItemAtPath:只能获取文件尺寸,获取文件夹不对,
            NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
            
            // 获取文件尺寸
            NSInteger fileSize = [attr fileSize];
            
            totalSize += fileSize;
        }
        
        
        NSString* fileSize=[self sizeStrWithInt:totalSize];
        
        // 计算完成回调
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(fileSize);
            }
        });
        
        
        
    });
    
    
}



// 获取缓存尺寸字符串
+(NSString *)sizeStrWithInt:(NSInteger)totalSize
{
   
    NSString *sizeStr  ;
    if (totalSize > 1000 * 1000 *1000) {
        CGFloat sizeF = totalSize / 1000.0 / 1000.0/1000.0;
        sizeStr = [NSString stringWithFormat:@"%.1fGB",sizeF];
    }
    // MB KB B
   else if (totalSize > 1000 * 1000) {
        // MB
        CGFloat sizeF = totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%.1fMB",sizeF];
    } else if (totalSize > 1000) {
        // KB
        CGFloat sizeF = totalSize / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%.1fKB",sizeF];
    } else if (totalSize > 0) {
        // B
        sizeStr = [NSString stringWithFormat:@"%.ldB",totalSize];
    }
    
    return sizeStr;
}


@end
