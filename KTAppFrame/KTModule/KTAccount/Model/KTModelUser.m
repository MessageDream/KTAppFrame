//
//  KTModelUserNew.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelUser.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"
@implementation KTModelFriendProperty


@end

#pragma mark ===== KTModelUser =====
@implementation KTModelUser

-(id)init
{
    if (self = [super init])
    {
        _be_liked_count = 0;
        _topic_follow_count =0;
        _topic_count = 0;
        _reply_count = 0;
        _image_count = 0;
        _require_nickname = 0;
        _user_id = 0;
        _gender = 0;
        _username = @"";
        _nickname = @"";
        _email = @"";
        _phone_number = @"";
        _phone_regioncode = @"";
        _login_user_id = @"";
        _city = @"";
 //       _friends;   //unused
        _head_url = @"";
        _password = 0;
        _authorized_games = [NSArray array];
        _flag = 0;
        _distance = 0;
        _is_friend = NO;
        _status = 0;
        _last_like_date = 0;
        _sns_list = [NSDictionary dictionary]; // unused
    }
    return self;
}

@end

#pragma mark ===== KTModelUser =====
@implementation KTModelUsers

-(NSDictionary *)objectClassInArray {
    return kUsersInArray;
}

@end
