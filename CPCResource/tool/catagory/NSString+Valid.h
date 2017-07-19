//
//  UIViewController+EXtension.m
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Valid)

/**
 是否中文


 */
- (BOOL)isChinese;



/*
 *  时间戳对应的NSDate
 */
@property (nonatomic,strong,readonly) NSDate *date;



/**
 *  32位MD5加密
 */
@property (nonatomic,copy,readonly) NSString *md5;





/**
 *  SHA1加密
 */
@property (nonatomic,copy,readonly) NSString *sha1;
@end
