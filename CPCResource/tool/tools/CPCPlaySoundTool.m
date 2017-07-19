//
//  CPCPlaySoundTool.m
//  03-播放多个音效文件
//
//  Created by apple on 15/11/29.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "CPCPlaySoundTool.h"
#import <AVFoundation/AVFoundation.h>

@interface CPCPlaySoundTool ()



@end

static NSMutableDictionary *_soundIDs;
static NSMutableDictionary *_players;

@implementation CPCPlaySoundTool

+(void)releaseMemory{
    _soundIDs=nil;
    _players=nil;
}
+(void)newMemory{
    _soundIDs = [NSMutableDictionary dictionary];
    _players = [NSMutableDictionary dictionary];
}

+ (void)initialize
{
    [self newMemory];
}




+ (void)playSoundWithName:(NSString *)name
{

    //1.根据name 取字典找soundID
    
    SystemSoundID soundID = [_soundIDs[name] intValue];
    
    //2.判断soundID
    //获取对应的音效文件
    //保存到字典
    
    if (soundID == 0) {
        // 1.获取音效文件
        
        NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
        if (!path.length) {
            return;
        }
        NSURL *url = [NSURL fileURLWithPath:path];
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
        
        [_soundIDs setObject:@(soundID) forKey:name];
        
    }
    
    //3.播放
    
    AudioServicesPlaySystemSound(soundID);
    

}



//播放音乐
+ (void)playMusicWithName:(NSString *)name
{
    //1.拿着名字取字典里面找 播放器
    
    AVAudioPlayer *player = _players[name];
    
    //2.判断播放器是否存在
    //创建  加载音乐文件
    
    if (player == nil) {
        
        //1.创建播放器对象  指定音乐文件
        
        NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
        if (!path.length) {
            return;
        }
        NSURL *url = [NSURL fileURLWithPath:path];
        
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        //存在字典里面
        
        [_players setObject:player forKey:name];
        
    }
    
    
    //3.开始播放
    
    [player play];
    
}

//暂停音乐

+ (void)pauseMusicWithName:(NSString *)name
{
    //1.根据名字拿到播放器
    
    AVAudioPlayer *player = _players[name];
    
    
    //2.判断播放器是都存在  暂停
    
    if (player) {
        
        [player pause];
    }
    
}



//停止音乐

+ (void)stopMusicWithName:(NSString *)name
{
    //1.根据名字拿到播放器
    
    AVAudioPlayer *player = _players[name];
    
    
    //2.判断播放器是都存在  暂停
    
    if (player) {
        
        [player stop];
    }
    
    
}


@end
