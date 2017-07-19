//
//  CPCDemoVC.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/13.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCDemoVC.h"
#import "CPCdemo1VC.h"
#import "CPCdemo2VC.h"

#import "VC4.h"




#import "CPCPlaySoundTool.h"
@interface CPCDemoVC ()

@end

@implementation CPCDemoVC


- (void)viewDidLoad {
    
    
    
    CPCdemo1VC* vc=[[CPCdemo1VC alloc] init];
    vc.title=@"你好";
    
    [self addChildViewController:vc];
    
    
    CPCdemo2VC* vc1=[[CPCdemo2VC alloc] init];
    vc1.title=@"kvo测试";
    vc1.view.backgroundColor=c_RandomColor;
    [self addChildViewController:vc1];
    
    
    

    
    
    VC4* vc3=[[VC4 alloc] init];
    vc3.title=@"动态高度";
    //vc3.view.backgroundColor=c_RandomColor;
    [self addChildViewController:vc3];
    
    self.isLazyVC=YES;//这句控制了 是否懒加载subVC
    
    
    [super viewDidLoad];
    
    
    [CPCPlaySoundTool playMusicWithName:@"1"];
    
    
    
    
    
    
    
    
    
}
-(void)test{
    
    
    
}
@end
