
//
//  Created by 池鹏程 on 16/9/10.
//  Copyright © 2016年 池鹏程. All rights reserved.
//
#import "CPCVerificationButton.h"

@interface CPCVerificationButton()
@property (nonatomic, assign) NSInteger y;//--------->限时多少秒
@property (nonatomic, assign) NSInteger z;//--------->判断是否到时间
@property(nonatomic,strong)UIButton* btn;

@end

#define  color  [UIColor colorWithRed:18/255.0  green:129/255.0  blue:201/255.0 alpha:1]


@implementation CPCVerificationButton

-(void)awakeFromNib{
    [super awakeFromNib];
    [self c_setup];
}


-(void)c_setup{
    
        
        //添加点击时间
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        self.timeLong=60;
        _y =60;
        _z = 0;
        
        [self addTarget:self action:@selector(dianji) forControlEvents:UIControlEventTouchUpInside];
        
        
        //设置文字相关
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.322 green:0.792 blue:0.482 alpha:1.00] forState:UIControlStateNormal];
        self.backgroundColor=[UIColor whiteColor];
        self.layer.borderColor=[UIColor grayColor].CGColor;
        
        
        //button的设置
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.adjustsFontSizeToFitWidth=YES;//文字适应按钮大小
    if (self.fontSize) {
        [self.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize]];
    }
    
        
        _btn=self;
    
}


#pragma mark -
#pragma mark 点击后执行这个
- (void)dianji{
    
    [self setTitleColor:c_CommonBgGray forState:UIControlStateNormal];
    self.backgroundColor=[UIColor grayColor];
    self.layer.borderColor=[UIColor grayColor].CGColor;
    self.userInteractionEnabled = NO;
    
    
    
    [self time];
    
    
}
- (void)xianshi{
    c_Log(@"时间在跳转");
    _z = 1;
    
    
    [self setTitle:[NSString stringWithFormat:@"还剩%ld秒",_y] forState:UIControlStateNormal];
    
    _y -= 1;
    
    if (_y == -1||_bad==YES) {//--------->这里重置60秒
        _bad=NO;
        self.userInteractionEnabled = YES;
        _y =self.timeLong;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setTitleColor:c_CommonBgColor forState:UIControlStateNormal];
        //self.backgroundColor=color;
        //self.layer.borderColor=[UIColor blackColor].CGColor;
        _z = 0;
        [self ok];
    }else{
        [self time];
    }
}
-(void)time{
    if (self.userInteractionEnabled == NO) {
        if (_z == 0) {
            [self xianshi];
        }else{
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(xianshi) userInfo:nil repeats:NO];
        }
    }
}
#pragma mark -
#pragma mark 循环结束后调用这个
- (void)ok{
    
}


//set get方法

- (void)click
{
    if (_block) {
        _block();
    }
}
-(void)setTimeLong:(NSInteger)timeLong{
    _timeLong=timeLong;
    _y=timeLong;
}

-(void)setFontSize:(NSInteger)fontSize{
    _btn.titleLabel.font=[UIFont systemFontOfSize:fontSize];
}



@end
