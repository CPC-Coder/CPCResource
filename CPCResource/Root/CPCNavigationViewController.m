//
//  VersionUpdateTool.m
//  treePOD
//
//  Created by 池鹏程 on 2016/11/3.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCNavigationViewController.h"
#import "CPCTabBar.h"
//#import <objc/runtime.h>

@interface CPCNavigationViewController ()<UIGestureRecognizerDelegate>

@end




@implementation CPCNavigationViewController

+ (void)initialize{
    
    if (self == [CPCNavigationViewController class]) { // 当前类
       
      UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[CPCNavigationViewController class]]];
       // UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        //用图片设置 bar
        [bar setBackgroundImage:[UIImage  imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
        //去掉下划线
        [bar setShadowImage:[UIImage new]];
        
        // 设置导航条字体
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
        dict[NSForegroundColorAttributeName] =[UIColor colorWithRed:0.322 green:0.792 blue:0.482 alpha:1.00];
        [bar setTitleTextAttributes:dict];
        
        
        
        
        
        
        
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIScreenEdgePanGestureRecognizer *gesture =(UIScreenEdgePanGestureRecognizer*) self.interactivePopGestureRecognizer;
    

    NSArray *targets = [gesture valueForKeyPath:@"_targets"];

    // 取出target
    id target = [targets[0] valueForKeyPath:@"_target"];
    
    // 禁止系统的
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}
#pragma mark - UIGestureRecognizerDelegate
// 返回YES手势可以交互, 返回NO不能交互(自控制大于才可以交互)
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    return self.childViewControllers.count > 1;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.childViewControllers.count > 0) {
        
        //设置返回按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];

//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        backButton.frame=CGRectMake(0, 0, 30, 30);
        //backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        
        
        
        
        // 非跟控制器就隐藏底部TabBar
       viewController.hidesBottomBarWhenPushed = YES;

        
        

    }

    
    [super pushViewController:viewController animated:animated];
    
    
    
    
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
    
    
}

@end
