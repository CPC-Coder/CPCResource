//
//  CPCPlaySoundTool.h
//  03-播放多个音效文件
//
//  Created by apple on 15/11/29.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPCPlaySoundTool : NSObject

/**
 *  播放音效
 */
+ (void)playSoundWithName:(NSString *)name;






/**
 *  播放音乐
 *
 */
+ (void)playMusicWithName:(NSString *)name;


/**
 *  暂停音乐
 */
+ (void)pauseMusicWithName:(NSString *)name;



/**
 *  停止音乐
 */
+ (void)stopMusicWithName:(NSString *)name;



/**
 释放内存 结束后记得释放
 */
+(void)releaseMemory;


/**
 创建内存  刚加载这个类 自动newMemory
 */
+(void)newMemory;

@end
