//
//  CPCTitleContentController.h
//  demo
//
//  Created by 池鹏程 on 16/9/16.
//  Copyright © 2016年 池鹏程. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface CPCtitleUnderlineController : UIViewController
@property(nonatomic,strong)UIColor* seletedColor;
@property(nonatomic,strong)UIColor* unseletedColor;
@property(nonatomic,strong)UIColor* underlineColor;


/**
 是否懒加载控制器(非常重要)
 */
@property(nonatomic,assign)BOOL isLazyVC;



/** UIScrollView */
@property (nonatomic, weak) UIScrollView *scrollView;
/** 所有按钮 */
@property (nonatomic, strong) NSMutableArray *titleButtons;
/** section为第几个气泡   row为数字 */
@property(nonatomic,strong)NSIndexPath* unreadIndexP;
@end
