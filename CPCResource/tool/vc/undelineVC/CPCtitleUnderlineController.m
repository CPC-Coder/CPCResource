//
//  CPCTitleContentController.m
//  demo
//
//  Created by 池鹏程 on 16/9/16.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCtitleUnderlineController.h"
#import "CPCmyScrollV.h"


@interface CPCtitleUnderlineController () <UIScrollViewDelegate>
/** 当前选中的标题按钮 */
@property (nonatomic, weak) UIButton *selectedTitleButton;
/** 标题按钮底部的指示器 */
@property (nonatomic, weak) UIView *indicatorView;

/** 标题栏 */
@property (nonatomic, strong) UIView *titlesView;

@property(nonatomic,strong)NSMutableArray* unreadLableArr;





@end

@implementation CPCtitleUnderlineController




static CGFloat const titleH=40;//标题栏总大小
static CGFloat const scale=1.2;//变换大小
static NSInteger const fontSize=15;//字体大小
static CGFloat const   underH=2.5;//下划线宽度



- (NSMutableArray *)titleButtons
{
    if (_titleButtons == nil) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}
-(NSMutableArray *)unreadLableArr{
    if(_unreadLableArr==nil){
        _unreadLableArr=[NSMutableArray array];
    }
    return _unreadLableArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    [self setupTitlesView];
    
    
    [self setupScrollView];
    
    
    
    // 默认添加子控制器的view
    if (self.isLazyVC) {
        [self addChildVcView];
    } else {
        for (int i=0; i<self.childViewControllers.count; i++) {
            UIViewController* vc=self.childViewControllers[i];
            vc.view.frame=self.scrollView.frame;
            vc.view.c_x=i*self.scrollView.c_width;
            vc.view.c_y=0;
            [self.scrollView addSubview:vc.view];
        }
    }
    
    
    
    
    
    
}


