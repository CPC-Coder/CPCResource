//
//  NSDictionary+CPCLog.m
//  CPCResource
//
//  Created by 鹏程 on 17/3/1.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import "NSDictionary+CPCLog.h"

@implementation NSDictionary (CPCLog)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}
@end




