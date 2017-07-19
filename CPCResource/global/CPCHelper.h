//
//  CPCHelper.h
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/12.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"

@interface CPCHelper : NSObject

//注意helper是全局变量助手  故所有属性用weak
@property(nonatomic,weak)MainViewController* mainVC;







+ (instancetype)shareHelper;
@end
