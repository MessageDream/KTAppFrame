//
//  KTCommunityApi.m
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import "KTCommunityApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTModelHelperExtension.h"
#import "KTCommunityApiDefines.h"
#import "KTCommunityApi.h"

#define PAGESIZE 15
#define MAX_SEARCH_PAGESIZE (30)


@implementation KTCommunityApi

+(void)reqHomePageContent:(void (^)(KTApiResponse *response))complete
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    
    
    [[KTApiClient api] get:API_PATH_HOMEPAGE_CONTENT parameters:parameters success:^(id JSON) {
        [[KTApiClient api] log:JSON];
        KTModelHomePage *homePageInfo = [KTModelHomePage objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:homePageInfo path:API_PATH_HOMEPAGE_CONTENT paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_HOMEPAGE_CONTENT paras:nil]);
    }];
    
}



+ (void)reqTopicList:(NSInteger)category pageIndex:(NSInteger)pageIndex  pageSize:(NSInteger)pageSize  timeInterval:(NSInteger)timeInterval complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"category":@(category),@"pageindex":@(pageIndex),@"pagesize":@(pageSize),@"time":@(timeInterval)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_TOPIC_LIST parameters:parameters success:^(id JSON) {
        [[KTApiClient api] log:JSON];

        KTModelTopics *topics = [KTModelTopics objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:topics path:API_PATH_TOPIC_LIST paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_TOPIC_LIST paras:nil]);
    }];
}


+ (void)reqTopicWithKeyword:(NSString *)keyword  category:(NSInteger)category complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"keyword":keyword,@"category":@(category),@"pageindex":@0,@"pagesize":@MAX_SEARCH_PAGESIZE,@"time":@0};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_SEARCH_TOPIC parameters:parameters success:^(id JSON) {
        KTModelTopics *topics = [KTModelTopics objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:topics path:API_PATH_SEARCH_TOPIC paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_SEARCH_TOPIC paras:nil]);
    }];
}




+ (void)reqTopicListOfUser:(NSInteger)user_id pageIndex:(NSInteger)pageIndex  pageSize:(NSInteger)pageSize   timeInterval:(NSInteger)timeInterval  complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"user_id":@(user_id),@"pageindex":@(pageIndex),@"pagesize":@(pageSize),@"time":@(timeInterval)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_TOPIC_OF_USER parameters:parameters success:^(id JSON) {
        KTModelTopics *topics = [KTModelTopics objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:topics path:API_PATH_SEARCH_TOPIC paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_SEARCH_TOPIC paras:nil]);
    }];
}


+ (void)reqCreateTopic:(NSInteger)category   content:(NSString *)content jpegPath:(NSString *)jpegPath complete:(void (^)(KTApiResponse *response))complete{
    
    KTFormMutilpart *mutilpart = [[KTFormMutilpart alloc] init];
    
    mutilpart.type = KTFormMutilpartTypeFilePath;
    mutilpart.formFileName = @"file";
    mutilpart.formMimeType = @"image/jpeg";
    mutilpart.formName = @"images0";
    mutilpart.data = jpegPath;
    
    NSDictionary *temParams = @{@"category":@(category),@"content":content,@"KTFormMutilpart":mutilpart};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_CREATE_TOPIC parameters:parameters success:^(id JSON) {
        KTModelSuccess *success = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_CREATE_TOPIC paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CREATE_TOPIC paras:nil]);
    }];

    
    
}
+ (void)reqLikeTopic:(NSInteger)topic_id complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"topic_id":@(topic_id)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_LIKE_TOPIC parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_LIKE_TOPIC paras:nil]);
    } failure:^(NSError *error) {
         complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LIKE_TOPIC paras:nil ]);
    }];
}

+ (void)reqDelTopic:(NSInteger)topic_id complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"topic_id":@(topic_id)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_DEL_TOPIC parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_DEL_TOPIC paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_DEL_TOPIC paras:nil]);
    }];

}

+ (void)reqReportTopic:(NSInteger)topic_id WithReportType:(NSString *) rType andType:(NSInteger ) type complete:(void (^)(KTApiResponse *response))complete{
    //1:话题,2:图片,3:话题回复,4:图片回复
    NSDictionary *temParams = @{@"type_id":@(topic_id),@"type":@(type),@"rtype": rType};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_REPORT_CONTENT parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_REPORT_CONTENT paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REPORT_CONTENT paras:nil]);
    }];
}


