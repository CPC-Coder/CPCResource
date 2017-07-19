//
//  NSTimer+Unretained.h
//  EOCOpenClassNSTimer
//
//  Created by class on 09/01/2017.
//  Copyright © 2017 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Unretained)

/**
 解除定时器循环引用的方法

 */
+(NSTimer *)c_timerWithTimeINterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeat block:( void (^)())block;
@end
