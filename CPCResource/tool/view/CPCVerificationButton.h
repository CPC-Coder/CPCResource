
//
//  Created by 池鹏程 on 16/9/10.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CPCButtonBlock)();

@interface CPCVerificationButton : UIButton

/** 回调 */
@property (nonatomic, copy)CPCButtonBlock block;
@property(nonatomic,assign)BOOL bad;//用来发生异常,重新计时
@property(nonatomic,assign)NSInteger fontSize;
@property(nonatomic,assign)NSInteger timeLong;

-(void)c_setup;


@end
