//
//  TestModel.h
//  CPCResource
//
//  Created by 鹏程 on 17/2/24.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject
@property(nonatomic,strong)NSMutableArray* mutableArr;

@property(nonatomic,copy)NSArray* arr;
@property(nonatomic,copy)NSString* name;


//测试
-(instancetype)initTest;


/**
 //KVC的应用  简化冗余代码

 */
-(id)initWithDic:(NSDictionary *)dic;

@end
