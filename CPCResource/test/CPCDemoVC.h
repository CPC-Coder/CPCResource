//
//  CPCDemoVC.h
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/13.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCTitleContentController.h"
#import "CPCtitleUnderlineController.h"



#define demo 2

#if demo==1

/**
 未优化
 */
@interface CPCDemoVC  : CPCTitleContentController
#else

/**
 这个已经优化了(scrollV已经优化)(可以设置是否懒加载)
 */
@interface CPCDemoVC  : CPCtitleUnderlineController
#endif

@end
