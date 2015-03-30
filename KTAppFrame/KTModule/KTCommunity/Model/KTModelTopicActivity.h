//
//  KTModelCommunityActivity.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KTModel.h"

@class KTModelTopic;
@class KTModelUser;
@class KTModelReply;


@interface KTModelTopicAcitvityCount : KTModel
@property (nonatomic,copy) NSString *last_request_time;

@property (nonatomic) NSInteger topic_reply_count;
@property (nonatomic) NSInteger topic_like_count;
@property (nonatomic) NSInteger reply_like_count;

//add by qxl 1027
@property (nonatomic) NSInteger image_reply_count;
@property (nonatomic) NSInteger image_like_count;
@property (nonatomic) long long time;

//-(NSInteger)to_beliked_count;
@end


@interface KTModelTopicActivity : KTModel
@property (nonatomic,strong) KTModelTopic *topic;
@property (nonatomic,strong) KTModelReply *reply;
@property (nonatomic,strong) KTModelUser *actor;
@property (nonatomic)   NSInteger create_time;
@property (nonatomic, copy) NSString * type;
@end


@interface KTModelFriendActivity : KTModelPaginator

@property (nonatomic) long long time;

@property (nonatomic, strong) NSMutableArray * actions;

@end
