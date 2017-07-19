//
//  AppDelegate.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/7.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "AppDelegate.h"
#import "CPCNavigationViewController.h"
#import "CPCVersionUpdateTool.h"
#import "CPCTopWindow.h"



// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif


@interface AppDelegate ()<UITabBarControllerDelegate>
/** 记录上一次选中的子控制器的索引 */
@property (nonatomic, assign) NSUInteger lastSelectedIndex;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//显示窗口配置
    
    //登陆状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:n_loginChange
                                               object:nil];
    //是否自动登录
    /********************     *******************/
    BOOL isAutoLogin =YES;
    /********************     *******************/
    if (isAutoLogin){
        
        [[NSNotificationCenter defaultCenter] postNotificationName:n_loginChange object:@YES];
    }
    else
    {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:n_loginChange object:@NO];
        
    }
    
    
    
    //工具类 单例 初始化
    [self setup];
    
    
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark -
#pragma mark    工具类 单例 初始化
-(void)setup{
    //IQKeyboardManager
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    //网络连接
    [CPCNetworkingTool sharedTool];
    //点击状态  刷新
    [CPCTopWindow show];
    
}

#pragma mark -
#pragma mark loginStateChange  登陆状态改变
- (void)loginStateChange:(NSNotification *)notification{
    
    BOOL loginSuccess = [notification.object boolValue];
    //loginSuccess=YES;
    if (loginSuccess) {//登陆成功加载主窗口控制器
        
        
        if (self.mainVC == nil) {
            self.mainVC = [[MainViewController alloc] init];
            
        }
        
        
        self.window.rootViewController=self.mainVC;
        //[CPCHelper shareHelper].mainVC=self.mainVC;
        //设置tabBar代理 监听重复点击
        self.mainVC.delegate=self;

        
        
        
        
    }
    else{//登陆失败  跳转  登陆页面控制器
        [c_UserDefaults removeObjectForKey:@"uid"];
        [c_UserDefaults removeObjectForKey:@"sign"];
        self.mainVC=nil;
        //[CPCHelper shareHelper].mainVC=nil;

        self.window.rootViewController=[[CPCNavigationViewController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    }
    
    
}


#pragma mark - <UITabBarControllerDelegate>(重复点击tabBar发出通知)
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == self.lastSelectedIndex) { // 重复点击了同一个TabBar按钮
        // 发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:n_tabBarButtonDidRepeatClick object:nil];
    }
    
    // 记录目前选中的索引
    self.lastSelectedIndex = tabBarController.selectedIndex;
}








#pragma mark -
#pragma mark    以下通知

//接收到远程通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    c_Log(@"\n\n\n接收到远程通知\n%@\n\n\n",userInfo);
    
    
  
}
// 接收到远程通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    
}


//收到本地通知

- (void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
    
}







@end
