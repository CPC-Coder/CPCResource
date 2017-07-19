//
//  AccountVC.m
//  treePOD
//
//  Created by 池鹏程 on 2016/11/1.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "AccountVC.h"






@interface AccountVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableV;
@end

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableV=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableV.delegate=self;
    tableV.dataSource=self;
    tableV.rowHeight=50;
    [self.view addSubview:tableV];
    _tableV=tableV;

    
    
    self.view.backgroundColor=c_CommonBgGray;
}


#pragma mark -
#pragma mark 设置tableView组 行 内容

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?1:3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString* id=@"CPC";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:id];
        
     
        
    }
    //传入数据
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text=@"手机号";
                    
                }
                    break;
                case 1:
                    cell.textLabel.text=@"真实姓名";
                    
                    break;
                case 2:
                    cell.textLabel.text=@"账号";
                    
                    
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
            cell.textLabel.text=@"修改密码";
            break;
            
        default:
            break;
    }
    
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}




@end
