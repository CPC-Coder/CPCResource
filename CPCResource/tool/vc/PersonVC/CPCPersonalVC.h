//
//  LBPersonalPage_VC.h
//  LBPersonalPage
//
//  Created by 池鹏程 on 2016/11/14.
//  Copyright © 2016年 池鹏程. All rights reserved.
//


#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

@interface CPCPersonalVC : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageBG;
@property (nonatomic, strong) UIView *BGView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

-(void)leftBtnAction;

-(void)rightBtnAction;

@end
