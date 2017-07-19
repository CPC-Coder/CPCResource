//
//  LBPersonalPage_VC.m
//  LBPersonalPage
//
//  Created by 池鹏程 on 2016/11/14.
//  Copyright © 2016年 池鹏程. All rights reserved.
//


#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height



#import "CPCPersonalVC.h"

const CGFloat BackGroupHeight = 200;
const CGFloat HeadImageHeight= 80;
const CGFloat HeadImageY= 50;
const CGFloat   NameTop=10;
@interface CPCPersonalVC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation CPCPersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    //self.navigationController.navigationBarHidden=YES;
    self.automaticallyAdjustsScrollViewInsets=YES;
}

- (void)createUI{
    

    
    
    
    //此处相当于隐藏了导航栏 的下划线
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    _tableView.contentInset = UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    
    [self.view addSubview:_tableView];
    //去掉table下面的线
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    //imageBG---设置头像的背景
    _imageBG = [[UIImageView alloc]init];
    _imageBG.frame = CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight);
    _imageBG.image = [UIImage imageNamed:@"BG.jpg"];
    
    [_tableView addSubview:_imageBG];
    //BGView----头像和名字的总view(跟_imageBG差不多)
    _BGView = [[UIView alloc]init];
    _BGView.backgroundColor=[UIColor clearColor];
    _BGView.frame=CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight);
    
    [_tableView addSubview:_BGView];
    
    //头像
    _headImageView=[[UIImageView alloc]init];
    _headImageView.image=[[UIImage imageNamed:@"myheadimage.jpeg"] circleImage];
    _headImageView.frame=CGRectMake((KScreen_Width-HeadImageHeight)/2, HeadImageY, HeadImageHeight, HeadImageHeight);
    _headImageView.layer.cornerRadius = HeadImageHeight/2;
    _headImageView.clipsToBounds = YES;
    
    
    [_BGView addSubview:_headImageView];
    
    //名字
    
    _nameLabel=[[UILabel alloc]init];
    _nameLabel.text=@"池鹏程制作";
    _nameLabel.textAlignment=NSTextAlignmentCenter;
    _nameLabel.frame=CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(_headImageView.frame)+NameTop, HeadImageHeight+50, 20);
    //_nameLabel.backgroundColor=[UIColor redColor];
    
    [_BGView addSubview:_nameLabel];
    
    //设置导航栏
    _leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [_leftBtn setTitle:@"left" forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"lift"] forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    _rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [_rightBtn setTitle:@"right" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    //    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rig"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)leftBtnAction
{
    NSLog(@"leftClick");
}
- (void)setTableView:(UITableView *)tableView{
    _tableView = tableView;
}
- (void)setHeadImageView:(UIImageView *)headImageView{
    _headImageView = headImageView;
}
- (void)setNameLabel:(UILabel *)nameLabel{
    _nameLabel = nameLabel;
}
- (void)setImageBG:(UIImageView *)imageBG{
    _imageBG = imageBG;
}

-(void)rightBtnAction
{
    NSLog(@"rightClick");
}

#pragma mark - tableViewDelegate&DataSource

#pragma mark -
#pragma mark 设置tableView组 行 内容

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString* id=@"CPC";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
        
        
        
    }
    
    
    
    
    
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + BackGroupHeight)/2;//是_imageBG能向左右扩大
    
    if (yOffset < -BackGroupHeight) {//向下拉
        //设置背景
        CGRect rect = _imageBG.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = KScreen_Width + fabs(xOffset)*2;
        _imageBG.frame = rect;
        
        //设置头像
        CGRect HeadImageRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, HeadImageY, HeadImageHeight, HeadImageHeight);
        HeadImageRect.origin.y = _headImageView.frame.origin.y;
        HeadImageRect.size.height =  HeadImageHeight + fabs(xOffset)*1 ;
        HeadImageRect.origin.x = self.view.center.x - HeadImageRect.size.height/2;
        HeadImageRect.size.width = HeadImageHeight + fabs(xOffset)*1;
        _headImageView.frame = HeadImageRect;
        _headImageView.layer.cornerRadius = HeadImageRect.size.height/2;
        _headImageView.clipsToBounds = YES;
        
        CGRect NameRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(_headImageView.frame)+NameTop, HeadImageHeight, 20);
        NameRect.origin.y = CGRectGetMaxY(_headImageView.frame)+NameTop;
        NameRect.size.height =  20 + fabs(xOffset)*0.5 ;
        NameRect.size.width = HeadImageHeight + fabs(xOffset)+50;
        NameRect.origin.x = self.view.center.x - NameRect.size.width/2;
        
        _nameLabel.font=[UIFont systemFontOfSize:17+fabs(xOffset)*0.2];
        
        _nameLabel.frame = NameRect;
        
        
    }else{//上拉
        
        
        CGRect HeadImageRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, HeadImageY, HeadImageHeight, HeadImageHeight);
        HeadImageRect.origin.y = _headImageView.frame.origin.y;
        HeadImageRect.size.height =  HeadImageHeight - fabs(xOffset)*0.7 ;
        HeadImageRect.origin.x = self.view.center.x - HeadImageRect.size.height/2;
        
        //加这句 可以调整头像消失的bug
        
        if (HeadImageRect.size.height<5) {
            HeadImageRect.size.height=5;
        }
        
        HeadImageRect.size.width =HeadImageRect.size.height;
        _headImageView.frame = HeadImageRect;
        _headImageView.layer.cornerRadius = HeadImageRect.size.height/2;
        _headImageView.clipsToBounds = YES;
        
        CGRect NameRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(_headImageView.frame)+NameTop, HeadImageHeight, 20);
        NameRect.origin.y = CGRectGetMaxY(_headImageView.frame)+NameTop;
        NameRect.size.height =  20;
        NameRect.size.width = HeadImageHeight - fabs(xOffset)*0.5+50;
        NameRect.origin.x = self.view.center.x - NameRect.size.width/2;
        
        
        _nameLabel.font=[UIFont systemFontOfSize:17-fabs(xOffset)*0.15];
        
        _nameLabel.frame = NameRect;//文字大小会自动调整
        //[_nameLabel adjustsFontSizeToFitWidth];
    }
    
    

//        CGFloat alpha = (yOffset+BackGroupHeight)/BackGroupHeight;
//    CGFloat alpha=1;
//    //此处设置导航栏的颜色 以及导航是否渐变
   // [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor redColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
//        _titleLabel.alpha=alpha;
//        alpha=fabs(alpha);
//        alpha=fabs(1-alpha);
//        alpha=alpha<0.2? 0:alpha-0.2;
//        _BGView.alpha=alpha;

}





@end
