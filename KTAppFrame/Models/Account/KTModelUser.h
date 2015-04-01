//
//  KTModelUserNew.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"


@interface KTModelFriendProperty : KTModel
@property (nonatomic) NSInteger limit;
@property (nonatomic) NSInteger count;

@property (nonatomic) NSInteger total;
@end


@interface KTModelUser : KTModel
@property (nonatomic) BOOL new_registered;

//NOTE: from login_by_nickname
@property (nonatomic) NSInteger be_liked_count;
@property (nonatomic) NSInteger topic_follow_count;
@property (nonatomic) NSInteger topic_count;
@property (nonatomic) NSInteger reply_count;
@property (nonatomic) NSInteger image_count;
@property (nonatomic) NSInteger require_nickname;
@property (nonatomic) NSInteger user_id;
@property (nonatomic) NSInteger gender;
@property (nonatomic, copy) NSString * username;
@property (nonatomic, copy) NSString * nickname; //nick_name friends/list_by
@property (nonatomic, copy) NSString * email;
@property (nonatomic, copy) NSString * phone_number;
@property (nonatomic, copy) NSString * phone_regioncode;
@property (nonatomic, copy) NSString * login_user_id;
@property (nonatomic, copy) NSString * city;
@property (nonatomic, strong) KTModelFriendProperty * friends;   //unused
//NOTE: from login_by_sns/login_by_game
@property (nonatomic, copy) NSString * head_url;

@property (nonatomic) NSInteger chat_active;

@property (nonatomic) NSInteger password;
//NOTE: friendlist/friends/list_by
@property (nonatomic, copy) NSArray * authorized_games;
//NOTE: friendlist/user/specify
@property (nonatomic) NSInteger flag;
//NOTE: game/user/nearby_list
@property(nonatomic)NSInteger distance;
@property(nonatomic)BOOL is_friend;


@property(nonatomic) NSInteger status;
//NOTE: user/liker/list
@property (nonatomic) NSInteger last_like_date;
@property (nonatomic, copy) NSDictionary * sns_list; // unused
@end


@interface KTModelUsers : KTModelPaginator
//NOTE: friendlist/friends/list_by
@property (nonatomic, strong) NSArray * users;
//NOTE: friendlist/user/search
@property (nonatomic) long long time;

@property (nonatomic, copy) NSString * last_request_time;

// last_like_date?

@end
