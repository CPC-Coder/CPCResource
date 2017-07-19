//
//  MainViewController.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/12.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "MainViewController.h"
#import "CPCNavigationViewController.h"
#import "CPCUserVC.h"
#import "CPCDemoVC.h"
#import "CPCTabBar.h"
#import "PhotoDemo.h"
#import "NewHomeVC.h"
#import "CalculatorVC.h"
#import "TestVC.h"












@interface MainViewController () <UIAlertViewDelegate>

@end

@implementation MainViewController


#pragma mark -
#pragma mark 预加载
- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // 1.修改文字属性
    [self setupItemTitleTextAttributes];
    
    // 2.添加所有的自控制器
    [self setupAllChildController];
    
    /**** 更换TabBar ****/
    [self setupTabBar];//这句自定义tabBar 中间多了发布按钮(注释就没有中间按钮)
    
    
    self.selectedIndex = 0;
    
    //[CPCHelper shareHelper].mainVC=self;
    
    
   
    
    
    
    
}




//没有移除通知中心  因为还要用
- (void)dealloc
{
    
}
#pragma mark -
#pragma mark 自己的tablebar
#pragma mark - 添加所有的自控制器
- (void)setupAllChildController{
    
    
    
    CPCDemoVC* vc3=[CPCDemoVC new];
    vc3.title=@"池鹏程制作";
    vc3.view.backgroundColor=c_RandomColor;
    CPCNavigationViewController* nav3=[[CPCNavigationViewController alloc] initWithRootViewController:vc3];
    [self setupOneChildController:nav3 image:[UIImage imageNamed:@"circle"] seleImage:[UIImage imageNamed:@"circle_hit"] title:@"你猜"];
    

    UIViewController* vc1=[TestVC new];
    vc1.title=@"测试VC";
    vc1.view.backgroundColor=[UIColor whiteColor];
    CPCNavigationViewController* nav1=[[CPCNavigationViewController alloc] initWithRootViewController:vc1];
    [self setupOneChildController:nav1 image:[UIImage imageNamed:@"circle"] seleImage:[UIImage imageNamed:@"circle_hit"] title:@"测试"];
    
   
    

    

    
    PhotoDemo* vc2=[PhotoDemo new];
    vc2.title=@"池鹏程制作2";
    
    CPCNavigationViewController* nav2=[[CPCNavigationViewController alloc] initWithRootViewController:vc2];
    [self setupOneChildController:nav2 image:[UIImage imageNamed:@"circle"] seleImage:[UIImage imageNamed:@"circle_hit"] title:@"你猜"];
    
    
    
    
    
    
    
    CPCUserVC* vc4=[[CPCUserVC alloc] init];
    
    CPCNavigationViewController* nav4=[[CPCNavigationViewController alloc] initWithRootViewController:vc4];
    vc4.title=@"池鹏程制作";
    [self setupOneChildController:nav4 image:[UIImage imageNamed:@"circle"] seleImage:[UIImage imageNamed:@"circle_hit"] title:@"你猜"];
    
    
    
    
    
}

- (void)setupOneChildController:(UIViewController *)vc image:(UIImage *)image seleImage:(UIImage *)selectedImage title:(NSString *)title
{
    
    
    vc.tabBarItem.title = title;
    
    
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
    
    
    
}



/**
 *  设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
   // normalAttrs[NSForegroundColorAttributeName] =c_CommonGray;
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] =c_CommonBgColor;
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}












/**
 *  更换TabBar
 */
- (void)setupTabBar
{
    [self setValue:[[CPCTabBar alloc] init] forKeyPath:@"tabBar"];
}






                                              
                                              

@end
