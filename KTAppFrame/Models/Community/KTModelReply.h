//
//  KTModelReply.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"

@class KTModelUser;
@class KTModelTopic;

@interface KTModelReply : KTModel
@property (nonatomic) NSInteger topic_id;
@property (nonatomic,copy) NSString *content;
@property (nonatomic) NSInteger like_count;
@property (nonatomic,strong) NSArray *images;
@property (nonatomic) NSInteger reply_id;
@property (nonatomic,strong) KTModelTopic *topic;
@property (nonatomic) NSInteger create_time; //FIXME: long long?
@property (nonatomic,strong) KTModelUser *creator;
@end



@interface KTModelReplies : KTModel
@property (nonatomic) long long time;
@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger topic_id;
@property (nonatomic,copy) NSArray *replies;
@end

