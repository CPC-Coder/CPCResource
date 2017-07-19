//
//  NewHomeCell.h
//  treePOD
//
//  Created by 鹏程 on 17/2/23.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,cellKind){
    isGeneral=0,
    isParents=1
};
@class PersonModel;
@interface NewHomeCell : UITableViewCell

@property(nonatomic,strong)UIView* circleV;
@property(nonatomic,strong)UILabel* titleLab;


@property(nonatomic,strong)NSArray* dataArr;
@property(nonatomic,assign)cellKind cellKind;



@property(nonatomic,copy)void(^relationBtnClick)(BOOL isAdd,PersonModel* model) ;
@end
