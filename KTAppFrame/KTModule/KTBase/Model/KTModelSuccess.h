//
//  KTModelSuccess.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/22.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"

@interface KTModelSuccess : KTModel
//NOTE: common
@property (nonatomic) NSInteger game_id;
//NOTE: from resetpwd
@property (nonatomic) NSInteger user_id;
//NOTE: game/share/shared
@property (nonatomic) NSInteger has_reward;
//NOTE: forgetpwd
@property (nonatomic, copy) NSString * mhash;
@property (nonatomic, copy) NSString * email;
//NOTE: user/account/resetpwd_by_sms_verifycode /service/sms/verifycode
@property (nonatomic, copy) NSString * phone_number;
//NOTE: user/account/privacypolicy
@property (nonatomic, copy) NSString *content;
//NOTE: friendlist/friendships/request
@property (nonatomic) NSInteger success_count;
//NOTE: friendlist/friendships/remove
@property (nonatomic) NSInteger target_user_id;

@property (nonatomic) NSInteger topic_id;
@property (nonatomic) long long  msg_id;
@property (nonatomic) NSInteger reply_id;
@property (nonatomic) NSInteger status;
@property (nonatomic,copy) NSArray *msg_ids;

@end
