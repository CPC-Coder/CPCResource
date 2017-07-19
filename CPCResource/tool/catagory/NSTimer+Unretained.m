//
//  NSTimer+Unretained.m
//  EOCOpenClassNSTimer
//
//  Created by class on 09/01/2017.
//  Copyright © 2017 池鹏程. All rights reserved.
//

#import "NSTimer+Unretained.h"

@implementation NSTimer (Unretained)
+(NSTimer *)c_timerWithTimeINterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeat block:( void (^)())block{
    return [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(blockAction:) userInfo:block repeats:repeat];
}
+(void)blockAction:(NSTimer *)timer{
    void (^block)() = [timer userInfo];
    if(block){
        block();
    }
}

@end
