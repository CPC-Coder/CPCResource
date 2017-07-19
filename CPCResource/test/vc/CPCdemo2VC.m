//
//  CPCdemo2VC.m
//  CPCResource
//
//  Created by 鹏程 on 17/2/24.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import "CPCdemo2VC.h"
#import "TestModel.h"




@interface CPCdemo2VC ()
@property(nonatomic,strong)NSMutableArray* modelArr;
@property(nonatomic,copy)TestModel *model;
@end

@implementation CPCdemo2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model=[[TestModel alloc] initTest];
    
    
    [ _model addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    

    [ _model addObserver:self forKeyPath:@"arr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
    //FIXME:监听可变数组变化
    //1. iOS默认不支持对可变数组的KVO,因为kvc监听，而可变数组 ,里面的值发生了改变
    // 老师补充: kvo不是监听地址变化,是通过kvc协议来达到监听,你可以做个测试，用字符常量赋值，常量地址是不变的，每次赋值都会触发通知
    //2.数组不能放在UIViewController里面，在这里面的数组是监听不到数组大小的变化的，需要将需要监听的数组封装到model里面
    
    [_model addObserver:self forKeyPath:@"mutableArr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_model.mutableArr addObject:@"1"];//这样添加虽然添加进去了 但是kvo监听不到
    [[_model mutableArrayValueForKey:@"mutableArr"] addObject:@"2"];//这样才行
    
    c_Log(@"_model.mutableArr的count \n%@",_model.mutableArr);
    _model.name=@"1";
    
    
    _model.arr=@[@"1"];
}


/*
 keyPath : 监听的属性名称
 object : 监听的是哪个对象的属性
 change : 属性发生的改变
 context : 当初添加监听器时传入的参数
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"\n---------------------\nkeyPath==   %@\n\nchang\n%@\n\n",keyPath,change);
    
    
}
-(id)valueForUndefinedKey:(NSString *)key{
    c_Log(@"未定义报错 这边处理");
    return nil;
}


//FIXME:记得移除监听
-(void)dealloc{
    
    [_model removeObserver:self forKeyPath:@"modelArray"];
}








#pragma mark -
#pragma mark 异步发通知代码   没详细看
- (void)sendNotifi{
    
    NSNotification *notification = [NSNotification notificationWithName:@"EOCClass" object:nil userInfo:nil];
    NSNotificationQueue *notiQueue = [NSNotificationQueue defaultQueue];
    /*
     NSPostWhenIdle 当空闲时候发送
     NSPostASAP 尽快发送 as soon as p
     NSPostNow  马上发送
     modes
     NSNotificationCoalescingOnSender 不做处理
     NSNotificationCoalescingOnName 按名字合并
     NSNotificationCoalescingOnSender 按发送者合并
     
     线程 runloop 默认没有开启的
     */
    NSLog(@"notifi start");
    [notiQueue enqueueNotification:notification postingStyle:NSPostWhenIdle coalesceMask:NSNotificationNoCoalescing forModes:nil];
    NSLog(@"notifi end");
    
    NSMachPort *port = [[NSMachPort alloc] init];
    [[NSRunLoop currentRunLoop] addPort:port forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] run];
    
    NSLog(@"myThread Over");
}

@end