#pragma mark -
#pragma mark 设置scrollViw
- (void)setupScrollView
{
    // 不允许自动调整scrollView的内边距
    
    CPCmyScrollV *scrollView = [[CPCmyScrollV alloc] init];
    
    
    CGFloat y=CGRectGetMaxY(self.titlesView.frame);
    
    scrollView.frame = CGRectMake(0, y, self.view.bounds.size.width, self.view.bounds.size.height-y-49);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    // 添加所有子控制器的view到scrollView中
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.frame.size.width, 0);
    [self.view addSubview:scrollView];
    
    //取消弹簧
    scrollView.bounces=NO;
    scrollView.delegate=self;
   // self.scrollView.backgroundColor=[UIColor redColor];
    self.scrollView = scrollView;
}
#pragma mark -
#pragma mark 设置TitlesView
- (void)setupTitlesView
{
    // 标题栏
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor =[UIColor whiteColor];
    
   // CGFloat y = self.navigationController.navigationBarHidden? 20 : 64;
    
    titlesView.frame = CGRectMake(0, 0, self.view.frame.size.width, titleH);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    
    
    
    
    
    // 添加标题
    
    
    NSUInteger count = self.childViewControllers.count;
    CGFloat titleButtonW = titlesView.frame.size.width / count;
    CGFloat titleButtonH = titlesView.frame.size.height;
    for (NSUInteger i = 0; i < count; i++) {
        // 创建
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        
        if (_unseletedColor==nil) {
            
            [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else {
            
            [titleButton setTitleColor:_unseletedColor forState:UIControlStateNormal];
        }
        
        
        if (_seletedColor==nil) {
            
            [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        } else {
            
            [titleButton setTitleColor:_seletedColor forState:UIControlStateSelected];
        }
        
        
     
        
        
       // titleButton.backgroundColor=[UIColor redColor];
        
        
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        
        // 设置数据
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        [titleButton.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        //titleButton.backgroundColor=[UIColor redColor];
        
        [self.titleButtons addObject:titleButton];
        
        //设置圆圈
        
        
        
        
    }
    
    // 按钮的选中颜色
    UIButton *firstTitleButton = titlesView.subviews.firstObject;
    firstTitleButton.transform=CGAffineTransformMakeScale(scale, scale);
    
    // 底部的指示器
    UIView *indicatorView = [[UIView alloc] init];
    if (_underlineColor==nil) {
        indicatorView.backgroundColor=[UIColor redColor];
    } else {
        indicatorView.backgroundColor = _underlineColor;
    }
    
    
    CGRect frame=indicatorView.frame;
    frame.size.height=underH;
    frame.origin.y=titlesView.frame.size.height-indicatorView.frame.size.height-frame.size.height;
    indicatorView.frame=frame;
    
    
    [titlesView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // 立刻根据文字内容计算label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    
    frame.size.width=firstTitleButton.titleLabel.frame.size.width;
    
    CGFloat x=firstTitleButton.titleLabel.frame.origin.x;
    frame.origin.x=x-frame.size.width/2;
    indicatorView.frame=frame;
    
    
    // 默认情况 : 选中最前面的标题按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
    
    for (int i=0; i<count; i++) {
        UILabel* badgeL = [[UILabel alloc] init];
        badgeL.textAlignment = NSTextAlignmentCenter;
        badgeL.textColor = [UIColor whiteColor];
        badgeL.backgroundColor =[UIColor redColor];
        [badgeL setFont:[UIFont systemFontOfSize:15]];
        badgeL.hidden = YES;
        badgeL.text=@"";
        CGFloat w=titleButtonW/6;
        CGFloat x=(i+1) * titleButtonW-2*w;
        
        
        badgeL.frame=CGRectMake(x, 20, w, w);
        
        badgeL.layer.cornerRadius = w / 2;
        badgeL.clipsToBounds = YES;
        [self.view addSubview:badgeL];
        [self.unreadLableArr addObject:badgeL];
    }
}



#pragma mark - 监听点击
- (void)titleClick:(UIButton *)titleButton
{

    

    
    // 控制按钮状态
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;

    // 指示器
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame=self.indicatorView.frame;
        frame.size.width=titleButton.titleLabel.frame.size.width*scale;
        self.indicatorView.frame = frame;
        
        
        
        
        CGFloat x=titleButton.frame.origin.x+titleButton.frame.size.width/2-frame.size.width/2;
        frame.origin.x=x;
        
        self.indicatorView.frame = frame;
        
        
    }];
    
    // 让UIScrollView滚动到对应位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
}



#pragma mark - 添加子控制器的view
- (void)addChildVcView
{
    //这种懒加载
    
    // 子控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    // 取出子控制器
    UIViewController *childVc = self.childViewControllers[index];
   
    
    //防止重复添加
    for (UIView* subV in self.scrollView.subviews) {
        if ([childVc.view isEqual:subV]) {
            return;
        }
    }
    
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
    
    

    
    
    
}

#pragma mark - <UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (self.isLazyVC) {
        [self addChildVcView];
    }
    
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIButton *titleButton = self.titlesView.subviews[index];
    [self titleClick:titleButton];
    
    // 添加子控制器的view
    if (self.isLazyVC) {
        [self addChildVcView];
    }
    
    // 当index == 0时, viewWithTag:方法返回的就是self.titlesView
    //    XMGTitleButton *titleButton = (XMGTitleButton *)[self.titlesView viewWithTag:index];
    
   
}

// 只要一滚动就需要字体渐变
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 字体缩放 1.缩放比例 2.缩放哪两个按钮
    NSInteger leftI = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    NSInteger rightI = leftI + 1;
    
    // 获取左边的按钮
    UIButton *leftBtn = self.titleButtons[leftI];
    NSInteger count = self.titleButtons.count;
    
    // 获取右边的按钮
    UIButton *rightBtn;
    if (rightI < count) {
        rightBtn = self.titleButtons[rightI];
    }
    
    // 0 ~ 1 =>  1 ~ 1.3
    // 计算缩放比例
    CGFloat scaleR = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    
    scaleR -= leftI;
    
    // 左边缩放比例
    CGFloat scaleL = 1 - scaleR;
    
    // 缩放按钮
    CGFloat scaleSmall=scale-1;
    leftBtn.transform = CGAffineTransformMakeScale(scaleL * scaleSmall + 1, scaleL * scaleSmall + 1);
    rightBtn.transform = CGAffineTransformMakeScale(scaleR * scaleSmall + 1, scaleR * scaleSmall + 1);
    

}






-(void)setUnreadIndexP:(NSIndexPath *)unreadIndexP{
    
    
    _unreadIndexP=unreadIndexP;
    UILabel* lab=self.unreadLableArr [unreadIndexP.section];
    if (lab) {
        lab.text=[NSString stringWithFormat:@"%ld",unreadIndexP.row];
        if (unreadIndexP.row) {
            lab.hidden=NO;
        }else{
            lab.hidden=YES;
        }
        
        if (unreadIndexP.section==1&&![[c_UserDefaults objectForKey:@"boolApply"] integerValue]) {
            lab.hidden=YES;
        }
        
        
    }
   
}


@end


