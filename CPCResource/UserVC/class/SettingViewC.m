//
//  SettingViewC.m
//  treePOD
//
//  Created by 池鹏程 on 2016/11/1.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "SettingViewC.h"
#import "AccountVC.h"
#import "CPCClearCacheCell.h"

#import "CPCWebViewController.h"

@interface SettingViewC ()<UITableViewDelegate,UITableViewDataSource>
//@property(nonatomic,strong)UIView *mask;
@end

@implementation SettingViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableV=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableV.delegate=self;
    tableV.dataSource=self;
    tableV.rowHeight=50;
    [self.view addSubview:tableV];
    
    

    
    
}
//-(void)viewDidAppear:(BOOL)animated{
//    
//    [super viewDidAppear:animated];
//    UIView* mask=[[UIView alloc] initWithFrame:self.view.bounds];
//    mask.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.5];
//    [mask addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
//    [self.view addSubview:mask];
//    mask.hidden=YES;
//    _mask=mask;
//}
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    _mask.hidden=YES;
//}
//-(void)hide{
//    _mask.hidden=YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark 设置tableView组 行 内容

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
            
        default:
            break;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString* id=@"CPC";
    static NSString* cleatId=@"clear";
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:id];
    CPCClearCacheCell * clearCell=[tableView dequeueReusableCellWithIdentifier:id];
    
    if (indexPath.section==1&&indexPath.row==1) {
        if (cell==nil) {
            
            clearCell=[[CPCClearCacheCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cleatId];
            
            
        }
        
    } else {
        
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:id];
            
            
        }
    }
    
    //XMGClearCacheCell
    //传入数据
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=@"我的账号";
            break;
        case 1:
        {
            if (indexPath.row) {
                
                return clearCell;
            } else {
                cell.textLabel.text=@"推送消息设置";
            }
            
        }
            
            break;
        case 2:
        {
            if (indexPath.row) {
                cell.textLabel.text=@"用户协议";
            } else {
                cell.textLabel.text=@"关于TT家族";
            }
            
        }
            
            break;
        case 3:
            cell.textLabel.text=@"退出登陆";
            [cell.textLabel setTextColor:[UIColor redColor]];
            break;
            
        default:
            break;
    }
    
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.section) {
        case 0:
        {
            AccountVC* vc=[AccountVC new];
            vc.title=@"我的账号";
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            if (indexPath.row) {
                //cell.textLabel.text=@"清理缓存";
            } else {
                //cell.textLabel.text=@"推送消息设置";
                
            }
            
        }
            
            break;
        case 2:
        {
            if (indexPath.row) {
                //cell.textLabel.text=@"用户协议";
               CPCWebViewController* vc=[CPCWebViewController new];
                vc.url=c_readURL;

                
                vc.title=@"用户协议";
                [self.navigationController pushViewController:vc animated:YES];
                
                
                
                
            } else {
                //cell.textLabel.text=@"关于TT家族";
                NSURL *url = [NSURL URLWithString:c_appURL];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                
            }
            
        }
            
            break;
        case 3:
        {

            UIAlertController* alerVC=[UIAlertController alertControllerWithTitle:@"确定退出登陆?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                [[NSNotificationCenter defaultCenter] postNotificationName:n_loginChange object:@NO];
            }];
            
            
            
            UIAlertAction* cancer=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alerVC addAction:sure];
            [alerVC addAction:cancer];
            [self presentViewController:alerVC animated:YES completion:nil];
                                       
            
        }
           
            break;
            
        default:
            break;
    }
    
    


    
}


@end
