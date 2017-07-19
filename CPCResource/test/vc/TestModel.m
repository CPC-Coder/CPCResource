//
//  TestModel.m
//  CPCResource
//
//  Created by 鹏程 on 17/2/24.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel





-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefine key ---%@",key);
}





-(instancetype)initTest{
    
    if (self=[super init]) {
        
        //数组要初始化
        self.mutableArr=[NSMutableArray array];
        self.arr=[NSArray array];
        self.name=@"xxx";
    }
    return self;
    
    
}
@end
