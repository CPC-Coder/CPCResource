//
//  CPCUserVC.m
//  CPCResource
//
//  Created by 池鹏程 on 2016/11/12.
//  Copyright © 2016年 池鹏程. All rights reserved.
//

#import "CPCUserVC.h"
#import "SettingViewC.h"
#import "UIViewController+CPCClickHeadImgV.h"

@interface CPCUserVC ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,CPCImageCropperViewControllerDelegate>

@end

@implementation CPCUserVC


-(void)viewDidLoad{
    [super viewDidLoad];
   self.tableView.delegate=self;
    [self c_setHeadClickWithView:self.headImageView];
    //self.navigationController.navigationBarHidden=YES;
    
}

-(void)imageCropper:(CPCImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage{
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        //设置头像 有翻拍效果
        [UIView transitionWithView:self.headImageView duration: 1 options: UIViewAnimationOptionTransitionFlipFromLeft animations: ^{
            [self.headImageView setImage:[editedImage circleImage]];
            
        } completion: ^(BOOL finished) {
            
        }];
    }];
}
-(void)imageCropperDidCancel:(CPCImageCropperViewController *)cropperViewControlelr{
    
}
#pragma mark -
#pragma mark 设置tableView组 行 内容

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString* id=@"CPC";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
        
       
        
    }
  
    
    
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingViewC* vc=[SettingViewC new];
    
    vc.title=@"设置";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
