//
//  KTModelAccount.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelAccount.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"
#import "KTApiClient.h"
@implementation KTModelAccount
/*

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:@(self.password) forKey:@"password"];

    [aCoder encodeObject:self.user_token forKey:@"user_token"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.head_url forKey:@"headUrl"];
    [aCoder encodeObject:self.nickname forKey:@"nickName"];
    [aCoder encodeObject:@(self.gender) forKey:@"gender"];
    [aCoder encodeObject:@(self.user_id) forKey:@"userId"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.sns_list forKey:@"snsList"];
    [aCoder encodeObject:@(self.be_liked_count) forKey:@"beLikedCount"];
    [aCoder encodeObject:@(self.topic_count) forKey:@"topicCount"];
    [aCoder encodeObject:self.login_user_id forKey:@"login_user_id"];
    [aCoder encodeObject:@(self.reply_count) forKey:@"replyCount"];
    [aCoder encodeObject:@(self.topic_follow_count) forKey:@"topicFollowCount"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        self.password = [[aDecoder decodeObjectForKey:@"password"] integerValue];

        self.user_token = [aDecoder decodeObjectForKey:@"user_token"];
        self.city = [aDecoder decodeObjectForKey:@"city"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.head_url = [aDecoder decodeObjectForKey:@"headUrl"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickName"];
        self.gender = [[aDecoder decodeObjectForKey:@"gender"] integerValue];
        self.user_id = [[aDecoder decodeObjectForKey:@"userId"] integerValue];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.sns_list = [aDecoder decodeObjectForKey:@"snsList"];
        self.be_liked_count = [[aDecoder decodeObjectForKey:@"beLikedCount"] integerValue];
        self.topic_count = [[aDecoder decodeObjectForKey:@"topicCount"] integerValue];
        self.login_user_id = [aDecoder decodeObjectForKey:@"login_user_id"];
        self.reply_count = [[aDecoder decodeObjectForKey:@"replyCount"] integerValue];
        self.topic_follow_count = [[aDecoder decodeObjectForKey:@"topicFollowCount"] integerValue];
    }
    
    return self;
}
 */

@end
