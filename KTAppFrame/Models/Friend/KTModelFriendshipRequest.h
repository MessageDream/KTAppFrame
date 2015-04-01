//
//  KTFriendshipRequest.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"

@class KTModelUser;

@interface KTModelFriendshipRequest : KTModel

@property (nonatomic) NSInteger request_id;
@property (nonatomic) NSInteger target_chat_active;

@property (nonatomic) NSInteger create_at;
@property (nonatomic, strong) KTModelUser *user;
//NOTE: /2/friendlist/friendships/deny /2/friendlist/friendships/accept
@property (nonatomic) NSInteger target_user_id;

@end

@interface KTModelFriendshipRequests : KTModelPaginator

@property (nonatomic) long long time;
//@property (nonatomic) NSInteger total;
//@property (nonatomic) NSInteger previous_cursor;
//@property (nonatomic) NSInteger next_cursor;
//@property (nonatomic, retain) NSString * previous_cursor_str;
//@property (nonatomic, retain) NSString * next_cursor_str;

@property (nonatomic, strong) NSArray * requests;

@end

@interface KTModelFriendshipRequestActivity : KTModel

@property (nonatomic) NSInteger request_count;
@property (nonatomic) long long time;

@end
