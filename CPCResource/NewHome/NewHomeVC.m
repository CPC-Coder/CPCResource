//
//  NewHomeVC.m
//  treePOD
//
//  Created by 鹏程 on 17/2/22.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import "NewHomeVC.h"
#import "NewHomeCell.h"

@interface NewHomeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableV;

@end

@implementation NewHomeVC
static NSString* cellID=@"CPC";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"TT家族";
    
    //self.view.backgroundColor=[UIColor yellowColor];
    
    //初始化ui
    [self setupTableV];
    
}

-(void)setupTableV{
    UITableView* tableV=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, c_ViewW, c_ViewH*0.8) style:UITableViewStylePlain];
    tableV.delegate=self;
    tableV.dataSource=self;
    tableV.tableFooterView=[UIView new];
    [self.view addSubview:tableV];
    _tableV=tableV;
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewHomeCell* cell=[tableView dequeueReusableCellWithIdentifier:@"CPC"];
    if (!cell) {
        
        cell=[[NewHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CPC"];
    }
    
    
    switch (indexPath.row) {
        case 0:
        {
            cell.titleLab.text=@"父母辈";
            cell.circleV.backgroundColor=[UIColor yellowColor];
            cell.cellKind=isParents;
        }
            break;
        case 1:
        {
            cell.titleLab.text=@"妻子&兄弟姐妹辈";
            cell.circleV.backgroundColor=[UIColor orangeColor];
            cell.cellKind=isGeneral;
        }
            break;
        case 2:
        {
            cell.titleLab.text=@"儿女辈";
            cell.circleV.backgroundColor=[UIColor redColor];
            cell.cellKind=isGeneral;
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    return cell;
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return    _tableV.c_height/3;
    
    
}

@end
