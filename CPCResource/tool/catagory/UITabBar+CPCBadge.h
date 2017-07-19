//
//  UITabBar+CPCBadge.h
//  treePOD
//
//  Created by 池鹏程 on 2016/11/11.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (CPCBadge)

/**
 显示小红点

 */
- (void)c_showBadgeOnItemIndex:(int)index;  

/**
 隐藏小红点

 */
- (void)c_hideBadgeOnItemIndex:(int)index;
@end
