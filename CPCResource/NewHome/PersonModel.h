//
//  PersonModel.h
//  timetree
//
//  Created by qinqinwang on 16/7/25.
//  Copyright © 2016年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject
@property (nonatomic, copy) NSString *relation_uid;

@property (nonatomic, copy) NSString *orange_dot;

@property (nonatomic, copy) NSString *relation_user_base_pic;

@property (nonatomic, copy) NSString *relation_user_realname;//真实绑定

@property(nonatomic,copy)NSString* relation_user_nickname;

@property (nonatomic, assign) NSInteger total_cost;

@property (nonatomic, copy) NSString *my_relation;//	相对我的逻辑关系

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, assign) NSInteger bound_status; //1.虚拟 2.预绑定 3.绑定

@property (nonatomic, copy) NSString *relation_user_sex_bound;

@property (nonatomic, assign) NSInteger is_new;//是否为行的点 如果=1 点击查看详情的时候 要异步更新Friends.updateIsNew接口(不过不需要处理该接口返回的结果)

@property (nonatomic, copy) NSString *relation_user_birthday;//生日

@property (nonatomic, copy) NSString *my_call;//我对他的称呼-前端对他的称呼用这个

@property (nonatomic, copy) NSString *relative_relation;

@property (nonatomic, copy) NSString *relative_call;

//@property (nonatomic, copy) NSString *vertex_id;//点位的id bound_status=1 或 3的时候会有 其他时间为Null

@property (nonatomic, copy) NSString *predefine_relation_uid;//绑定的好友的用户id bound_status=2 或 3的时候会有 其他时间为Nul

@property (nonatomic, copy) NSString *relation_user_phone;//	电话

@property (nonatomic, copy) NSString *bound_time;

@property (nonatomic, copy) NSString *red_dot;

@property (nonatomic, assign) NSInteger relation_user_avatar;//头像

@property (nonatomic, assign) NSInteger total_seniority;

@property (nonatomic, assign) NSInteger relation_user_sex;//1男 2女

@property (nonatomic, copy) NSString *memo_name; //备注名

@property (nonatomic, copy) NSString *pinying;//拼音

@property (nonatomic, copy) NSString *relation_user_memo;//个人说明

@property(nonatomic,copy)NSString* vertex_id_link;

@property(nonatomic,strong)NSString* relation_user_avatar_url;

@property(nonatomic,copy)NSString* id;
@property(nonatomic,strong)NSString* pic_list;
@property(nonatomic,strong)NSString* relation_name;
@property(nonatomic,strong)NSString* relation_user_job;
@property(nonatomic,strong)NSString* relation_user_position;
@property(nonatomic,strong)NSString* relation_user_address;
@property(nonatomic,strong)NSDictionary* user;
@property(nonatomic,strong)NSDictionary* memo;




/*--------          自定义的          --------*/
@property(nonatomic,copy)NSString* c_job;
@property(nonatomic,copy)NSString* c_position;


@end
