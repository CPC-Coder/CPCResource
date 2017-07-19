//
//  CPCHelper.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/12.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCHelper.h"

@implementation CPCHelper

static CPCHelper *helper = nil;
+(instancetype)shareHelper{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!helper) {
            helper=[[CPCHelper alloc] init];
        }
    });
    
    return helper;
}



- (id)init
{
    self = [super init];
    if (self) {
        [self initHelper];
    }
    return self;
}

/**
 此处给helper 添加额外设置(如 监听通知  代理 等)
 */
- (void)initHelper
{

}

/**
 添加额外设置后 就要移除监听 代理等
 */
-(void)dealloc{
    
}

@end
