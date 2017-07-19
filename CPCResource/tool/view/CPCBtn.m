//
//  CPCBtn.m
//  球迷1
//
//  Created by 池鹏程 on 16/8/2.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCBtn.h"

@implementation CPCBtn

- (void)awakeFromNib
{   [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    
    
    
    [super layoutSubviews];
    
    self.titleLabel.c_bottom=self.c_height;
    self.titleLabel.c_centerX=self.c_width/2.0;
    
    CGFloat h=self.c_height-self.titleLabel.c_height;
    CGFloat i=MIN(h, self.c_width);
    
    self.imageView.c_y=0;
    self.imageView.c_height=i;
    self.imageView.c_width=i;
    self.imageView.c_centerX=self.c_width/2.0;
    
    
  
    
}

@end
