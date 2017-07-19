//
//  NSString+XMGExtension.h
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CPCExtension)





/**
 计算文本 文字的size

 */
- (CGSize)c_stringSizeWithContentSize:(CGSize)contentSize font:(UIFont *)font;

/**
 (全部)文件内容大小 

 
 */
- (unsigned long long)c_fileSize;




/*
 *  document根文件夹
 */
+(NSString *)c_documentFolder;


/*
 *  caches根文件夹
 */
+(NSString *)c_cachesFolder;




/**
 *  生成子文件夹
 *
 *  如果子文件夹不存在，则直接创建；如果已经存在，则直接返回
 *
 *  @param subFolder 子文件夹名
 *
 *  @return 文件夹路径
 */
-(NSString *)c_createSubFolder:(NSString *)subFolder;





@end
