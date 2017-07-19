//
//  CPCmyScrollV.m
//  treePOD
//
//  Created by 池鹏程 on 2016/10/11.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCmyScrollV.h"


@interface CPCmyScrollV() <UIGestureRecognizerDelegate>


@end
@implementation CPCmyScrollV

//http://zhidao.baidu.com/link?url=MfY7mRupXJBhdPvzPwmo9vr3JzhRVUORREjnEJyU9V7dQ-f8tS0sxG54ae-jliVfX0SpE2tRFnoeISiwuxUlVr_bI9_2vp5FKBGdjmuublu
//重写之后让这个类绑定你界面中的scrollView.这个函数里面的意思是如果一个手势没有被识别的话，那么就让多个gestureRecognizer可以被识别，也就是本文的scrollView与tableView的cell的滑动手势可以同时被识别。
//　　但是这样之后，又会出现一个新的问题，也就是当scrollView在左右滑动的时候，tableView也能同时的上下滑动。造成这种现象的原因是上面MyScrollView里面重写的函数造成了多个手势同时被响应。解决这种问题的方法是在ViewController类里面处理滚动时候的事件。
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    if (gestureRecognizer.state != 0) {
        return YES;
    } else {
        return NO;
    }
}


@end
