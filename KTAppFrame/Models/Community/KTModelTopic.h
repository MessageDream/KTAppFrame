//
//  KTModelTopic.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"
@class KTModelUser;
@class KTModelReply;
@interface KTModelTopic : KTModel

@property (nonatomic,copy) NSString *type;

//type == topic
@property (nonatomic) NSInteger topic_id;
@property (nonatomic,copy) NSString *content;
@property (nonatomic) NSInteger topped;
@property (nonatomic) BOOL locked;
@property (nonatomic) NSInteger reply_count;
@property (nonatomic) NSInteger like_count;
@property (nonatomic) NSInteger modify_time;
@property (nonatomic,strong) NSArray * images;
@property (nonatomic) NSInteger create_time;
@property (nonatomic,strong) KTModelUser * creator;
@property (nonatomic,copy) NSString * url; // 首页数据有效


@property (nonatomic,strong) KTModelReply * last_reply;



//type == promotion

@property (nonatomic,copy) NSString * subtype;  //话题页有效
@property (nonatomic,copy) NSString * title;    //话题页有效
@property (nonatomic,copy) NSString * info;  //话题页有效
@property (nonatomic,copy) NSString * icon_url; //话题页有效
@property (nonatomic,copy) NSString * download_url; //话题页有效
@property (nonatomic,copy) NSArray * screenshots;   //话题页有效

@end



@interface KTModelTopics : KTModel
@property (nonatomic) NSInteger   total;
@property (nonatomic) long long   time;
@property (nonatomic,copy) NSArray *topics;
@end