+ (void)reqReplyList:(long long)topic_id  pageIndex:(NSInteger)pageIndex  pageSize:(NSInteger)pageSize   timeInterval:(NSInteger)timeInterval   complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"topic_id":@(topic_id),@"pageindex":@(pageIndex),@"pagesize":@(pageSize),@"time":@(timeInterval)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_REPLY_LIST parameters:parameters success:^(id JSON) {
        [[KTApiClient api] log:JSON];
        KTModelReplies *replies = [KTModelReplies objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:replies path:API_PATH_REPLY_LIST paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REPLY_LIST paras:nil]);
    }];

}

+ (void)reqCreateReply:(NSInteger)topic_id content:(NSString *)content jpegPath:(NSString *)jpegPath  complete:(void (^)(KTApiResponse *response))complete{
    
    KTFormMutilpart *mutilpart = [[KTFormMutilpart alloc] init];
    
    
    mutilpart.type = KTFormMutilpartTypeFilePath;
    mutilpart.formFileName = @"file";
    mutilpart.formMimeType = @"image/jpeg";
    mutilpart.formName = @"images0";
    mutilpart.data = jpegPath;
    
    NSDictionary *temParams = @{@"content":content,@"KTFormMutilpart":mutilpart,@"topic_id":@(topic_id)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_CREATE_REPLY parameters:parameters success:^(id JSON) {
        KTModelSuccess *success = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_CREATE_REPLY paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CREATE_REPLY paras:nil]);
    }];

}

+ (void)reqLikeReply:(NSInteger)topic_id reply_id:(NSInteger)reply_id complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"reply_id":@(reply_id),@"topic_id":@(topic_id)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_LIKE_REPLY parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_LIKE_REPLY paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LIKE_REPLY paras:nil]);
    }];
}
+ (void)reqDelReply:(NSInteger)topic_id  reply_id:(NSInteger)reply_id complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"reply_id":@(reply_id),@"topic_id":@(topic_id)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_DELETE_REPLY parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_DELETE_REPLY paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_DELETE_REPLY paras:nil]);
    }];
    
    

}
+ (void)reqReportReply:(NSInteger)reply_id  complete:(void (^)(KTApiResponse *response))complete{
    //1:话题,2:图片,3:话题回复,4:图片回复
    NSDictionary *temParams = @{@"type_id":@(reply_id),@"type":@3};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_REPORT_CONTENT parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_REPORT_CONTENT paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REPORT_CONTENT paras:nil]);
    }];
}



+ (void)reqCheckNewTopicWithTimeInterval:(NSInteger)timeInterval complete:(void (^)(KTApiResponse *))complete{
    NSDictionary *params = @{@"time":@(timeInterval)};
    NSMutableDictionary *parameters  = [NSMutableDictionary dictionary];
    [parameters addEntriesFromDictionary:params];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_CHECK_NEW_TOPIC_ACTIVITY parameters:parameters success:^(id JSON) {
        KTModelTopicAcitvityCount *activities = [KTModelTopicAcitvityCount objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:activities path:API_PATH_CHECK_NEW_TOPIC_ACTIVITY paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CHECK_NEW_TOPIC_ACTIVITY paras:nil]);
    }];
}

+ (void)reqFriendsTopicActivityList:(NSInteger)cursor count:(NSInteger)count timeInterval:(NSInteger)timeInterval complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"cursor":@(cursor),@"count":@(count),@"timeInterval":@(timeInterval)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

  
    [[KTApiClient api] get:API_PATH_FRINEND_TOPIC_ACTIVITY_LIST parameters:parameters success:^(id JSON) {
        KTModelFriendActivity *activities = [KTModelFriendActivity objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:activities path:API_PATH_FRINEND_TOPIC_ACTIVITY_LIST paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_FRINEND_TOPIC_ACTIVITY_LIST paras:nil]);
    }];
}
+ (void)reqUserListOfFollowerTopic:(NSInteger)user_id pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize  timeInterval:(NSInteger)timeInterval  complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"pageindex":@(pageIndex),@"pagesize":@(pageSize),@"timeInterval":@(timeInterval)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    if (user_id==0) {
        user_id = [[KTApiClient api] user_id];
      
        
    }
      [parameters addEntriesFromDictionary:@{@"user_id":@(user_id)}];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_LIKERFORUSER parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_FRINEND_TOPIC_ACTIVITY_LIST paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_FRINEND_TOPIC_ACTIVITY_LIST paras:nil]);
    }];
}


@end
