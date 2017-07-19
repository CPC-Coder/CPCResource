//
//  CPCdemo1.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/14.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCdemo1VC.h"
#import "CPCVerificationButton.h"
#import "CPCTextView.h"

@interface CPCdemo1VC ()
@property (weak, nonatomic) IBOutlet CPCTextView *textV;



@property(nonatomic,strong)NSMutableArray* testArr;

@end

@implementation CPCdemo1VC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //_textV.maxLong=100;
    _textV.placeholder=@"嘻嘻嘻";
    
    
    
    self.view.opaque=YES;//少设置透明图片  如果没透明图片  设置这个性能提升很多
    
    /*--------          直接修改地址里的值          --------*/
    
    NSString* test=@"哎";
    [self backValue:&test];
    
   
    
    
}

-(void)backValue:(NSString**)string{
    *string=@"哈哈";
}



@end
