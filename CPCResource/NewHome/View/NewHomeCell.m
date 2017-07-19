//
//  NewHomeCell.m
//  treePOD
//
//  Created by 鹏程 on 17/2/23.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import "NewHomeCell.h"
#import "CPCBtn.h"
@interface NewHomeCell ()

@property(nonatomic,strong)UIScrollView* scrollV;
@property(nonatomic,strong)UIView* titleV;


@property(nonatomic,strong)CPCBtn* addBtn;
@property(nonatomic,strong)NSMutableArray* relationBtnArr;



@end

@implementation NewHomeCell

-(NSMutableArray *)relationBtnArr{
    if (!_relationBtnArr) {
        _relationBtnArr=[NSMutableArray array];
        
    }
    return _relationBtnArr;
    
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //设置scrollV
        UIScrollView* scrollV=[UIScrollView new];
        [self.contentView addSubview:scrollV];
        _scrollV=scrollV;
        
        //添加按钮
        _addBtn=[CPCBtn new];
        [_addBtn setTitle:@"添加关系" forState:UIControlStateNormal];
        [_addBtn setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [_scrollV addSubview:_addBtn];
        _scrollV.backgroundColor=[UIColor redColor];
        
        
        //设置titleV
        _titleV=[UIView new];
        _titleV.backgroundColor=c_GrayColor(250);
        [self.contentView addSubview:_titleV];
        
        _circleV=[UIView new];
        _circleV.clipsToBounds=YES;
        [_titleV addSubview:_circleV];
        
        _titleLab=[UILabel new];
        _titleLab.textAlignment=NSTextAlignmentLeft ;
        [_titleV addSubview:_titleLab];
        
        
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat xs=0.2;
    
    _titleV.frame=CGRectMake(0, 0, self.c_width, self.c_height*xs);
    _scrollV.frame=CGRectMake(0, self.c_height*xs, self.c_width, self.c_height*(1-xs));
    
    
    
    CGFloat magin=10;
    CGFloat circleW=_titleV.c_height*0.35;
    _circleV.frame=CGRectMake(magin, (_titleV.c_height-circleW)/2, circleW, circleW);
    _circleV.layer.cornerRadius=circleW/2;
    CGFloat labX=magin*2+circleW;
    _titleLab.frame=CGRectMake(labX, 0, _titleV.c_width-labX, _titleV.c_height);
    
    
    
    
    
    
    
}



-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    
    for (int i=0; i<_dataArr.count; i++) {
        CPCBtn* relationBtn=[[CPCBtn alloc] init];
        [relationBtn setTitle:@"添加关系" forState:UIControlStateNormal];
        [relationBtn setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        relationBtn.tag=i;
        [relationBtn addTarget:self action:@selector(clickRelationBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.relationBtnArr addObject:relationBtn];
        
    }
    

    
}

-(void)clickRelationBtn:(CPCBtn*)btn{
    
    
    if (btn.tag&&_relationBtnClick) {
        c_Log(@"按钮被点击");
        //_relationBtnClick(YES,_dataArr[btn.tag]);
    }
    
}

@end
